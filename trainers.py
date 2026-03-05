import torch
import os
import tqdm
import numpy as np
import logging
import csv
from pathlib import Path
from torch.amp.grad_scaler import GradScaler
from torch.amp.autocast_mode import autocast
import yaml
import math
from collections import namedtuple
from utils import w_to_tokens, tokens_to_w, norm_sin_cos_to_phase_deg

# Named tuple for validation metrics
ValidationMetrics = namedtuple('ValidationMetrics', ['val_loss', 's_mae'])


def _setup_amp(use_amp: bool, device: str) -> tuple:
    """Setup automatic mixed precision training.
    
    Returns:
        tuple: (amp_dtype, scaler) where amp_dtype is torch.bfloat16, torch.float16, or None
    """
    if not use_amp:
        return None, GradScaler(enabled=False)
    
    is_cuda = torch.cuda.is_available()
    supports_bf16 = is_cuda and torch.cuda.is_bf16_supported()
    
    if supports_bf16:
        return torch.bfloat16, GradScaler(enabled=False)
    else:
        return torch.float16, GradScaler(enabled=True)


def _restore_rng_state(trainer_state: dict) -> None:
    """Restore CPU and CUDA RNG states from trainer checkpoint."""
    if 'rng_state' in trainer_state:
        try:
            torch.set_rng_state(trainer_state['rng_state'])
        except Exception as e:
            print(f"Warning: Could not restore CPU RNG state: {e}")
    
    if 'cuda_rng_state' in trainer_state and torch.cuda.is_available():
        try:
            torch.cuda.set_rng_state(trainer_state['cuda_rng_state'])
        except Exception as e:
            print(f"Warning: Could not restore CUDA RNG state: {e}")


def _setup_logger(output_dir: str, name: str) -> logging.Logger:
    """Setup file-based logging."""
    log_file = os.path.join(output_dir, 'training.log')
    logger = logging.getLogger(name)
    logger.setLevel(logging.INFO)
    logger.handlers = []  # Remove existing handlers
    
    # File handler
    fh = logging.FileHandler(log_file)
    fh.setLevel(logging.INFO)
    
    # Console handler
    sh = logging.StreamHandler()
    sh.setLevel(logging.INFO)
    
    # Formatter
    formatter = logging.Formatter('%(asctime)s - %(levelname)s - %(message)s')
    fh.setFormatter(formatter)
    sh.setFormatter(formatter)
    
    logger.addHandler(fh)
    logger.addHandler(sh)
    return logger

class ForwardTrainer:
    def __init__(self, model, train_loader, val_loader, test_loader, config, output_dir):
        self.model = model.to(config["device"])
        self.train_loader = train_loader
        self.val_loader = val_loader
        self.test_loader = test_loader
        self.device = config["device"]
        self.epochs = config["epochs"]
        self.lr_patience = config["lr_patience"]
        self.termination_lr = config["termination_lr"]
        self.output_dir = output_dir
        self.frequency_bins = int(config.get("frequency_bins", 1))
        self.s_len = config['s_len']
        self.frequency_bins = config['frequency_bins']
        self.grad_clip = config.get('gradient_clip', 1.0)

        self.optimizer = torch.optim.AdamW(model.parameters(), lr=config["lr"], weight_decay=0.01)
        self.scheduler = torch.optim.lr_scheduler.ReduceLROnPlateau(
        self.optimizer, mode='min', factor=config["reduce_lr_factor"], patience=self.lr_patience)

        self.loss_fn = torch.nn.MSELoss()
        self.best_val_loss = float("inf")
        
        # Setup logging
        self._setup_logging()
        self.metrics_file = os.path.join(output_dir, 'training_metrics.csv')
        self._init_metrics_file()
    
    def train(self):
        self.logger.info("Training Started")
        self.logger.info(f"Model: {self.model.__class__.__name__}")
        self.logger.info(f"Total parameters: {sum(p.numel() for p in self.model.parameters())}")
        
        for epoch in range(1, self.epochs + 1):
            self.model.train()
            train_loss = 0

            for x_batch, y_batch in self.train_loader:
                x_batch, y_batch = x_batch.to(self.device), y_batch.to(self.device)
                self.optimizer.zero_grad()
                pred = self.model(x_batch)
                loss = self.loss_fn(pred, y_batch)
                loss.backward()
                # Clip gradients before stepping
                if self.grad_clip is not None and self.grad_clip > 0:
                    torch.nn.utils.clip_grad_norm_(self.model.parameters(), self.grad_clip)
                self.optimizer.step()
                train_loss += loss.item()

            train_loss /= len(self.train_loader)

            val_loss = self.validate()

            current_lr = self.optimizer.param_groups[0]["lr"]
            self.logger.info(f"[Epoch {epoch}] Train: {train_loss:.4f}, Val: {val_loss:.4f}, LR: {current_lr:.2e}")
            self._log_metrics(epoch, train_loss, val_loss, current_lr)
            
            self.scheduler.step(val_loss)

            if val_loss < self.best_val_loss:
                self.best_val_loss = val_loss
                self.save_model()
                print(f"New best model saved: {val_loss:.4f}")

            if self.optimizer.param_groups[0]["lr"] < self.termination_lr:
                print("Early stopping due to low LR.")
                break

    def validate(self):
        self.model.eval()
        val_loss = 0

        with torch.no_grad():
            for x_batch, y_batch in self.val_loader:
                x_batch, y_batch = x_batch.to(self.device), y_batch.to(self.device)
                pred = self.model(x_batch)
                val_loss += self.loss_fn(pred, y_batch).item()

        return val_loss / len(self.val_loader)

    def test(self):
        self.model.load_state_dict(torch.load(f"{self.output_dir}/best_model.pth"))
        self.model.eval()
        test_loss = 0
        # Accumulators for additional metrics
        total_phase_abs_diff = 0.0  # in degrees
        total_t2_abs_diff = 0.0     # absolute difference in [0,1]
        n_samples = 0

        with torch.no_grad():
            for x_batch, y_batch in self.test_loader:
                x_batch, y_batch = x_batch.to(self.device), y_batch.to(self.device)
                pred = self.model(x_batch)
                # MSE
                test_loss += self.loss_fn(pred, y_batch).item()

                # --- Additional metrics: abs phase diff (deg) and abs T^2 diff ---
                # Expected shape: [B, 3*frequency_bins, 1] for both y_batch and pred
                y_seq = y_batch.squeeze(-1)
                p_seq = pred.squeeze(-1)
                expected_len = self.frequency_bins * 3
                if y_seq.dim() != 2 or y_seq.size(1) != expected_len:
                    raise ValueError(f"Expected y_batch shape [B,{expected_len},1], got {tuple(y_batch.shape)}")
                if p_seq.dim() != 2 or p_seq.size(1) != expected_len:
                    raise ValueError(f"Expected pred shape [B,{expected_len},1], got {tuple(pred.shape)}")

                # Clamp to valid range for normalized values
                y_seq = torch.clamp(y_seq, 0.0, 1.0)
                p_seq = torch.clamp(p_seq, 0.0, 1.0)

                # Layout: [T2_1..T2_F, sin1, cos1, sin2, cos2, ...]
                t2_true = y_seq[:, :self.frequency_bins]
                t2_pred = p_seq[:, :self.frequency_bins]
                phase_true = y_seq[:, self.frequency_bins:]
                phase_pred = p_seq[:, self.frequency_bins:]

                sin_true = phase_true[:, 0::2]
                cos_true = phase_true[:, 1::2]
                sin_pred = phase_pred[:, 0::2]
                cos_pred = phase_pred[:, 1::2]

                # Compute angles in degrees from normalized sin/cos
                phase_true_deg = norm_sin_cos_to_phase_deg(sin_true, cos_true)
                phase_pred_deg = norm_sin_cos_to_phase_deg(sin_pred, cos_pred)

                # Minimum absolute angular difference in [0,180]
                delta = phase_pred_deg - phase_true_deg
                # Use torch.remainder for proper positive modulus
                wrapped = torch.remainder(delta + 180.0, 360.0) - 180.0
                abs_phase_diff = torch.abs(wrapped)

                # Absolute difference for T^2
                abs_t2_diff = torch.abs(t2_pred - t2_true)

                # Accumulate sums
                total_phase_abs_diff += abs_phase_diff.sum().item()
                total_t2_abs_diff += abs_t2_diff.sum().item()
                n_samples += y_seq.size(0)

        # Averages
        test_loss /= len(self.test_loader)
        denom = max(1, n_samples * self.frequency_bins)
        mean_phase_abs_deg = total_phase_abs_diff / denom
        mean_t2_abs = total_t2_abs_diff / denom

        # Log test results to file
        test_results_file = os.path.join(self.output_dir, 'test_results.txt')
        with open(test_results_file, 'w') as f:
            f.write(f"Test Loss: {test_loss:.4f}\n")
            f.write(f"Abs Phase Diff (deg): {mean_phase_abs_deg:.4f}\n")
            f.write(f"Abs T^2 Diff: {mean_t2_abs:.4f}\n")
        
        self.logger.info(f"Test Loss: {test_loss:.4f} | Abs Phase Diff (deg): {mean_phase_abs_deg:.4f} | Abs T^2 Diff: {mean_t2_abs:.4f}")
    
    def _setup_logging(self):
        """Setup file-based logging."""
        self.logger = _setup_logger(self.output_dir, __name__ + ".ForwardTrainer")
    
    def _init_metrics_file(self):
        """Initialize CSV file for metrics tracking."""
        with open(self.metrics_file, 'w', newline='') as f:
            writer = csv.writer(f)
            writer.writerow(['epoch', 'train_loss', 'val_loss', 'lr', 'best_val_loss'])
    
    def _log_metrics(self, epoch, train_loss, val_loss, lr):
        """Log metrics to CSV file."""
        with open(self.metrics_file, 'a', newline='') as f:
            writer = csv.writer(f)
            writer.writerow([epoch, train_loss, val_loss, lr, self.best_val_loss])
        
    def save_model(self):
        torch.save(self.model.state_dict(), os.path.join(self.output_dir, "best_model.pth"))
        
        
class MetaMambaCausalTrainer:
    def __init__(self, model, train_loader, val_loader, test_loader, config, output_dir, forward_model=None):
        self.model = model.to(config["device"])
        self.train_loader = train_loader
        self.val_loader = val_loader
        self.test_loader = test_loader
        self.device = config["device"]
        self.epochs = config["epochs"]
        self.output_dir = output_dir
        self.config = config
        
        # W parameter discretization settings
        self.min_w_value = config.get('min_w_value', 0.0)
        self.max_w_value = config.get('max_w_value', 80.0)
        self.w_interval = config.get('w_interval', 1.0)
        self.s_param_len = config['s_len']
        self.w_param_len = config['w_len']
        self.lr_patience = config.get("lr_patience", 2)
        self.early_stopping_metric = config.get("early_stopping_metric", "s_mae")
        self.early_stopping_patience = config.get("early_stopping_patience", 4)
        self.model_saving_metric = config.get("model_saving_metric", "s_mae")
        self.termination_lr = config.get("termination_lr", 1e-5)
        
        # Setup AMP
        self.use_amp = config.get("use_amp", False)
        self.amp_dtype, self.scaler = _setup_amp(self.use_amp, str(self.device))

        # Forward model for validation
        self.forward_model = forward_model.eval() if forward_model else None

        # Setup logging
        self.logger = _setup_logger(output_dir, __name__ + ".MetaMambaCausalTrainer")

        # Initialize optimizer and scheduler
        self._initialize_optimizer_and_scheduler()

        # Loss function
        self.loss_fn = torch.nn.CrossEntropyLoss(ignore_index=-100)
        
        # Validate and configure metrics for model saving and early stopping
        allowed_metrics = {'val_loss', 's_mae'}
        
        if self.model_saving_metric not in allowed_metrics:
            raise ValueError(f"model_saving_metric must be one of {allowed_metrics}, got '{self.model_saving_metric}'")
        if self.early_stopping_metric not in allowed_metrics:
            raise ValueError(f"early_stopping_metric must be one of {allowed_metrics}, got '{self.early_stopping_metric}'")
        
        self.logger.info(f"Using {self.early_stopping_metric} for early stopping (patience: {self.early_stopping_patience})")
        self.logger.info(f"Using {self.model_saving_metric} for best model selection")
        
        # Consolidated best metric tracking
        self.best_metrics = {
            'val_loss': float('inf'),
            's_mae': float('inf'),
        }
        self.early_stopping_counter = 0
        
        self.metrics_file = os.path.join(output_dir, 'training_metrics.csv')
        self._init_metrics_file()
    
    def _init_metrics_file(self):
        """Initialize CSV file for metrics tracking."""
        with open(self.metrics_file, 'w', newline='') as f:
            writer = csv.writer(f)
            writer.writerow(['epoch', 'train_loss', 'val_loss', 's_mae', 'lr'])
    
    def _log_metrics(self, epoch, train_loss, metrics: ValidationMetrics, lr):
        """Log metrics to CSV file."""
        with open(self.metrics_file, 'a', newline='') as f:
            writer = csv.writer(f)
            writer.writerow([epoch, train_loss, metrics.val_loss, metrics.s_mae, lr])
    
    def _initialize_optimizer_and_scheduler(self):
        """Helper method to initialize optimizer and scheduler based on self.model and self.config."""
        # Separate parameters for weight decay
        decay_params = []
        no_decay_params = []
        for name, param in self.model.named_parameters():
            if not param.requires_grad: # Skip parameters that don't require gradients
                continue
            if 'norm' in name or 'bias' in name or 'embedding' in name:
                no_decay_params.append(param)
            else:
                decay_params.append(param)

        # Optimizer with research-recommended settings
        self.optimizer = torch.optim.AdamW([
            {'params': decay_params, 'weight_decay': self.config.get('weight_decay', 0.01)},
            {'params': no_decay_params, 'weight_decay': 0.0}
        ], lr=self.config["lr"], betas=(0.9, 0.95))

        # Set up scheduler
        self.scheduler = torch.optim.lr_scheduler.ReduceLROnPlateau(
            self.optimizer,
            mode='min',
            factor=self.config.get("reduce_lr_factor", 0.1),
            patience=self.lr_patience
        )
        self.logger.info("Optimizer and Scheduler initialized.")

    def _load_checkpoint(self, checkpoint_dir: str):
        """Load model state dict from checkpoint directory."""
        model_path = os.path.join(checkpoint_dir, "pytorch_model.bin")
        if not os.path.exists(model_path):
            raise FileNotFoundError(f"No checkpoint found at {model_path}")
        
        self.logger.info(f"Loading model from {model_path}...")
        state_dict = torch.load(model_path, map_location=self.device)
        self.model.load_state_dict(state_dict)
        self.logger.info(f"Successfully loaded model")
        return self.model

    def train(self, resume_from=None):
        self.logger.info("Training Started")

        start_epoch = 1
        if resume_from and os.path.isdir(resume_from):
            # Load model
            try:
                self.model = self._load_checkpoint(resume_from)
                # Re-initialize optimizer AFTER loading model
                self.logger.info("Re-initializing optimizer and scheduler for loaded model...")
                self._initialize_optimizer_and_scheduler()
            except Exception as e:
                self.logger.error(f"Failed to load model from checkpoint: {e}")
                return

            # Load trainer state (optimizer, scheduler, RNG, etc.)
            trainer_state_path = os.path.join(resume_from, 'trainer_state.pth')
            if os.path.exists(trainer_state_path):
                self.logger.info(f"Loading trainer state from {trainer_state_path}...")
                trainer_state = torch.load(trainer_state_path, map_location=self.device)

                try:
                    self.optimizer.load_state_dict(trainer_state['optimizer_state_dict'])
                    self.scheduler.load_state_dict(trainer_state['scheduler_state_dict'])
                    if 'scaler_state_dict' in trainer_state:
                        self.scaler.load_state_dict(trainer_state['scaler_state_dict'])
                    
                    # Restore best metrics
                    if 'best_metrics' in trainer_state:
                        self.best_metrics = trainer_state['best_metrics']
                    
                    start_epoch = trainer_state.get('epoch', 0) + 1
                    
                    # Restore RNG states
                    _restore_rng_state(trainer_state)
                    
                    self.logger.info(f"Resumed training state from epoch {start_epoch-1}")
                except Exception as e:
                    self.logger.error(f"Error loading optimizer/scheduler state: {e}")
                    self.logger.warning("Continuing without loading full trainer state")
            else:
                self.logger.warning(f"Trainer state file not found at {trainer_state_path}. Starting from epoch 1")
                start_epoch = 1

        # Training loop
        self.logger.info(f"Starting training from epoch {start_epoch} up to epoch {self.epochs}...")
        for epoch in range(start_epoch, self.epochs + 1):
            # Train for one epoch
            train_loss = self._train_epoch(epoch)
            # Validate
            metrics = self._validate()
            
            # Current learning rate
            current_lr = self.optimizer.param_groups[0]["lr"]
            
            # Log metrics
            self.logger.info(f"[Epoch {epoch}/{self.epochs}] Train: {train_loss:.4f}, Val: {metrics.val_loss:.4f}, LR: {current_lr:.2e}, S_MAE: {metrics.s_mae:.4f}")
            self._log_metrics(epoch, train_loss, metrics, current_lr)
            
            # Update best metrics and check for improvement
            current_metric_values = {
                'val_loss': metrics.val_loss,
                's_mae': metrics.s_mae,
            }
            
            # Check for early stopping improvement BEFORE updating best_metrics
            early_stop_metric_val = current_metric_values[self.early_stopping_metric]
            if early_stop_metric_val < self.best_metrics[self.early_stopping_metric]:
                self.best_metrics[self.early_stopping_metric] = early_stop_metric_val
                self.early_stopping_counter = 0
            else:
                self.early_stopping_counter += 1
                self.logger.info(
                    f"No improvement in {self.early_stopping_metric}. "
                    f"Patience: {self.early_stopping_counter}/{self.early_stopping_patience}"
                )
            
            # Save best model based on model_saving_metric (check independently)
            model_metric_val = current_metric_values[self.model_saving_metric]
            if model_metric_val < self.best_metrics[self.model_saving_metric]:
                self.best_metrics[self.model_saving_metric] = model_metric_val
                self.logger.info(f"New best {self.model_saving_metric}: {model_metric_val:.4f}. Saving checkpoint.")
                self.save_trainer_state(os.path.join(self.output_dir, "best_checkpoint"), epoch, train_loss, metrics.val_loss)
                torch.save(self.model.state_dict(), os.path.join(self.output_dir, "best_model.pth"))
            
            # Early stopping checks
            if self.early_stopping_counter >= self.early_stopping_patience:
                self.logger.info(f"Early stopping triggered after {self.early_stopping_patience} epochs with no improvement.")
                break
            
            if self.optimizer.param_groups[0]['lr'] < self.termination_lr:
                self.logger.info(f"Learning rate has fallen below termination threshold. Stopping training.")
                break
    
    def save_trainer_state(self, directory, epoch, train_loss=None, val_loss=None):
        """Save training state for resumption"""
        os.makedirs(directory, exist_ok=True)
        
        cuda_rng_state_to_save = None
        if torch.cuda.is_available():
            try:
                cuda_rng_state_to_save = torch.cuda.get_rng_state()
            except Exception as e:
                self.logger.warning(f"Could not get CUDA RNG state: {e}")

        trainer_state = {
            'epoch': epoch,
            'optimizer_state_dict': self.optimizer.state_dict(),
            'scheduler_state_dict': self.scheduler.state_dict(),
            'scaler_state_dict': self.scaler.state_dict(),
            'best_metrics': self.best_metrics,
            'train_loss': train_loss,
            'val_loss': val_loss,
            'rng_state': torch.get_rng_state(),
            'cuda_rng_state': cuda_rng_state_to_save
        }
        torch.save(trainer_state, os.path.join(directory, 'trainer_state.pth'))
    
    def _train_epoch(self, epoch):
        self.model.train()
        total_loss = 0
        batch_count = 0

        for batch_idx, batch in enumerate(self.train_loader):
            self.optimizer.zero_grad()

            # Get input sequence
            sequence_batch = batch[0].to(self.device)
            # Handle tensor shape - add dimension if needed
            if len(sequence_batch.shape) == 2:
                sequence_batch = sequence_batch.unsqueeze(-1)

            # Prepare input and target sequences for causal LM
            input_sequence = sequence_batch[:, :-1, :].clone()  # [batch_size, seq_len-1, 1]
            target_sequence = sequence_batch[:, 1:, :].clone()  # [batch_size, seq_len-1, 1]
            
            # Mask out the S values in the target sequence with -100
            target_sequence[:, :-self.w_param_len, :] = -100
            target_sequence = target_sequence.squeeze(-1).long()
                        
            with autocast(enabled=self.use_amp, device_type='cuda', dtype=self.amp_dtype):
                output = self.model(input_ids=input_sequence)
                logits = output.logits
                
                # Compute cross entropy loss
                loss = self.loss_fn(
                    logits.reshape(-1, logits.size(-1)),
                    target_sequence.reshape(-1)
                )

            # Backward pass with gradient scaling
            self.scaler.scale(loss).backward()
            self.scaler.unscale_(self.optimizer)

            # Clip gradients
            torch.nn.utils.clip_grad_norm_(self.model.parameters(), max_norm=1.0)

            # Optimizer step
            self.scaler.step(self.optimizer)
            self.scaler.update()
            
            # Update statistics
            total_loss += loss.item()
            batch_count += 1

        avg_loss = total_loss / max(batch_count, 1)
        return avg_loss

    def _validate(self) -> ValidationMetrics:
        self.model.eval()
        total_loss = 0
        batch_count = 0
        total_s_mae = 0.0

        with torch.no_grad():
            for batch_idx, batch in enumerate(self.val_loader):
                sequence_batch = batch[0].to(self.device)

                # Handle tensor shape
                if len(sequence_batch.shape) == 2:
                    sequence_batch = sequence_batch.unsqueeze(-1)

                # Prepare input and target sequences
                input_sequence = sequence_batch[:, :-1, :].clone()
                target_sequence = sequence_batch[:, 1:, :].clone()
                target_sequence[:, :-self.w_param_len, :] = -100
                target_sequence = target_sequence.squeeze(-1).long()

                output = self.model(input_ids=input_sequence)
                logits = output.logits

                # Compute loss
                loss = self.loss_fn(
                    logits.reshape(-1, logits.size(-1)),
                    target_sequence.reshape(-1)
                )

                total_loss += loss.item()
                batch_count += 1

                # Evaluate with forward model if available
                if self.forward_model is not None:
                    input_s_values = input_sequence[:, :self.s_param_len, :].squeeze(-1)

                    generated_output = self.model.generate(
                         input_ids=input_s_values,
                         max_length=self.config['seq_len'],
                         top_k=1,
                         temperature=1.0
                    )
                    w_pred_tokens = generated_output[:, -self.w_param_len:]
                    w_pred_values = tokens_to_w(w_pred_tokens, self.min_w_value, self.w_interval)
                    w_pred_normalized = (w_pred_values - self.min_w_value) / (self.max_w_value - self.min_w_value)

                    predicted_s_values = self.forward_model(w_pred_normalized.unsqueeze(-1)).squeeze(-1)
                    predicted_s_values = torch.clamp(predicted_s_values, 0.0, 1.0)
                    predicted_s_values = predicted_s_values[:, :self.s_param_len]

                    s_mae_batch = torch.nn.functional.l1_loss(predicted_s_values, input_s_values)
                    total_s_mae += s_mae_batch.item()

        avg_loss = total_loss / max(batch_count, 1)
        avg_s_mae = total_s_mae / max(batch_count, 1)
        
        self.scheduler.step(avg_loss)
        
        return ValidationMetrics(avg_loss, avg_s_mae)
    

    def test(self, checkpoint_dir=None):
        """Evaluate model on test set. If checkpoint_dir is None, uses current model state."""
        if checkpoint_dir is None:
            checkpoint_dir = os.path.join(self.output_dir, "best_checkpoint")
        
        self.model = self._load_checkpoint(checkpoint_dir)
        self.model.to(self.device).eval()

        # Use existing forward model
        forward_model = self.forward_model
        has_forward_model = forward_model is not None
        if has_forward_model:
            forward_model.to(self.device).eval()

        total_loss = 0
        total_tokens = 0
        total_correct = 0
        total_s_mae = 0.0
        batch_count = 0

        all_w_true = []
        all_w_pred_gen = []
        all_s_true_list = []
        all_s_pred_list = []

        with torch.no_grad():
            for batch_idx, batch in enumerate(tqdm.tqdm(self.test_loader, desc="Testing")):
                sequence_batch = batch[0].to(self.device)
                batch_size = sequence_batch.shape[0]

                if len(sequence_batch.shape) == 2:
                    sequence_batch = sequence_batch.unsqueeze(-1)

                input_sequence = sequence_batch[:, :-1, :].clone()
                target_sequence = sequence_batch[:, 1:, :].clone()

                s_params_true = sequence_batch[:, :self.s_param_len, :]
                w_params_true = sequence_batch[:, self.s_param_len:, :]
                w_tokens_true = target_sequence[:, self.s_param_len-1:, :].squeeze(-1).long()

                # Forward pass for loss calculation
                output = self.model(input_ids=input_sequence)
                all_logits = output.logits
                w_logits = all_logits[:, -self.w_param_len:, :]

                ce_loss = self.loss_fn(
                    w_logits.reshape(-1, w_logits.size(-1)),
                    w_tokens_true.reshape(-1)
                )
                total_loss += ce_loss.item() * batch_size

                # Compute accuracy metrics
                predicted_tokens_logits = w_logits.argmax(dim=-1)
                current_batch_tokens = w_tokens_true.numel()
                current_batch_correct = (predicted_tokens_logits == w_tokens_true).sum().item()
                total_tokens += current_batch_tokens
                total_correct += current_batch_correct

                # Generation
                prompt_s_values = s_params_true.squeeze(-1)
                generated_output = self.model.generate(
                    input_ids=prompt_s_values,
                    max_length=self.s_param_len + self.w_param_len,
                    top_k=1,
                    temperature=1.0,
                    eos_token_id=None
                )
                generated_w_tokens = generated_output[:, self.s_param_len:]

                # Convert tokens to values
                w_true_values = w_params_true.squeeze(-1).cpu()
                w_pred_values_gen = tokens_to_w(generated_w_tokens, self.min_w_value, self.w_interval).cpu()

                all_w_true.append(w_true_values)
                all_w_pred_gen.append(w_pred_values_gen)
                
                s_true_cpu = s_params_true.squeeze(-1).cpu()
                all_s_true_list.append(s_true_cpu)

                # Evaluate with forward model if available
                if has_forward_model:
                    w_pred_for_forward = w_pred_values_gen.to(self.device)
                    w_pred_normalized = (w_pred_for_forward - self.min_w_value) / (self.max_w_value - self.min_w_value)
                    w_pred_normalized = torch.clamp(w_pred_normalized, 0.0, 1.0).unsqueeze(-1)

                    s_pred = forward_model(w_pred_normalized).squeeze(-1)
                    s_pred = torch.clamp(s_pred, 0.0, 1.0)[:, :self.s_param_len]

                    s_mae_batch = torch.nn.functional.l1_loss(s_pred, s_params_true.squeeze(-1))
                    total_s_mae += s_mae_batch.item()

                    all_s_pred_list.append(s_pred.cpu())

                batch_count += 1

        # Calculate metrics
        num_test_samples = len(self.test_loader.dataset) if self.test_loader.dataset else 0
        avg_loss = total_loss / max(num_test_samples, 1)
        accuracy = (100 * total_correct / total_tokens) if total_tokens > 0 else 0

        all_w_true = torch.cat(all_w_true, dim=0).numpy() if all_w_true else np.array([])
        all_w_pred_gen = torch.cat(all_w_pred_gen, dim=0).numpy() if all_w_pred_gen else np.array([])
        within_one = np.mean(np.abs(all_w_true - all_w_pred_gen) <= 1.0) * 100 if all_w_true.size > 0 else 0

        avg_s_mae = total_s_mae / max(batch_count, 1)

        all_s_true_np = torch.cat(all_s_true_list, dim=0).numpy() if all_s_true_list else np.array([])
        all_s_pred_np = torch.cat(all_s_pred_list, dim=0).numpy() if all_s_pred_list else np.array([])

        # Log results
        print(f"\nTest Results:")
        print(f"Loss: {avg_loss:.4f}")
        print(f"Token Accuracy: {accuracy:.2f}%")
        print(f"W Predictions within 1.0: {within_one:.2f}%")

        if has_forward_model:
            print(f"S MAE: {avg_s_mae:.8f}")

        test_results_file = os.path.join(self.output_dir, 'test_results.txt')
        with open(test_results_file, 'w') as f:
            f.write(f"Test Loss: {avg_loss:.4f}\n")
            f.write(f"Token Accuracy: {accuracy:.2f}%\n")
            f.write(f"W Predictions within 1.0: {within_one:.2f}%\n")
            if has_forward_model:
                f.write(f"S MAE: {avg_s_mae:.8f}\n")
        
        self.logger.info(f"Test results saved to {test_results_file}")

        results = {
            'loss': avg_loss,
            'accuracy': accuracy,
            'w_within_one_gen': within_one,
            'w_true': all_w_true,
            'w_pred_gen': all_w_pred_gen,
        }

        if has_forward_model:
            results.update({
                's_mae': avg_s_mae,
                's_true': all_s_true_np,
                's_pred': all_s_pred_np,
            })

        return results

class FineTuneForwardTrainer:
    def __init__(self, model, high_fid_loaders, low_fid_loaders, config, output_dir):
        """
        high_fid_loaders: dict with keys train/val/test -> DataLoader
        low_fid_loaders: dict with optional keys train/eval (eval can be subset) -> DataLoader or None
        config: expects added keys:
            fine_tune_mode: 'heads' | 'full'
            head_lr, backbone_lr (if full)
            alpha_weighted_val
            rehearsal_lambda
            rehearsal_interval (every N high-fid batches include 1 low-fid batch)
            scheduler_ft: 'cosine' | 'plateau'
            warmup_ratio
        """
        self.model = model.to(config['device'])
        self.high_train = high_fid_loaders['train']
        self.high_val = high_fid_loaders['val']
        self.high_test = high_fid_loaders['test']
        self.low_train = low_fid_loaders.get('train') if low_fid_loaders else None
        self.low_val = low_fid_loaders.get('val') if low_fid_loaders else None
        self.low_test = low_fid_loaders.get('test') if low_fid_loaders else None
        self.cfg = config
        self.device = config['device']
        self.output_dir = output_dir
        self.epochs = config.get('ft_epochs', 100)
        self.alpha = config.get('alpha_weighted_val', 0.7)
        self.rehearsal_lambda = config.get('rehearsal_lambda', 0.2)
        self.rehearsal_interval = config.get('rehearsal_interval', 2)
        self.grad_clip = config.get('gradient_clip', 1.0)
        self.mode = config.get('fine_tune_mode', 'heads')
        self.use_amp = config.get('use_amp', False)
        self.scaler = GradScaler(enabled=self.use_amp)
        self.best_high = math.inf
        self.best_weighted = math.inf
        self.best_high_path = os.path.join(self.output_dir, 'best_high.pth')
        self.best_weighted_path = os.path.join(self.output_dir, 'best_weighted.pth')
        self.loss_fn = torch.nn.MSELoss()
        self._freeze_setup()
        self._build_optimizer_scheduler()
        self.history = []
        
        # Setup logging
        self._setup_logging()
        self.metrics_file = os.path.join(self.output_dir, 'training_metrics.csv')
        self._init_metrics_file()
    
    def _setup_logging(self):
        self.logger = _setup_logger(self.output_dir, __name__ + ".FineTuneForwardTrainer")
    
    def _init_metrics_file(self):
        """Initialize CSV file for metrics tracking."""
        with open(self.metrics_file, 'w', newline='') as f:
            writer = csv.writer(f)
            writer.writerow(['epoch', 'high_train_mse', 'high_train_mae', 'low_train_mse', 'low_train_mae',
                           'high_val_mse', 'high_val_mae', 'low_val_mse', 'low_val_mae', 'weighted_val_mse'])
    
    def _freeze_setup(self):
        if self.mode == 'heads':
            # freeze everything except decoders
            for name, p in self.model.named_parameters():
                p.requires_grad = False
            for head_name in ['mag_decoder', 'phase_decoder']:
                if hasattr(self.model, head_name):
                    for p in getattr(self.model, head_name).parameters():
                        p.requires_grad = True
            # optionally unfreeze final RMSNorm for adaptation
            if self.cfg.get('unfreeze_final_norm', False) and hasattr(self.model, 'rms_norm2'):
                for p in self.model.rms_norm2.parameters():
                    p.requires_grad = True
        elif self.mode == 'full':
            # all trainable, but we will apply differential LR
            for p in self.model.parameters():
                p.requires_grad = True
        else:
            raise ValueError(f"Unknown fine_tune_mode {self.mode}")

    def _build_optimizer_scheduler(self):
        params = []
        if self.mode == 'heads':
            head_lr = self.cfg.get('head_lr', 3e-3)
            heads = []
            for head_name in ['mag_decoder', 'phase_decoder']:
                if hasattr(self.model, head_name):
                    heads += list(getattr(self.model, head_name).parameters())
            if self.cfg.get('unfreeze_final_norm', False) and hasattr(self.model, 'rms_norm2'):
                heads += list(self.model.rms_norm2.parameters())
            params.append({'params': heads, 'lr': head_lr, 'weight_decay': self.cfg.get('head_weight_decay', 1e-4)})
        else:  # full
            backbone_lr = self.cfg.get('backbone_lr', 1e-4)
            head_lr = self.cfg.get('head_lr', 5e-4)
            backbone, heads = [], []
            for name, p in self.model.named_parameters():
                if not p.requires_grad:
                    continue
                if any(h in name for h in ['mag_decoder', 'phase_decoder']):
                    heads.append(p)
                else:
                    backbone.append(p)
            params.append({'params': heads, 'lr': head_lr, 'weight_decay': self.cfg.get('head_weight_decay', 1e-4)})
            params.append({'params': backbone, 'lr': backbone_lr, 'weight_decay': self.cfg.get('backbone_weight_decay', 0.01)})
        self.optimizer = torch.optim.AdamW(params, betas=(0.9,0.95))

        self.scheduler_type = 'plateau' if self.mode == 'heads' else 'cosine'
        self.scheduler_type = self.cfg.get('scheduler_ft', self.scheduler_type)
        if self.scheduler_type == 'cosine':
            total_steps = self.epochs * len(self.high_train)
            warmup_steps = int(self.cfg.get('warmup_ratio', 0.1) * total_steps)
            def lr_lambda(step):
                if step < warmup_steps:
                    return float(step) / float(max(1,warmup_steps))
                progress = (step - warmup_steps)/float(max(1,total_steps - warmup_steps))
                cosine = 0.5*(1+math.cos(math.pi*progress))
                min_scale = 1/50.0  # final LR ~ base/50
                return cosine*(1-min_scale)+min_scale
            self.scheduler = torch.optim.lr_scheduler.LambdaLR(self.optimizer, lr_lambda)
        else:
            self.scheduler = torch.optim.lr_scheduler.ReduceLROnPlateau(self.optimizer, mode='min', factor=0.2, patience=self.cfg.get('plateau_patience',8), min_lr=self.cfg.get('min_lr',1e-5))

    def _forward_batch(self, x):
        x = x.to(self.device)
        return self.model(x)

    def _compute_loss(self, pred, target):
        return self.loss_fn(pred, target)

    def _run_epoch(self, epoch):
        self.model.train()
        high_loader = self.high_train
        low_iter = iter(self.low_train) if self.low_train is not None else None
        device_type = 'cuda' if 'cuda' in self.device else 'cpu'
        total_high_loss = 0.0
        total_low_loss = 0.0
        steps = 0
        for batch_idx, (w_high, s_high) in enumerate(high_loader):
            self.optimizer.zero_grad(set_to_none=True)
            with autocast(device_type=device_type, enabled=self.use_amp): # on L30/L40 GPUs
            # with autocast(enabled=self.use_amp): # Other GPUs
                pred_high = self._forward_batch(w_high)
                loss_high = self._compute_loss(pred_high, s_high.to(self.device))
                loss = loss_high
                low_loss_val = torch.tensor(0.0, device=self.device)
                if self.low_train is not None and (batch_idx+1)%self.rehearsal_interval==0:
                    if low_iter is None:
                        low_iter = iter(self.low_train)
                    try:
                        w_low, s_low = next(low_iter)
                    except StopIteration:
                        low_iter = iter(self.low_train)
                        w_low, s_low = next(low_iter)
                    pred_low = self._forward_batch(w_low)
                    loss_low = self._compute_loss(pred_low, s_low.to(self.device))
                    low_loss_val = loss_low
                    loss = loss_high + self.rehearsal_lambda * loss_low
            if self.use_amp:
                self.scaler.scale(loss).backward()
                if self.grad_clip is not None:
                    self.scaler.unscale_(self.optimizer)
                    torch.nn.utils.clip_grad_norm_(self.model.parameters(), self.grad_clip)
                self.scaler.step(self.optimizer)
                self.scaler.update()
            else:
                loss.backward()
                if self.grad_clip is not None:
                    torch.nn.utils.clip_grad_norm_(self.model.parameters(), self.grad_clip)
                self.optimizer.step()
            if self.scheduler_type=='cosine':
                self.scheduler.step()
            total_high_loss += loss_high.item()
            total_low_loss += low_loss_val.item()
            steps += 1
        return total_high_loss/steps, (total_low_loss/ (steps/self.rehearsal_interval) if self.low_train is not None else 0.0)

    def _evaluate_loader(self, loader):
        self.model.eval()
        total_mse = 0.0
        total_mae = 0.0
        count = 0
        with torch.no_grad():
            for w,s in loader:
                pred = self._forward_batch(w)
                mse = torch.nn.functional.mse_loss(pred, s.to(self.device)).item()
                mae = torch.nn.functional.l1_loss(pred, s.to(self.device)).item()
                total_mse += mse
                total_mae += mae
                count +=1
        avg_mse = total_mse / max(1,count)
        avg_mae = total_mae / max(1,count)
        return avg_mse, avg_mae

    def _validate(self, epoch):
        high_val_mse, high_val_mae = self._evaluate_loader(self.high_val)
        if self.low_val is not None:
            low_val_mse, low_val_mae = self._evaluate_loader(self.low_val)
        else:
            low_val_mse, low_val_mae = 0.0, 0.0
        weighted = self.alpha*high_val_mse + (1-self.alpha)*low_val_mse if self.low_val is not None else high_val_mse
        if self.scheduler_type=='plateau':
            # drive by high fidelity primary metric
            self.scheduler.step(high_val_mse)
        
        improved_high = high_val_mse < self.best_high
        improved_weighted = weighted < self.best_weighted
        if improved_high:
            self.best_high = high_val_mse
            torch.save(self.model.state_dict(), self.best_high_path)
        if improved_weighted:
            self.best_weighted = weighted
            torch.save(self.model.state_dict(), self.best_weighted_path)
        return high_val_mse, low_val_mse, weighted, improved_high, improved_weighted, high_val_mae, low_val_mae

    def train(self):
        print(f"Starting fine-tuning mode={self.mode} epochs={self.epochs}")
        for epoch in range(1, self.epochs+1):
            high_train_mse, low_train_mse = self._run_epoch(epoch)
            # For train MAE, re-evaluate on train splits (costly, but accurate)
            high_train_mae = self._evaluate_loader(self.high_train)[1]
            low_train_mae = self._evaluate_loader(self.low_train)[1] if self.low_train is not None else 0.0
            high_val_mse, low_val_mse, weighted, ih, iw, high_val_mae, low_val_mae = self._validate(epoch)
            self.history.append({
                'epoch':epoch,
                'high_train_mse':high_train_mse,
                'high_train_mae':high_train_mae,
                'low_train_mse':low_train_mse,
                'low_train_mae':low_train_mae,
                'high_val_mse':high_val_mse,
                'high_val_mae':high_val_mae,
                'low_val_mse':low_val_mse,
                'low_val_mae':low_val_mae,
                'weighted_val_mse':weighted
            })
            
            # Log to CSV
            with open(self.metrics_file, 'a', newline='') as f:
                writer = csv.writer(f)
                writer.writerow([epoch, high_train_mse, high_train_mae, low_train_mse, low_train_mae,
                               high_val_mse, high_val_mae, low_val_mse, low_val_mae, weighted])
            
            self.logger.info(f"Epoch {epoch}: high_train_mse={high_train_mse:.4e} high_train_mae={high_train_mae:.4e} low_train_mse={low_train_mse:.4e} low_train_mae={low_train_mae:.4e} | high_val_mse={high_val_mse:.4e} high_val_mae={high_val_mae:.4e} low_val_mse={low_val_mse:.4e} low_val_mae={low_val_mae:.4e} weighted={weighted:.4e} {'*' if ih or iw else ''}")

    def evaluate_test(self):
        # Load best weighted checkpoint if exists
        path = self.best_weighted_path if os.path.exists(self.best_weighted_path) else self.best_high_path
        ckpt = torch.load(path, map_location=self.device)
        self.model.load_state_dict(ckpt)
        high_test_mse, high_test_mae = self._evaluate_loader(self.high_test)
        if self.low_test is not None:
            low_test_mse, low_test_mae = self._evaluate_loader(self.low_test)
        else:
            low_test_mse, low_test_mae = None, None
        
        # Log test results to file
        test_results_file = os.path.join(self.output_dir, 'test_results.txt')
        with open(test_results_file, 'w') as f:
            f.write(f"Test: high_fid MSE={high_test_mse:.4e} MAE={high_test_mae:.4e}\\n")
            if low_test_mse is not None:
                f.write(f"Test: low_fid MSE={low_test_mse:.4e} MAE={low_test_mae:.4e}\\n")
        
        self.logger.info(f"Test: high_fid MSE={high_test_mse:.4e} MAE={high_test_mae:.4e}" + (f" low_fid MSE={low_test_mse:.4e} MAE={low_test_mae:.4e}" if low_test_mse is not None else ''))
        return high_test_mse, high_test_mae, low_test_mse, low_test_mae
