import torch
import torch.nn as nn
from torch.nn import functional as F
from functools import partial
from mamba_ssm.models.config_mamba import MambaConfig
from mamba_ssm.models.mixer_seq_simple import _init_weights, create_block, MixerModel, MambaLMHeadModel
from mamba_ssm.ops.triton.layer_norm import RMSNorm, layer_norm_fn, rms_norm_fn

    
class ContinuousMixer(nn.Module):
    def __init__(
        self,
        d_model,
        d_intermediate,
        nlayers,
        ssm_cfg=None,
        attn_layer=None,
        attn_cfg=None,
        norm_epsilon=1e-5,
        rms_norm=False,
        fused_add_norm=False,
        residual_in_fp32=False,
    ):
        """Initialise a bidirectional SSM backbone.

        Args:
            d_model: Hidden dimension passed to each Mamba block and the
                final normalisation layer.
            d_intermediate: MLP expansion width inside each Mamba block.
            nlayers: Number of Mamba / attention blocks to stack.
            ssm_cfg: Optional dict forwarded to ``create_block`` as SSM
                configuration (e.g. ``{"layer": "Mamba2", "d_state": 64}``).
            attn_layer: Optional int or list of layer indices that should
                use attention instead of SSM.
            attn_cfg: Optional dict with attention hyperparameters
                (``num_heads``, ``d_conv``, ``causal``).
            norm_epsilon: Epsilon for LayerNorm / RMSNorm numerical stability.
            rms_norm: If ``True``, use Triton-fused RMSNorm; otherwise use
                ``nn.LayerNorm``.
            fused_add_norm: If ``True``, fuse the residual add and norm into a
                single Triton kernel (requires Triton to be installed).
            residual_in_fp32: Keep the residual stream in fp32 even when the
                rest of the computation runs in a lower dtype.
        """
        super().__init__()
        self.residual_in_fp32 = residual_in_fp32
        self.fused_add_norm = fused_add_norm
        if self.fused_add_norm:
            if layer_norm_fn is None or rms_norm_fn is None:
                raise ImportError("Failed to import Triton LayerNorm / RMSNorm kernels")

        self.layers = nn.ModuleList(
            [
                create_block(
                    d_model=d_model,
                    d_intermediate=d_intermediate,
                    ssm_cfg=ssm_cfg,
                    attn_layer_idx=attn_layer,
                    attn_cfg=attn_cfg,
                    norm_epsilon=norm_epsilon,
                    rms_norm=rms_norm,
                    residual_in_fp32=residual_in_fp32,
                    fused_add_norm=fused_add_norm,
                    layer_idx=i,
                )
                for i in range(nlayers)
            ]
        )
        self.norm_f = (nn.LayerNorm if not rms_norm else RMSNorm)(
            d_model, eps=norm_epsilon
        )
        self.fused_add_norm_fn = (
                rms_norm_fn if isinstance(self.norm_f, RMSNorm) else layer_norm_fn
        )

    def forward(self, hidden_states, lengths=None, inference_params=None):
        """Run the SSM stack and apply the final normalisation.

        Args:
            hidden_states: Input tensor of shape ``[B, seq_len, d_model]``.
            lengths: Unused; present for interface compatibility.
            inference_params: KV-cache state object passed through to each
                block (used during autoregressive generation).

        Returns:
            Output tensor of shape ``[B, seq_len, d_model]`` after all Mamba
            blocks and the final RMSNorm / LayerNorm.
        """
        residual = None
        for layer in self.layers:
            hidden_states, residual = layer(
                hidden_states, residual, inference_params=inference_params
            )
        if not self.fused_add_norm:
            residual = (
                (hidden_states + residual) if residual is not None else hidden_states
            )
            hidden_states = self.norm_f(residual.to(dtype=self.norm_f.weight.dtype))
        else:
            hidden_states = self.fused_add_norm_fn(
                hidden_states,
                self.norm_f.weight,
                self.norm_f.bias,
                eps=self.norm_f.eps,
                residual=residual,
                prenorm=False,
                residual_in_fp32=self.residual_in_fp32,
            )
        return hidden_states
    
class ForwardModel(nn.Module):
    def __init__(
        self,
        feature_dim,
        output_dim,
        model_dim,
        d_intermediate,
        nlayers,
        input_sequence_length,
        frequency_bins=1,
        attn_layer=None,
        attn_cfg=None,
        ssm_cfg=None,
        rms_norm=True,
        fused_add_norm=True,
        residual_in_fp32=True,
        device="cuda",
        *args,
        **kwargs
    ) -> None:
        """Construct the bidirectional W→S regression model.

        Args:
            feature_dim: Input feature depth (typically 1 — each W value is a
                scalar treated as a 1-D feature vector).
            output_dim: Pooling target dimension (typically 1 — the w_len
                sequence is pooled down to a single token per frequency bin).
            model_dim: Hidden dimension ``d_model`` for the SSM backbone,
                embedding projection, and normalisation layers.
            d_intermediate: MLP expansion width inside each Mamba block.
            nlayers: Number of Mamba2 blocks in ``ContinuousMixer``.
            input_sequence_length: Fixed number of W tokens (``w_len``);
                determines the size of the pooling linear layer.
            frequency_bins: Number of independent frequency evaluation points.
                Produces ``frequency_bins * 3`` output channels (T², sin φ,
                cos φ per bin).
            attn_layer: Optional attention layer indices forwarded to
                ``ContinuousMixer``.
            attn_cfg: Optional attention configuration dict.
            ssm_cfg: Optional SSM configuration dict.
            rms_norm: Enable Triton RMSNorm in the backbone.
            fused_add_norm: Enable fused residual-add-norm kernel.
            residual_in_fp32: Keep residual stream in fp32.
            device: Torch device string (e.g. ``"cuda:0"``).
        """
        super().__init__()
        self.model_type = "Forward"
        self.feature_dim = feature_dim
        self.output_dim = output_dim
        self.model_dim = model_dim
        self.d_intermediate = d_intermediate
        self.nlayers = nlayers
        self.frequency_bins = frequency_bins
        self.rms_norm1 = RMSNorm(model_dim)
        self.rms_norm2 = RMSNorm(model_dim)
        self.input_sequence_length = input_sequence_length
        self.input_proj = nn.Linear(1, model_dim)
        self.channels = 3  # phase sin, phase cos, magnitude
        self.device = device

        self.frequency_embeddings = nn.Embedding(self.frequency_bins, self.model_dim).to(self.device)

        self.mamba_backbone = ContinuousMixer(d_model=model_dim,
                                          d_intermediate=d_intermediate,
                                          nlayers=nlayers,
                                          ssm_cfg=ssm_cfg,
                                          attn_layer=attn_layer,
                                          attn_cfg=attn_cfg,
                                          rms_norm=rms_norm,
                                          fused_add_norm=fused_add_norm,
                                          residual_in_fp32=residual_in_fp32).to(self.device)
        
        self.pooling = nn.Linear(input_sequence_length, output_dim)
        self.mag_decoder = nn.Sequential(
            nn.Linear(model_dim, d_intermediate),
            nn.SiLU(),
            nn.Linear(d_intermediate, output_dim)
        )
        self.phase_decoder = nn.Sequential(
            nn.Linear(model_dim, d_intermediate),
            nn.SiLU(),
            nn.Linear(d_intermediate, 2*output_dim)
        )

    def forward(self, x):
        """W parameters → S parameter predictions.

        Processes the input through two ``ContinuousMixer`` passes (forward and
        reversed) and sums them to form a bidirectional representation, which is
        then pooled, frequency-embedded, and decoded into magnitude and phase.

        Args:
            x: W parameter tensor of shape ``[B, w_len]`` or ``[B, w_len, 1]``.
                Values must be normalised to ``[0, 1]``.

        Returns:
            S parameter tensor of shape ``[B, freq_bins * 3, 1]``.
            Channel order within each bin: ``[ T², sin_φ, cos_φ]``.
        """
        # Embed the input sequence
        if x.dim() == 2:
            x = x.unsqueeze(-1)  # [batch_size, input_length, 1]
        x = self.input_proj(x)
        x = x.contiguous()

        # Get bi-directional representations
        h_f = self.mamba_backbone(x)
        x_rev = x.flip(dims=[1]).contiguous()
        h_b = self.mamba_backbone(x_rev)
        h = h_f + h_b.flip(dims=[1]).contiguous()
        h = self.rms_norm1(h)

        # Pool h
        h = self.pooling(h.transpose(2,1)).transpose(1,2)  # [batch_size, 1, model_dim]
        
        batch_size = h.shape[0]
        # Expand h to [batch_size, freq_bins, model_dim]
        h = h.expand(-1, self.frequency_bins, -1)
        freq_indices = torch.arange(self.frequency_bins, device=self.device).unsqueeze(0).expand(batch_size, -1)
        freq_embeds = self.frequency_embeddings(freq_indices)
        h = h + freq_embeds
        h = self.rms_norm2(h)
        
        mag = self.mag_decoder(h)  # [batch_size, freq_bins, output_dim]
        phase = self.phase_decoder(h)      # [batch_size, freq_bins, 2*output_dim]
        output = torch.cat([mag, phase], dim=-1)      # [batch_size, freq_bins, channels*output_dim]
        output = output.reshape(batch_size, self.frequency_bins * self.channels, 1)
        return output

class MixedEmbedding(nn.Module):
     def __init__(self, float_len, vocab_size, d_model, norm_epsilon=1e-4, **factory_kwargs):
         """Embed a hybrid sequence of float S-parameter and integer W tokens.

         The first ``float_len`` positions are continuous float values embedded
         via a learned ``Linear(1 → d_model)`` projection.  Subsequent positions
         are discrete integer W-token indices looked up in an ``Embedding`` table.
         A Triton RMSNorm is applied to the combined result.

         Args:
             float_len: Number of float tokens at the start of each sequence
                 (equal to ``s_len`` — the number of S-parameter channels).
             vocab_size: Vocabulary size for the integer W token embedding
                 (``= (max_w - min_w) / w_interval + 1``, typically 81).
             d_model: Hidden dimension for all embeddings.
             norm_epsilon: Epsilon for the final Triton RMSNorm.
             **factory_kwargs: ``device`` and ``dtype`` forwarded to
                 ``nn.Embedding`` for device / dtype placement.
         """
         super(MixedEmbedding, self).__init__()
         self.float_len = float_len  # Number of float tokens at the beginning
         self.d_model = d_model
         self.vocab_size = vocab_size
         # Embedding layer for floats: processes each float individually
         self.float_embed = nn.Linear(1, d_model)
         # Embedding layer for integers
         self.int_embed = nn.Embedding(vocab_size, d_model, **factory_kwargs)
         self.rms_norm = RMSNorm(d_model, eps=norm_epsilon)

     def forward(self, input_sequence):
        """Embed a batch of hybrid sequences.

        Handles three input configurations:

        1. **Full sequence** (``seq_len > float_len``): embeds both float and
           integer portions and concatenates along the sequence dimension.
        2. **KV-cache step** (``seq_len == 1`` and ``not training``): embeds a
           single integer W token using the integer embedding table only.
        3. **Float-only prefix** (``seq_len == float_len``): embeds only the
           S-parameter float tokens (used during the prompt-encoding phase).

        Args:
            input_sequence: Tensor of shape ``[B, seq_len]`` or
                ``[B, seq_len, 1]``.  Float tokens must be pre-normalised to
                ``[0, 1]``; integer tokens must be in ``[0, vocab_size - 1]``.

        Returns:
            Embedding tensor of shape ``[B, seq_len, d_model]`` after RMSNorm.
        """
        # Remove the last dimension if there are 3 or more dimensions
        if input_sequence.dim() > 2:
            input_sequence = input_sequence.squeeze(-1)  # [batch_size, seq_len]

        # Split into float_tokens and int_tokens
        float_tokens = input_sequence[:, :self.float_len]  # [batch_size, float_len]
        float_tokens = float_tokens.unsqueeze(-1).float()
        float_embeddings = self.float_embed(float_tokens)

        if (input_sequence.size(1) > self.float_len):
            int_tokens = input_sequence[:, self.float_len:].long()    # [batch_size, seq_len - float_len]
            assert (int_tokens >= 0).all() and (int_tokens < self.vocab_size).all(), "Invalid input indices"
            int_embeddings = self.int_embed(int_tokens)
            # Concatenate the float and integer embeddings along the sequence dimension
            embeddings = torch.cat([float_embeddings, int_embeddings], dim=1)  # [batch_size, seq_len, d_model]
        # NOTE: We use KV cache in inference, so after first processing the float tokens, we only need to process the int tokens one by one
        elif input_sequence.size(1) == 1 and not self.training:
            int_tokens = input_sequence[:, :].long()
            assert (int_tokens >= 0).all() and (int_tokens < self.vocab_size).all(), "Invalid input indices"
            embeddings = self.int_embed(int_tokens)
        else:
            embeddings = float_embeddings
        
        embeddings = self.rms_norm(embeddings)
 
        return embeddings
 
class MetaMixerModel(MixerModel):
    def __init__(
        self,
        d_model: int,
        n_layer: int,
        d_intermediate: int,
        float_len: int,
        vocab_size: int,
        ssm_cfg=None,
        attn_layer_idx=None,
        attn_cfg=None,
        norm_epsilon: float = 1e-4,
        rms_norm: bool = False,
        initializer_cfg=None,
        fused_add_norm=False,
        residual_in_fp32=False,
        device=None,
        dtype=None,
    ) -> None:
        """Construct the inverse model backbone.

        Subclasses ``mamba_ssm.MixerModel`` and replaces its standard token
        embedding with ``MixedEmbedding`` so that the first ``float_len``
        positions accept continuous float values (S parameters) while the
        remaining positions use a discrete integer embedding table (W tokens).

        Args:
            d_model: Hidden dimension for all SSM blocks.
            n_layer: Number of Mamba / attention blocks.
            d_intermediate: MLP expansion width inside each block.
            float_len: Number of continuous float tokens at the start of each
                sequence (``s_len``).
            vocab_size: Discrete vocabulary size for W tokens.
            ssm_cfg: Optional SSM configuration dict.
            attn_layer_idx: Optional list of layer indices to replace with
                attention.
            attn_cfg: Optional attention configuration dict.
            norm_epsilon: Epsilon for RMSNorm layers.
            rms_norm: Use Triton RMSNorm if ``True``.
            initializer_cfg: Optional dict for weight initialisation.
            fused_add_norm: Use fused residual-add-norm kernel.
            residual_in_fp32: Keep residual in fp32.
            device: Device for parameter placement.
            dtype: Dtype for parameter placement.
        """
        super().__init__(
            d_model,
            n_layer,
            d_intermediate,
            vocab_size,
            ssm_cfg,
            attn_layer_idx,
            attn_cfg,
            norm_epsilon,
            rms_norm,
            initializer_cfg,
            fused_add_norm,
            residual_in_fp32,
            device,
            dtype,
        )
        factory_kwargs = {"device": device, "dtype": dtype}
        self.embedding = MixedEmbedding(
            float_len=float_len, 
            vocab_size=vocab_size, 
            d_model=d_model, 
            norm_epsilon=norm_epsilon,
            **factory_kwargs
        ).to(device)

class MetaMambaLMHeadModel(MambaLMHeadModel):
    def tie_weights(self):
        """Tie the LM-head weights to the integer W-token embedding table.

        When ``config.tie_embeddings`` is ``True``, sets
        ``self.lm_head.weight`` to share the same parameter tensor as
        ``self.backbone.embedding.int_embed.weight``.  This halves the
        parameter count for the output projection and enforces consistency
        between the input W-token embedding and the output logit space.
        """
        if self.config.tie_embeddings:
            self.lm_head.weight = self.backbone.embedding.int_embed.weight

    def __init__(
        self,
        config: MambaConfig,
        initializer_cfg=None,
        device=None,
        dtype=None,
        **kwargs,
    ) -> None:
        """Construct the S→W causal language model.

        Bypasses ``MambaLMHeadModel.__init__`` entirely and calls
        ``nn.Module.__init__`` directly to avoid instantiating a throwaway
        standard ``MixerModel``.  The backbone is a ``MetaMixerModel`` (with
        ``MixedEmbedding``) and the LM head is a bias-free linear projection
        onto the W vocabulary.

        Args:
            config: ``MambaConfig`` specifying architecture hyperparameters
                (``d_model``, ``n_layer``, ``d_intermediate``, ``vocab_size``,
                ``ssm_cfg``, etc.).
            initializer_cfg: Optional dict forwarded to ``_init_weights``
                (e.g. ``{"initializer_range": 0.02,
                "rescale_prenorm_residual": True}``).
            device: Device for parameter placement.
            dtype: Dtype for parameter placement.
            **kwargs: Extra keyword arguments:
                - ``s_len`` *(int)*: Number of float S-parameter tokens;
                  defaults to 3.
                - ``norm_epsilon`` *(float)*: RMSNorm epsilon; defaults to 1e-4.
        """
        # Don't call super().__init__() to avoid creating throwaway MixerModel
        # Instead, manually initialize what we need from MambaLMHeadModel
        nn.Module.__init__(self)
        self.config = config
        
        # Adjust vocab_size if necessary
        vocab_size = config.vocab_size
        if vocab_size % config.pad_vocab_size_multiple != 0:
            vocab_size += config.pad_vocab_size_multiple - (vocab_size % config.pad_vocab_size_multiple)

        factory_kwargs = {"device": device, "dtype": dtype}
        
        # Create our custom backbone with MetaMixerModel
        self.backbone = MetaMixerModel(
            d_model=config.d_model,
            n_layer=config.n_layer,
            d_intermediate=config.d_intermediate,
            vocab_size=vocab_size,
            float_len=kwargs.get("s_len", 3),
            ssm_cfg=config.ssm_cfg,
            attn_layer_idx=config.attn_layer_idx,
            attn_cfg=config.attn_cfg,
            norm_epsilon=kwargs.get("norm_epsilon", 1e-4),
            rms_norm=config.rms_norm,
            initializer_cfg=initializer_cfg,
            fused_add_norm=config.fused_add_norm,
            residual_in_fp32=config.residual_in_fp32,
            device=device,
            dtype=dtype,
        )
        
        # Initialize the lm_head
        self.lm_head = nn.Linear(config.d_model, vocab_size, bias=False, **factory_kwargs)

        # Initialize weights
        self.apply(
            partial(
                _init_weights,
                n_layer=config.n_layer,
                **(initializer_cfg if initializer_cfg is not None else {}),
            )
        )
        self.tie_weights()