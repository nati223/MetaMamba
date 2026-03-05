import ast
import os
import random
from typing import Optional, Sequence, Tuple, Dict
import numpy as np
import torch
import yaml
from mamba_ssm.models.config_mamba import MambaConfig
from tqdm import tqdm


# ==================== Training Utilities ====================

def set_seed(seed: int) -> None:
    """
    Set random seeds for reproducibility across all libraries.
    
    Args:
        seed: Random seed value
    """
    torch.manual_seed(seed)
    np.random.seed(seed)
    random.seed(seed)
    if torch.cuda.is_available():
        torch.cuda.manual_seed(seed)
        torch.cuda.manual_seed_all(seed)
        torch.backends.cudnn.deterministic = True
        torch.backends.cudnn.benchmark = False


def validate_config(config: Dict, mode: str = 'training', strict: bool = False) -> Tuple[Dict, list]:
    """
    Validate and normalize configuration dictionary.
    
    Auto-calculates derived fields and checks for inconsistencies:
    - s_len = frequency_bins × channels (if not present)
    - seq_len = w_len + s_len (if not present)
    
    Args:
        config: Configuration dictionary
        mode: Validation mode - 'training', 'loading', or 'evaluation'
        strict: If True, raise errors on inconsistencies; if False, only warn
        
    Returns:
        Tuple of (validated_config, list_of_warnings)
        
    Raises:
        ValueError: If critical validation fails (in strict mode)
    """
    warnings = []
    validated = config.copy()
    
    # ==================== Auto-calculate derived fields ====================
    
    # Calculate s_len from frequency_bins and channels
    if 'frequency_bins' in validated and 'channels' in validated:
        calculated_s_len = validated['frequency_bins'] * validated['channels']
        
        if 's_len' in validated:
            if validated['s_len'] != calculated_s_len:
                msg = f"s_len mismatch: config has {validated['s_len']}, but frequency_bins × channels = {calculated_s_len}"
                if strict and mode == 'training':
                    raise ValueError(msg)
                warnings.append(msg)
        else:
            validated['s_len'] = calculated_s_len
            if mode == 'training':
                warnings.append(f"Auto-calculated s_len = {calculated_s_len} (frequency_bins × channels)")
    
    # Calculate seq_len from w_len and s_len
    if 'w_len' in validated and 's_len' in validated:
        calculated_seq_len = validated['w_len'] + validated['s_len']
        
        if 'seq_len' in validated:
            if validated['seq_len'] != calculated_seq_len:
                msg = f"seq_len mismatch: config has {validated['seq_len']}, but w_len + s_len = {calculated_seq_len}"
                if strict and mode == 'training':
                    raise ValueError(msg)
                warnings.append(msg)
        else:
            validated['seq_len'] = calculated_seq_len
            if mode == 'training':
                warnings.append(f"Auto-calculated seq_len = {calculated_seq_len} (w_len + s_len)")
    
    # ==================== Required fields check ====================
    
    if mode == 'training':
        required = ['device', 'runs_dir', 'seed', 'epochs', 'batch_size', 'lr',
                   'w_len', 'frequency_bins', 'channels', 'd_model', 'd_intermediate',
                   'nlayers', 'ssm_cfg', 'min_w_value', 'max_w_value', 'w_interval']
        missing = [f for f in required if f not in validated]
        if missing:
            raise ValueError(f"Missing required training config fields: {missing}")
    
    elif mode == 'loading':
        # Minimal fields needed to instantiate models
        required = ['w_len', 's_len', 'seq_len', 'd_model', 'nlayers']
        missing = [f for f in required if f not in validated]
        if missing and strict:
            raise ValueError(f"Missing required model config fields: {missing}")
        elif missing:
            warnings.append(f"Missing optional fields for model loading: {missing}")
    
    # ==================== Range and consistency checks ====================
    
    # Check split ratios sum to <= 1.0
    if all(k in validated for k in ['train_ratio', 'val_ratio', 'test_ratio']):
        total = validated['train_ratio'] + validated['val_ratio'] + validated['test_ratio']
        if not (0.99 <= total <= 1.01):  # Allow small floating point errors
            msg = f"train_ratio + val_ratio + test_ratio = {total:.3f}, should be ≈ 1.0"
            if strict and mode == 'training':
                raise ValueError(msg)
            warnings.append(msg)
    
    # Check learning rate is positive
    if 'lr' in validated and validated['lr'] <= 0:
        raise ValueError(f"Learning rate must be positive, got {validated['lr']}")
    
    # Check epochs is positive
    if 'epochs' in validated and validated['epochs'] <= 0:
        raise ValueError(f"Epochs must be positive, got {validated['epochs']}")
    
    # Check W parameter range
    if 'min_w_value' in validated and 'max_w_value' in validated:
        if validated['min_w_value'] >= validated['max_w_value']:
            raise ValueError(f"min_w_value ({validated['min_w_value']}) must be < max_w_value ({validated['max_w_value']})")
    
    # Check w_interval is positive
    if 'w_interval' in validated and validated['w_interval'] <= 0:
        raise ValueError(f"w_interval must be positive, got {validated['w_interval']}")
    
    # Calculate and validate vocabulary size
    if all(k in validated for k in ['min_w_value', 'max_w_value', 'w_interval']):
        vocab_size = int((validated['max_w_value'] - validated['min_w_value']) / validated['w_interval']) + 1
        if vocab_size <= 0:
            raise ValueError(f"Calculated vocabulary size is {vocab_size}, must be positive")
        if vocab_size > 100000:
            warnings.append(f"Large vocabulary size: {vocab_size}. Consider increasing w_interval.")
    
    # ==================== Path existence checks (strict mode only) ====================
    
    if strict and mode == 'training':
        if 'data_path' in validated and not os.path.exists(validated['data_path']):
            warnings.append(f"Training data path does not exist: {validated['data_path']}")
        
        if 'forward_model_path' in validated and validated['forward_model_path']:
            if not os.path.exists(validated['forward_model_path']):
                warnings.append(f"Forward model path does not exist: {validated['forward_model_path']}")
    
    return validated, warnings


def load_config(config_path: str = 'config.yaml', validate: bool = False, 
                mode: str = 'training', strict: bool = False) -> Dict:
    """
    Load configuration from YAML file with optional validation.
    
    Args:
        config_path: Path to configuration file
        validate: Whether to validate the config after loading
        mode: Validation mode - 'training', 'loading', or 'evaluation'
        strict: If True, raise errors on validation issues
        
    Returns:
        Configuration dictionary (validated if validate=True)
    """
    if not os.path.exists(config_path):
        raise FileNotFoundError(f"Config file not found: {config_path}")
    
    with open(config_path, 'r') as f:
        config = yaml.safe_load(f)
    
    if validate:
        config, warnings = validate_config(config, mode=mode, strict=strict)
        for warning in warnings:
            print(f"Config warning: {warning}")
    
    return config


def get_matching_config_path(checkpoint_path: str) -> Optional[str]:
    """
    Given a checkpoint path (file or directory), return the matching config.yaml path if it exists.
    
    Args:
        checkpoint_path: Path to checkpoint file or directory
    Returns:
        Path to config.yaml if found, else None
    """
    ckpt_dir = checkpoint_path if os.path.isdir(checkpoint_path) else os.path.dirname(checkpoint_path)
    candidate = os.path.join(ckpt_dir, "config.yaml")
    if os.path.exists(candidate):
        return candidate
    return None

def setup_output_directory(base_dir: str, run_name: str, config: Dict, 
                          save_config: bool = True) -> str:
    """
    Create output directory and optionally save configuration.
    
    Args:
        base_dir: Base directory for runs
        run_name: Name for this specific run
        config: Configuration dictionary to save
        save_config: Whether to save config.yaml
        
    Returns:
        Path to created output directory
    """
    output_dir = os.path.join(base_dir, run_name)
    os.makedirs(output_dir, exist_ok=True)
    
    if save_config:
        config_path = os.path.join(output_dir, 'config.yaml')
        with open(config_path, 'w') as f:
            yaml.dump(config, f)
    
    return output_dir


# ==================== Model Loading Utilities ====================

def get_device(device: Optional[str] = None) -> torch.device:
    """Return a torch.device, honoring CUDA availability and optional string."""
    dev = torch.device(device) if device is not None else torch.device("cuda" if torch.cuda.is_available() else "cpu")
    if dev.type == "cuda":
        torch.cuda.set_device(dev)
    return dev


def w_to_tokens(w_values: torch.Tensor | np.ndarray, min_w: float, w_interval: float) -> torch.Tensor:
    """Convert W values to discrete token indices."""
    w = torch.as_tensor(w_values)
    tokens = torch.round((w - min_w) / w_interval).long()
    return tokens


def tokens_to_w(token_indices: torch.Tensor | np.ndarray, min_w: float, w_interval: float) -> torch.Tensor:
    """Convert token indices back to W values."""
    tokens = torch.as_tensor(token_indices)
    return min_w + tokens.float() * w_interval


def normalize_w(w_values: torch.Tensor | np.ndarray, min_w: float, max_w: float) -> torch.Tensor:
    """Normalize W values to [0,1]."""
    w = torch.as_tensor(w_values).float()
    return (w - min_w) / (max_w - min_w)


def phase_deg_to_sin_cos_norm(phase_deg: torch.Tensor | np.ndarray) -> Tuple[torch.Tensor, torch.Tensor]:
    """Convert phase degrees to normalized sin/cos in [0,1]."""
    phase = torch.as_tensor(phase_deg).float()
    rad = torch.deg2rad(phase)
    sin = (torch.sin(rad) + 1.0) / 2.0
    cos = (torch.cos(rad) + 1.0) / 2.0
    return sin, cos


def norm_sin_cos_to_phase_deg(sin_norm: torch.Tensor | np.ndarray, cos_norm: torch.Tensor | np.ndarray) -> torch.Tensor:
    """Convert normalized sin/cos in [0,1] back to phase degrees in [0,360)."""
    sin = torch.as_tensor(sin_norm).float() * 2.0 - 1.0
    cos = torch.as_tensor(cos_norm).float() * 2.0 - 1.0
    sin = torch.clamp(sin, -1.0, 1.0)
    cos = torch.clamp(cos, -1.0, 1.0)
    rad = torch.atan2(sin, cos)
    deg = torch.rad2deg(rad)
    deg = (deg + 360.0) % 360.0
    return deg


def _load_weights_into_model(
    model: torch.nn.Module,
    checkpoint_path: str,
    device: torch.device,
) -> None:
    if os.path.isdir(checkpoint_path):
        candidates: Sequence[str] = [
            os.path.join(checkpoint_path, "pytorch_model.bin"),
            os.path.join(checkpoint_path, "best_model.pth"),
            os.path.join(checkpoint_path, "model.pt"),
        ]
    else:
        candidates = [checkpoint_path]
    weights_path = next((p for p in candidates if os.path.exists(p)), None)
    if weights_path is None:
        raise FileNotFoundError(f"No checkpoint file found among: {candidates}")
    print(f"Loading checkpoint from: {weights_path}")
    state = torch.load(weights_path, map_location=device)
    if isinstance(state, dict) and "state_dict" in state:
        state = state["state_dict"]
    if isinstance(state, dict) and "model_state_dict" in state:
        state = state["model_state_dict"]
    model.load_state_dict(state, strict=False)
    model.eval()


def load_forward_model(
    checkpoint_path: Optional[str] = None,
    config: Optional[Dict] = None,
    config_path: Optional[str] = None,
    device: Optional[str] = None,
) -> torch.nn.Module:
    """
    Load or create ForwardModel.
    
    Args:
        config: Configuration dictionary. Required if checkpoint_path is None.
        checkpoint_path: Path to checkpoint file or directory. If provided, loads weights.
        config_path: Path to config file. Auto-detected from checkpoint_path if not provided.
        device: Device to place model on.
    
    Returns:
        ForwardModel instance (in eval mode if loaded from checkpoint)
    
    Examples:
        # Create new model from config
        model = load_forward_model(config=config, device='cuda:0')
        
        # Load from checkpoint directory
        model = load_forward_model(checkpoint_path='runs/model_dir', device='cuda:0')
        
        # Load from checkpoint file with separate config
        model = load_forward_model(checkpoint_path='model.pt', config_path='config.yaml')
    """
    from Models import ForwardModel

    dev = get_device(device)

    if config is None:
        if config_path is None and checkpoint_path:
            config_path = get_matching_config_path(checkpoint_path)
        if config_path:
            with open(config_path, "r") as f:
                config = yaml.safe_load(f)
    
    if config is None:
        raise ValueError("Either 'config' dict or 'checkpoint_path' with nearby config.yaml must be provided")
    
    # Validate leniently for backwards compatibility
    config, _ = validate_config(config, mode='loading', strict=False)

    # Create model from config
    model = ForwardModel(
        feature_dim=config["feature_dim"],
        output_dim=config["output_dim"],
        model_dim=config["d_model"],
        d_intermediate=config["d_intermediate"],
        nlayers=config["nlayers"],
        input_sequence_length=config["w_len"],
        ssm_cfg=config["ssm_cfg"],
        attn_layer=config.get("attn_layer_idx"),
        attn_cfg=config.get("attn_cfg"),
        fused_add_norm=config.get("fused_add_norm", True),
        residual_in_fp32=config.get("residual_in_fp32", True),
        norm_epsilon=config.get("norm_epsilon", 1e-5),
        frequency_bins=config.get("frequency_bins", 1),
        dropout=config.get("dropout", 0.0),
        device=dev,
    ).to(dev)

    if checkpoint_path is not None:
        _load_weights_into_model(model, checkpoint_path, dev)

    return model


def load_inverse_model(
    checkpoint_path: Optional[str] = None,
    config: Optional[Dict] = None,
    config_path: Optional[str] = None,
    device: Optional[str] = None,
) -> torch.nn.Module:
    """
    Load or create MetaMambaLMHeadModel (inverse S→W model).
    
    Args:
        config: Configuration dictionary. Required if checkpoint_path is None.
        checkpoint_path: Path to checkpoint file or directory. If provided, loads weights.
        config_path: Path to config file. Auto-detected from checkpoint_path if not provided.
        device: Device to place model on.
    
    Returns:
        MetaMambaLMHeadModel instance (in eval mode if loaded from checkpoint)
    
    Examples:
        # Create new model from config
        model = load_inverse_model(config=config, device='cuda:0')
        
        # Load from checkpoint directory
        model = load_inverse_model(checkpoint_path='runs/model_dir', device='cuda:0')
    """
    from Models import MetaMambaLMHeadModel

    dev = get_device(device)
    
    # Determine config source
    if config is None:
        if config_path is None and checkpoint_path:
            config_path = get_matching_config_path(checkpoint_path)
        if config_path:
            with open(config_path, "r") as f:
                config = yaml.safe_load(f)
    
    if config is None:
        raise ValueError("Either 'config' dict or 'checkpoint_path' with nearby config.yaml must be provided")
    
    # Validate leniently for backwards compatibility
    config, _ = validate_config(config, mode='loading', strict=False)

    # Calculate vocabulary size
    min_w = config.get("min_w_value", 0.0)
    max_w = config.get("max_w_value", 80.0)
    w_interval = config.get("w_interval", 1.0)
    vocab_size = int((max_w - min_w) / w_interval) + 1

    # Create Mamba config
    mcfg = MambaConfig(
        d_model=config["d_model"],
        d_intermediate=config["d_intermediate"],
        n_layer=config["nlayers"],
        vocab_size=vocab_size,
        ssm_cfg=config["ssm_cfg"],
        attn_layer_idx=config.get("attn_layer_idx"),
        attn_cfg=config.get("attn_cfg"),
        rms_norm=config.get("rms_norm", True),
        residual_in_fp32=config.get("residual_in_fp32", True),
        fused_add_norm=config.get("fused_add_norm", True),
        pad_vocab_size_multiple=config.get("pad_vocab_size_multiple", 1),
        tie_embeddings=True,
    )
    setattr(mcfg, "norm_epsilon", config.get("norm_epsilon", 1e-4))

    # Create model
    model = MetaMambaLMHeadModel(
        config=mcfg,
        initializer_cfg=config.get("initializer_cfg"),
        s_len=config.get("s_len", 3),
        device=dev,
        dtype=torch.float32,
    )
    
    if checkpoint_path is not None:
        _load_weights_into_model(model, checkpoint_path, dev)

    return model

def predict_s_from_w(
    forward_model: torch.nn.Module,
    w_values: np.ndarray,
    min_w: float,
    max_w: float,
    device: Optional[str] = None,
    clamp: bool = True,
) -> np.ndarray:
    """Run forward model on W values (unnormalized) and return S predictions as numpy."""
    dev = get_device(device)
    forward_model = forward_model.to(dev).eval()
    w_tensor = torch.as_tensor(w_values, dtype=torch.float32, device=dev).unsqueeze(-1)
    w_norm = normalize_w(w_tensor, min_w, max_w)
    with torch.no_grad():
        s_pred = forward_model(w_norm).squeeze(-1)
    if clamp:
        s_pred = torch.clamp(s_pred, 0.0, 1.0)
    return s_pred.cpu().numpy()


# ==================== Candidate Selection Utilities ====================

def parse_generated_w_field(value: object) -> np.ndarray:
    """Robustly parse a CSV field representing generated W tokens or values.

    Accepts Python tuple/list strings (e.g. "(1, 2, 3)") or actual sequences.
    Returns a 1D numpy array (dtype int if all ints else float).
    """
    # If already a sequence (list/tuple/ndarray), convert directly
    if isinstance(value, (list, tuple, np.ndarray)):
        arr = np.array(value)
    else:
        # Try to safely evaluate string representations
        try:
            arr = np.array(ast.literal_eval(str(value)))
        except Exception:
            # Fallback: try stripping parentheses and splitting
            try:
                s = str(value).strip()
                if s.startswith('(') and s.endswith(')'):
                    s = s[1:-1]
                parts = [p.strip() for p in s.split(',') if p.strip()]
                arr = np.array([float(p) for p in parts])
            except Exception:
                raise ValueError(f"Unable to parse generated W field: {value}")

    # Infer dtype: if all close to integers, return ints
    if np.issubdtype(arr.dtype, np.floating):
        if np.all(np.equal(np.mod(arr, 1), 0)):
            arr = arr.astype(int)
    return arr


def tokens_matrix_from_df(df, col: str = 'generated_w_tokens') -> np.ndarray:
    """Return an (N, w_len) int numpy array parsed from dataframe `col`.

    Uses `parse_generated_w_field` for robust parsing.
    """
    rows = []
    for v in df[col].tolist():
        arr = parse_generated_w_field(v)
        rows.append(arr.astype(int))
    # Pad or validate shapes
    max_len = max(len(r) for r in rows) if rows else 0
    mat = np.zeros((len(rows), max_len), dtype=int)
    for i, r in enumerate(rows):
        mat[i, : len(r)] = r
    return mat


def split_by_phase_bins(df, phase_col: str = 'predicted_phi', n_bins: int = 8):
    """Assign `phase_bin` column to `df` dividing [0,360) into `n_bins` equal bins.

    Returns a dict mapping bin_index -> dataframe slice (view via ``df[df['phase_bin']==bin]``).
    """
    if phase_col not in df.columns:
        raise KeyError(f"Phase column '{phase_col}' not in DataFrame")
    binsize = 360.0 / float(n_bins)
    # Normalize phi into [0,360)
    phi_norm = (df[phase_col].astype(float) % 360.0)
    df = df.copy()
    df['phase_bin'] = (phi_norm // binsize).astype(int)
    # Ensure last value maps to n_bins-1 when phi==360 (should be modded above)
    bins = {i: df[df['phase_bin'] == i] for i in range(n_bins)}
    return df, bins


def cluster_w_matrix(w_matrix: np.ndarray, n_clusters: int, random_state: Optional[int] = None):
    """Run KMeans on integer token matrix `w_matrix` (N, w_len).

    Returns (labels, centroids) where labels is length-N int array and centroids is (k, w_len) float array.
    """
    from sklearn.cluster import KMeans

    n_samples = w_matrix.shape[0]
    k = min(n_clusters, max(1, n_samples))
    if k == 1:
        labels = np.zeros(n_samples, dtype=int)
        centroids = np.array([w_matrix.mean(axis=0)])
        return labels, centroids

    km = KMeans(n_clusters=k, random_state=random_state, n_init=10)
    labels = km.fit_predict(w_matrix)
    return labels, km.cluster_centers_