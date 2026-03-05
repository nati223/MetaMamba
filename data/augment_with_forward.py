import os
# add parent directory to path
import sys
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
import argparse
import numpy as np
import pandas as pd
from tqdm import tqdm
import os
from scipy.stats import qmc
import torch
from utils import get_device, get_matching_config_path, load_forward_model, load_config, normalize_w


def augment_inverse_training_data(
    forward_model_path,
    config_path=None,
    output_path=None,
    W_min=0, 
    W_max=80,
    W_step=1.0,
    sample_dim=5,
    num_samples=100000,
    num_samples_sym=0,
    batch_size=1024,
    device=None,
):
    """
    Generate training data for inverse model by sampling the parameter space using Sobol sequences
    and using a trained forward model to create input-output pairs.
    Optionally oversamples regions with high T_square values.
    
    Args:
        forward_model_path (str): Path to the trained forward model weights
        config_path (str): Path to the config.yaml used by the forward model
        output_path (str, optional): Path to save the generated dataset. If None, 
            saves to the same directory as forward_model_path with filename 'inverse_training_data.csv'
        W_min (float): Minimum value for W parameters
        W_max (float): Maximum value for W parameters
        W_step (float): Step size for discretizing W parameters
        sample_dim (int): Dimensionality of the W parameter space
        num_samples (int): Number of samples to generate
        num_samples_sym (int): Number of symmetric samples to generate (W1=W5, W2=W4)
        batch_size (int): Batch size for forward model inference
        device (torch.device): Device to use for computations
    Returns:
        str: Path where the generated dataset was saved
    """

    device = get_device(device)
    
    config_path = config_path or get_matching_config_path(forward_model_path)
    config = load_config(config_path, validate=True, mode='loading', strict=False)

    # Create forward model instance (handles checkpoint loading)
    model = load_forward_model(forward_model_path, config_path=config_path, device=str(device))
    model.eval()
    
    # Determine output path
    if output_path is None:
        model_dir = os.path.dirname(forward_model_path)
        output_path = os.path.join(model_dir, 'inverse_training_data.csv')
        
    # W bounds from config
    W_min = config.get('min_w_value', W_min)
    W_max = config.get('max_w_value', W_max)

    # Calculate the number of possible values for each W parameter
    num_w_values = int((W_max - W_min) / W_step) + 1

    # Generate samples using Sobol sequence for better coverage
    sobol_sampler = qmc.Sobol(d=sample_dim, scramble=True) 
    # round up num_samples to the next power of 2 for better performance
    num_samples = int(2**np.ceil(np.log2(num_samples)))

    print(f"Generating {num_samples} samples with Sobol sequence...")
    with tqdm(total=1, desc="Generating Sobol samples") as pbar:
        W_samples_unit_scale = sobol_sampler.random(n=num_samples)
        pbar.update(1)
    
    # Scale samples to [W_min, W_max]
    W_samples = qmc.scale(W_samples_unit_scale, [W_min]*sample_dim, [W_max]*sample_dim)

    if num_samples_sym > 0:
        num_samples_sym = int(2**np.ceil(np.log2(num_samples_sym)))
        sample_dim_sym = (sample_dim + 1) // 2
        sym_sobol_sampler = qmc.Sobol(d=sample_dim_sym, scramble=True)
        W_samples_unit_scale_sym = sym_sobol_sampler.random(n=num_samples_sym)
        W_samples_sym = qmc.scale(W_samples_unit_scale_sym, [W_min]*sample_dim_sym, [W_max]*sample_dim_sym)
        # Mirror to create symmetric samples
        if sample_dim % 2 == 0:
            W_samples_sym_full = np.hstack([W_samples_sym, W_samples_sym[:, ::-1]])
        else:
            W_samples_sym_full = np.hstack([W_samples_sym, W_samples_sym[:, -2::-1]])
        # Combine symmetric samples with original samples
        W_samples_full = np.vstack([W_samples, W_samples_sym_full])
    else:
        W_samples_full = W_samples
    
    # Ensure all W values are at discrete steps by rounding to nearest step
    W_samples_full = np.round((W_samples_full - W_min) / W_step) * W_step + W_min
    
    # Debug print to verify discretization is working
    print(f"After discretization, first 5 W samples: {W_samples_full[:5]}")
    
    # Normalize W values for the model
    W_norm = normalize_w(W_samples_full, W_min, W_max).numpy()
    
    # Create batches for processing
    num_batches = (len(W_norm) + batch_size - 1) // batch_size
    S_predictions = []
    
    print(f"Processing {len(W_norm)} samples in {num_batches} batches...")
    
    with torch.no_grad():
        # Use tqdm for progress bar
        for batch_idx in tqdm(range(num_batches), desc="Forward model inference", unit="batch"):
            start_idx = batch_idx * batch_size
            end_idx = min(start_idx + batch_size, len(W_norm))
            
            # Prepare batch
            batch_W = torch.tensor(W_norm[start_idx:end_idx], dtype=torch.float32).to(device)
            
            # Forward pass to get S predictions
            S_batch = model(batch_W)
            if S_batch.dim() == 3 and S_batch.size(-1) == 1:
                S_batch = S_batch.squeeze(-1)
            S_predictions.append(S_batch.detach().cpu().numpy())
    
    # Concatenate all predictions
    S_predictions = np.concatenate(S_predictions, axis=0)

    # Determine S layout
    freq_bins = int(config.get("frequency_bins", 1))
    num_channels = int(config.get("channels", 3))
    expected_s = num_channels * freq_bins
    if S_predictions.shape[1] != expected_s:
        raise ValueError(f"Expected S dim {expected_s} (3*frequency_bins), got {S_predictions.shape[1]}")

    # Prepare the dataset
    w_cols = [f"W{i+1}" for i in range(sample_dim)]
    t2_cols = [f"T_square_{i+1}" for i in range(freq_bins)]
    phase_cols = []
    for i in range(freq_bins):
        phase_cols.extend([f"sin_phi_{i+1}", f"cos_phi_{i+1}"])

    # Clamp S predictions
    S_predictions = np.clip(S_predictions, 0.0, 1.0)

    # Combine W and S (T_square first, then interleaved sin/cos)
    data = np.hstack([W_samples_full, S_predictions])
    df = pd.DataFrame(data, columns=w_cols + t2_cols + phase_cols)
    
    # Verify discretization by checking unique values
    unique_steps = set()
    for col in w_cols:
        values = df[col].unique()
        
        # Check if all values are proper multiples of W_step from W_min
        remainders = ((values - W_min) % W_step)
        # Allow small floating point errors (1e-10)
        is_discretized = np.all(np.isclose(remainders, 0, atol=1e-10) | 
                               np.isclose(remainders, W_step, atol=1e-10))
        print(f"Column {col} properly discretized: {is_discretized}")
        
        # Also check step sizes
        steps = np.diff(np.sort(values))
        
        # Determine rounding precision based on W_step
        if isinstance(W_step, int) or float(W_step).is_integer():
            decimal_places = 0
        else:
            # Calculate number of decimal places needed
            decimal_places = max(0, -int(np.floor(np.log10(abs(W_step - int(W_step))))))
        
        unique_steps.update(np.round(steps, decimal_places))
    
    print(f"Unique step sizes in dataset: {sorted(unique_steps)}")
    print(f"Expected step size: {W_step}")
    print(f"Final dataset size: {len(df)}")
    
    # Optional: analyze the distribution of values
    if len(df) > 0:
        print("\nParameter statistics:")
        print(df.describe())

    df.to_csv(output_path, index=False)
    print(f"Generated dataset saved to: {output_path}, total samples: {len(df)}")
    
    return output_path

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Generate training data for inverse model")
    parser.add_argument("--model_path", type=str, 
                        default="/mnt/storage/users/nati/metamamba/runs/fine_tune/finetune_full_hf_lr0.0005_bb0.0001_a0.7_20250903-082301/best_weighted.pth",
                        help="Path to trained forward model")
    parser.add_argument("--config_path", type=str, 
                        default=None,
                        help="Path to model config file")
    parser.add_argument("--output_path", type=str, default=None,
                        help="Path to save generated dataset (defaults to model directory)")
    parser.add_argument("--sample_dim", type=int, default=5,
                        help="Dimensionality of W parameter space")
    parser.add_argument("--num_samples", type=int, default=2000000,
                        help="Number of samples to generate")
    parser.add_argument("--num_samples_sym", type=int, default=100000,
                        help="Number of symmetric samples to generate (W1=W5, W2=W4)")
    parser.add_argument("--batch_size", type=int, default=16384,
                        help="Batch size for forward model inference")
    parser.add_argument("--target_high_t2", action="store_true",
                        help="Oversample regions of high T_square")
    parser.add_argument("--device", type=str, default="cuda:0",
                        help="Device to use for computations")
    parser.add_argument("--W_step", type=float, default=1.0)
    
    args = parser.parse_args()
    
    output_path = augment_inverse_training_data(
        forward_model_path=args.model_path,
        config_path=args.config_path,
        output_path=args.output_path,
        num_samples=args.num_samples,
        batch_size=args.batch_size,
        device=torch.device(args.device),
        sample_dim=args.sample_dim,
        num_samples_sym=args.num_samples_sym,
        W_step=args.W_step,
    )
    
    print(f"Successfully generated inverse model training data at: {output_path}")
