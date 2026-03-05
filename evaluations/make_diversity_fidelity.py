#!/usr/bin/env python3
"""
IEEE-TAP ready diversity-fidelity evaluation script for MTS Mamba.
Demonstrates one-to-many decoding: different policies achieve different points 
on the diversity-fidelity frontier for the same S target.

This script creates publication-ready figures showing:
1. Main diversity-fidelity scatter plot (aggregate mode)
2. Small insets showing alpha-dependent curves (insets mode)

Examples:
  # Main figure with 12 phases and 5 policies
  python make_diversity_fidelity.py aggregate \\
    --frontier scan_results/scan_results_20250827-175734.csv \\
    --outdir figs \\
    --n_phases 12 \\
    --budget 512 \\
    --policies topp:0.90 topp:0.95 topk:10 topk:20 topk:50

  # Insets with 3 representative phases  
  python make_diversity_fidelity.py insets \\
    --frontier scan_results/scan_results_20250827-175734.csv \\
    --outdir figs \\
    --budget 128 \\
    --policy topp:0.95 \\
    --alphas 0.85 0.90 0.95 0.98

Output files:
  - PDF and PNG figures (600 DPI, vector graphics)
  - CSV data files with all computed metrics
  - LaTeX snippets ready for IEEE TAP inclusion
"""

import argparse
import os
import sys
from pathlib import Path
from typing import List, Tuple, Optional
from itertools import combinations
import numpy as np
import pandas as pd
import warnings

# Set environment variables to completely disable font warnings
os.environ['MPLCONFIGDIR'] = '/tmp'
import matplotlib
matplotlib.use('Agg')  # Use non-GUI backend
import matplotlib.pyplot as plt
import matplotlib.cm as cm


# Comprehensive font warning suppression
import logging
logging.getLogger('matplotlib.font_manager').setLevel(logging.ERROR)
warnings.filterwarnings("ignore", category=UserWarning)
warnings.filterwarnings("ignore", message=".*findfont.*")
warnings.filterwarnings("ignore", message=".*serif.*")
warnings.filterwarnings("ignore", message=".*font.*")

# Configure matplotlib with minimal font configuration
matplotlib.rcParams.update({
    'font.family': 'DejaVu Sans',
    'font.size': 10,
    'text.usetex': False,
    'mathtext.default': 'regular',
    'axes.unicode_minus': False,
    'mathtext.fontset': 'dejavusans',
    'font.serif': ['DejaVu Sans'],
    'font.sans-serif': ['DejaVu Sans'],
    'font.monospace': ['DejaVu Sans Mono'],
    'font.cursive': ['DejaVu Sans'],
    'font.fantasy': ['DejaVu Sans'],
    'backend': 'Agg',
})
import torch
import yaml
from tqdm import tqdm
import traceback

# Add parent directory to path for imports
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '.')))
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), 'eveluations')))

# Import from existing repo code
from polar_envelope_plot import load_and_process_scan_results, compute_envelope
from eval_utils import wrap_phase_radians
from utils import load_inverse_model, load_forward_model, get_device, tokens_to_w, phase_deg_to_sin_cos_norm, norm_sin_cos_to_phase_deg



class FrontierLookup:
    """Utility class for frontier lookup and phase selection."""
    
    def __init__(self, frontier_path: str):
        """Load frontier data from scan results."""
        self.df = pd.read_csv(frontier_path)
        self.phase_bins, self.t_square_envelope = self._load_frontier(frontier_path)
    
    def _load_frontier(self, data_path: str) -> Tuple[np.ndarray, np.ndarray]:
        """Load and compute frontier envelope from scan data."""
        try:
            # Try to use existing envelope computation
            t_square, phi_deg = load_and_process_scan_results(data_path)
            t_square_envelope, phase_bins = compute_envelope(t_square, phi_deg)  # Fixed order!
            return phase_bins, t_square_envelope
        except Exception as e:
            print(f"Warning: Could not use polar_envelope_plot functions: {e}")
            # Fallback implementation
            df = pd.read_csv(data_path)
            
            # Group by phase and find maximum tau for each phase
            phase_groups = df.groupby('input_phi')['predicted_t_square'].max().reset_index()
            phases = phase_groups['input_phi'].values
            taus = phase_groups['predicted_t_square'].values
            
            # Sort by phase
            sorted_idx = np.argsort(phases)
            return phases[sorted_idx], taus[sorted_idx]
    
    def lookup_frontier_value(self, phi_deg: float) -> float:
        """Get frontier tau value for a given phase."""
        # Find nearest phase bin
        phi_wrapped = wrap_phase_radians(np.radians(phi_deg))
        phi_wrapped_deg = np.degrees(phi_wrapped)
        
        # Find closest phase in envelope
        idx = np.argmin(np.abs(self.phase_bins - phi_wrapped_deg))
        return float(self.t_square_envelope[idx])
    
    def select_phases(self, n_phases: int) -> np.ndarray:
        """Select n_phases evenly distributed in the circular range [0°, 360°)."""
        # For circular phase space, we want evenly spaced phases without duplication
        # For 12 phases: 0°, 30°, 60°, 90°, ..., 330° (avoiding both 0° and 360°)
        
        # Generate evenly spaced phases in [0, 360) range
        phase_step = 360.0 / n_phases
        target_phases = np.array([i * phase_step for i in range(n_phases)])
        
        # Find feasible phases by checking frontier values
        good_indices = self.t_square_envelope > 0.5
        if np.sum(good_indices) < n_phases // 2:  # Need at least half to be good
            good_indices = self.t_square_envelope > 0.1  # Relax criterion
        
        valid_phases = self.phase_bins[good_indices]
        
        # For each target phase, find the nearest feasible phase
        selected_phases = []
        used_indices = set()
        
        for target_phase in target_phases:
            # Find the closest feasible phase to this target
            # Handle circular distance properly
            distances = np.minimum(
                np.abs(valid_phases - target_phase),
                360 - np.abs(valid_phases - target_phase)
            )
            
            # Find the closest unused phase
            best_idx = None
            best_distance = float('inf')
            
            for i, distance in enumerate(distances):
                if i not in used_indices and distance < best_distance:
                    best_distance = distance
                    best_idx = i
            
            if best_idx is not None:
                selected_phases.append(valid_phases[best_idx])
                used_indices.add(best_idx)
            else:
                # If no unused phase found, just use the target (might not be exactly feasible)
                selected_phases.append(target_phase)
        
        # Ensure no duplicates and convert to numpy array
        selected_phases = np.array(selected_phases)
        
        # Normalize to [0, 360) range
        selected_phases = selected_phases % 360
        
        # Remove any potential duplicates (within 1 degree tolerance)
        unique_phases = []
        for phase in selected_phases:
            is_duplicate = False
            for existing in unique_phases:
                if min(abs(phase - existing), 360 - abs(phase - existing)) < 1.0:
                    is_duplicate = True
                    break
            if not is_duplicate:
                unique_phases.append(phase)
        
        return np.array(sorted(unique_phases))
    
    def select_representative_phases(self) -> List[float]:
        """Select three representative phases: easy, edge, dip."""
        # Easy: high transmission
        easy_idx = np.argmax(self.t_square_envelope)
        easy_phase = float(self.phase_bins[easy_idx])
        
        # Edge: transmission around 0.9
        edge_target = 0.9
        edge_idx = np.argmin(np.abs(self.t_square_envelope - edge_target))
        edge_phase = float(self.phase_bins[edge_idx])
        
        # Dip: local minimum (avoid global minimum which might be zero)
        sorted_indices = np.argsort(self.t_square_envelope)
        # Take a low value but not the absolute minimum
        dip_idx = sorted_indices[len(sorted_indices) // 4]  # 25th percentile
        dip_phase = float(self.phase_bins[dip_idx])
        
        return [easy_phase, edge_phase, dip_phase]



def complex_distance(t_square_pred: np.ndarray, phi_pred: np.ndarray, 
                    t_square_target: float, phi_target: float) -> np.ndarray:
    """Compute complex distance between predictions and targets."""
    # Convert to complex representation
    z_pred = t_square_pred * np.exp(1j * np.radians(phi_pred))
    z_target = t_square_target * np.exp(1j * np.radians(phi_target))
    
    return np.abs(z_pred - z_target)


def compute_success_mask(t_square_pred: np.ndarray, phi_pred: np.ndarray,
                        t_square_target: float, phi_target: float, 
                        theta_deg: float = 5.0, alpha_hit: float = 0.95,
                        beta_hit: float = 1.1,
                        frontier_lookup: Optional['FrontierLookup'] = None) -> np.ndarray:
    """Compute success mask based on phase and transmission criteria."""
    # Phase criterion: |Δφ| ≤ theta_deg
    phase_errors = np.minimum(
        np.abs(phi_pred - phi_target),
        360 - np.abs(phi_pred - phi_target)
    )
    phase_ok = phase_errors <= theta_deg
    
    # Transmission criterion: t_square_pred ≥ alpha_hit * min(t_square_target, f(phi))
    if frontier_lookup is not None:
        frontier_values = np.array([frontier_lookup.lookup_frontier_value(p) for p in phi_pred])
        t_square_threshold = alpha_hit * np.minimum(t_square_target, frontier_values)
        if beta_hit:
            t_square_upper = beta_hit * np.minimum(t_square_target, frontier_values)
    else:
        t_square_threshold = alpha_hit * t_square_target
        if beta_hit:
            t_square_upper = beta_hit * t_square_target
    
    if beta_hit:
        t_square_ok = (t_square_pred >= t_square_threshold) & (t_square_pred <= t_square_upper)
    else:
        t_square_ok = t_square_pred >= t_square_threshold
    
    return phase_ok & t_square_ok


def compute_diversity(w_sequences: List[List[int]]) -> float:
    """Compute mean pairwise token L1 distance."""
    if len(w_sequences) < 2:
        return 0.0
    
    n_sequences = len(w_sequences)
    w_len = len(w_sequences[0]) if w_sequences else 0
    
    total_distance = 0.0
    n_pairs = 0
    
    for i, j in combinations(range(n_sequences), 2):
        seq_distance = sum(abs(w_sequences[i][t] - w_sequences[j][t]) for t in range(w_len))
        total_distance += seq_distance / w_len  # Normalize by sequence length
        n_pairs += 1
    
    return float(total_distance / n_pairs) if n_pairs > 0 else 0.0


def count_unique_sequences(w_sequences: List[List[int]]) -> int:
    """Count unique W sequences."""
    unique_sequences = set()
    for seq in w_sequences:
        unique_sequences.add(tuple(seq))
    return len(unique_sequences)


def decode_for_target(inverse_model, forward_model, t_square_target: float, phi_target: float,
                     policy: str, temperature: float, budget: int, device: str,
                     min_w: float, w_interval: float, s_len: int, w_len: int,
                     max_length: int) -> Tuple[np.ndarray, np.ndarray, List[List[int]]]:
    """Generate and evaluate W sequences for a specific target (tau, phi)."""
    # Parse policy
    if policy.startswith('topk:'):
        top_k = int(policy.split(':')[1])
        top_p = 1.0
    elif policy.startswith('topp:'):
        top_k = 0
        top_p = float(policy.split(':')[1])
    else:
        raise ValueError(f"Unknown policy format: {policy}")
    
    # Prepare target input
    sin_phi_norm, cos_phi_norm = phase_deg_to_sin_cos_norm(phi_target)
    device_torch = torch.device(device)
    # Ensure Triton kernels target the requested CUDA device
    if device_torch.type == 'cuda':
        torch.cuda.set_device(device_torch)
    s_params_input = torch.tensor([[sin_phi_norm, cos_phi_norm, t_square_target]], 
                                  device=device_torch, dtype=torch.float32)
    
    # Generate sequences
    all_t_square_pred = []
    all_phi_pred = []
    all_w_sequences = []
    

    batch_size = budget
    n_batches = 1
    
    triton_gpu_failed = False

    for batch_idx in range(n_batches):
        current_batch_size = min(batch_size, budget - batch_idx * batch_size)
        if current_batch_size <= 0:
            break
            
        try:
            # Prepare batch input
            input_ids_batch = s_params_input.repeat(current_batch_size, 1)

            # Ensure inputs are on the same device as the model (avoid Triton CPU tensor errors)
            try:
                model_device = next(inverse_model.parameters()).device
            except Exception:
                model_device = torch.device(device)

            if input_ids_batch.device != model_device:
                input_ids_batch = input_ids_batch.to(model_device)

            # Small diagnostic log to help debug Triton/device issues
            print(f"Generating batch {batch_idx}: batch_size={current_batch_size}, input_device={input_ids_batch.device}, model_device={model_device}")
            print(f"  input dtype={input_ids_batch.dtype}, contiguous={input_ids_batch.is_contiguous()}")

            try:
                with torch.no_grad():
                    output = inverse_model.generate(
                        input_ids=input_ids_batch,
                        max_length=max_length,
                        top_k=top_k,
                        top_p=top_p,
                        temperature=temperature,
                        eos_token_id=None,
                        return_dict_in_generate=True
                    )
            except Exception as gen_err:
                err_msg = str(gen_err)
                if ("Pointer argument" in err_msg or "Triton" in err_msg) and not triton_gpu_failed:
                    print("  Detected Triton pointer error on GPU; falling back to CPU for inverse generation.")
                    inverse_model.to(torch.device('cpu'))
                    model_device = next(inverse_model.parameters()).device
                    input_ids_batch = input_ids_batch.to(model_device)
                    triton_gpu_failed = True
                    with torch.no_grad():
                        output = inverse_model.generate(
                            input_ids=input_ids_batch,
                            max_length=max_length,
                            top_k=top_k,
                            top_p=top_p,
                            temperature=temperature,
                            eos_token_id=None,
                            return_dict_in_generate=True
                        )
                else:
                    print(f"  Exception during generate() for batch {batch_idx}; printing traceback:")
                    traceback.print_exc()
                    raise

            # Diagnostic: inspect generate output
            print(f"  generate returned type={type(output)}, has_attr_sequences={hasattr(output, 'sequences')}")
            output_tokens = output.sequences if hasattr(output, 'sequences') else output

            if output_tokens is None:
                print("  generate produced no sequences (None)")
                continue

            # Ensure output_tokens is a tensor
            if not isinstance(output_tokens, torch.Tensor):
                try:
                    output_tokens = torch.tensor(output_tokens, device=model_device)
                except Exception:
                    print("  Could not convert generate output to tensor; skipping batch")
                    continue

            # Extract W sequences (robust): require at least s_len + w_len tokens
            batch_w_sequences = []
            seq_len = output_tokens.size(1) if output_tokens.dim() > 1 else output_tokens.size(0)
            required_len = s_len + w_len
            if seq_len < required_len:
                print(f"  Skipping batch: seq_len={seq_len} < required_len={required_len}")
                continue

            for i in range(output_tokens.size(0)):
                # Take last w_len tokens as W tokens (robust to different generation formats)
                try:
                    w_slice = output_tokens[i, -w_len:]
                except Exception:
                    # Fallback: slice from s_len
                    w_slice = output_tokens[i, s_len:s_len + w_len]

                w_tokens = [int(x) for x in w_slice.long().cpu().tolist()]
                if len(w_tokens) == w_len:
                    batch_w_sequences.append(w_tokens)

            print(f"  Collected {len(batch_w_sequences)} sequences from batch {batch_idx}")
            
            # Evaluate with forward model
            if batch_w_sequences:
                batch_t_square_pred = []
                batch_phi_pred = []
                
                for w_tokens in batch_w_sequences:
                    # Convert tokens to W values
                    w_tensor = torch.tensor(w_tokens, device=device_torch, dtype=torch.long)
                    w_values = tokens_to_w(w_tensor, min_w, w_interval)
                    
                    # Create forward model input (normalized)
                    forward_input = w_values.unsqueeze(0).unsqueeze(-1).float() / (80 - min_w)
                    
                    with torch.no_grad():
                        s_pred = forward_model(forward_input)
                        
                    # Extract predictions
                    if s_pred.dim() == 3:
                        s_pred = s_pred.squeeze(-1)
                    
                    t_square_pred = float(s_pred[0, 0].cpu())
                    sin_phi_pred  = float(s_pred[0, 1].cpu())
                    cos_phi_pred  = float(s_pred[0, 2].cpu())
                    
                    # Convert back to phase
                    phi_pred = float(norm_sin_cos_to_phase_deg(sin_phi_pred, cos_phi_pred))
                    
                    batch_t_square_pred.append(t_square_pred)
                    batch_phi_pred.append(phi_pred)
                
                # Store results
                all_t_square_pred.extend(batch_t_square_pred)
                all_phi_pred.extend(batch_phi_pred)
                all_w_sequences.extend(batch_w_sequences)
            
        except Exception as e:
            print(f"Warning: Failed to generate batch {batch_idx}: {e}")
            continue

    return np.array(all_t_square_pred), np.array(all_phi_pred), all_w_sequences


def write_latex_snippet(fig_path: str, outdir: str, caption: str, label: str):
    """Write LaTeX figure snippet for IEEE TAP paper."""
    latex_content = f"""\\begin{{figure*}}[t]
    \\centering
    \\includegraphics[width=0.8\\textwidth]{{{fig_path}.pdf}}
    \\caption{{{caption}}}
    \\label{{{label}}}
\\end{{figure*}}
"""
    
    latex_file = os.path.join(outdir, f"{os.path.basename(fig_path)}.tex")
    with open(latex_file, 'w') as f:
        f.write(latex_content)
    print(f"LaTeX snippet saved to {latex_file}")


def cmd_replot(args):
    """Execute replot subcommand to regenerate plots from existing CSV data."""
    print("Regenerating plots from existing CSV data...")
    
    # Load existing results
    csv_path = os.path.join(args.outdir, f"diversity_fidelity_M{args.budget}_main.csv")
    if not os.path.exists(csv_path):
        print(f"Error: CSV file not found at {csv_path}")
        print("Please run the 'aggregate' command first to generate the data.")
        return
    
    results_df = pd.read_csv(csv_path)
    print(f"Loaded {len(results_df)} results from {csv_path}")
    
    # Extract policies from data
    args.policies = results_df['policy'].unique().tolist()
    print(f"Found policies: {args.policies}")
    
    # Create main plot
    plot_aggregate(results_df, args)
    
    # Print summary statistics and generate LaTeX table
    print_summary_stats(results_df)
    generate_latex_table(results_df, args, args.outdir)
    
    print("Replotting completed!")


def cmd_aggregate(args):
    """Execute aggregate subcommand."""
    print("Executing diversity-fidelity aggregate analysis...")
    
    # Load frontier
    frontier_lookup = FrontierLookup(args.frontier)
    
    # Select phases
    phases_deg = frontier_lookup.select_phases(args.n_phases)
    print(f"Selected {len(phases_deg)} phases: {phases_deg}")
    
    # Load models
    device_torch = get_device(args.device)
    device_str = str(device_torch)
    
    inv_ckpt = Path(args.inverse_checkpoint_dir)
    inv_cfg_path = (inv_ckpt.parent if inv_ckpt.is_file() else inv_ckpt) / "config.yaml"
    inv_config = yaml.safe_load(open(inv_cfg_path, "r"))
    inverse_model = load_inverse_model(str(inv_ckpt), config_path=str(inv_cfg_path), device=device_str)

    fwd_ckpt = Path(args.forward_model_path)
    fwd_cfg_path = (fwd_ckpt.parent if fwd_ckpt.is_file() else fwd_ckpt) / "config.yaml"
    fwd_config = yaml.safe_load(open(fwd_cfg_path, "r"))
    forward_model = load_forward_model(str(fwd_ckpt), config_path=str(fwd_cfg_path), device=device_str)
    
    # Extract parameters
    min_w = inv_config.get('min_w_value', 0.0)
    w_interval = inv_config.get('w_interval', 1.0)
    w_len = inv_config.get('w_len', 5)
    s_len = inv_config.get('s_len', 3)
    max_length = s_len + w_len
    
    # Prepare results collection
    all_results = []
    
    for phase_deg in tqdm(phases_deg, desc="Processing phases"):
        # Compute target
        frontier_tau = frontier_lookup.lookup_frontier_value(phase_deg)
        t_square_target = min(args.alpha_tau * frontier_tau, 0.98)
        
        print(f"\\nPhase {phase_deg:.1f}°: frontier_tau={frontier_tau:.3f}, target_tau={t_square_target:.3f}")
        
        for policy in args.policies:
            print(f"  Policy {policy}...")
            
            try:
                # Decode and evaluate
                t_square_pred, phi_pred, w_sequences = decode_for_target(
                    inverse_model, forward_model, t_square_target, phase_deg,
                    policy, args.temperature, args.budget, device_str,
                    min_w, w_interval, s_len, w_len, max_length
                )
                
                if len(t_square_pred) == 0:
                    print(f"    No sequences generated for {policy}")
                    continue
                
                # Apply success criterion
                success_mask = compute_success_mask(
                    t_square_pred, phi_pred, t_square_target, phase_deg,
                    args.theta_deg, args.alpha_hit, frontier_lookup=frontier_lookup
                )
                
                successful_sequences = [w_sequences[i] for i in range(len(w_sequences)) if success_mask[i]]
                
                # Compute metrics
                if len(successful_sequences) > 0:
                    # Fidelity: best complex distance
                    distances = complex_distance(t_square_pred, phi_pred, t_square_target, phase_deg)
                    d_c_min = float(np.min(distances))
                    
                    # Diversity: mean pairwise token L1
                    diversity = compute_diversity(successful_sequences)
                    
                    # Unique successful designs
                    uniq_success = count_unique_sequences(successful_sequences)
                else:
                    d_c_min = float('inf')
                    diversity = 0.0
                    uniq_success = 0
                
                all_results.append({
                    'phase_deg': phase_deg,
                    't_square_star': t_square_target,
                    'policy': policy,
                    'M': args.budget,
                    'd_c_min': d_c_min,
                    'diversity': diversity,
                    'uniq_success': uniq_success,
                    'n_success': len(successful_sequences),
                    'n_total': args.budget
                })
                
                print(f"    Results: d_c_min={d_c_min:.4f}, diversity={diversity:.4f}, uniq={uniq_success}")
                
            except Exception as e:
                print(f"    Error processing {policy}: {e}")
                all_results.append({
                    'phase_deg': phase_deg,
                    't_square_star': t_square_target,
                    'policy': policy,
                    'M': args.budget,
                    'd_c_min': float('inf'),
                    'diversity': 0.0,
                    'uniq_success': 0,
                    'n_success': 0,
                    'n_total': args.budget
                })
    
    # Save results
    results_df = pd.DataFrame(all_results)
    csv_path = os.path.join(args.outdir, f"diversity_fidelity_M{args.budget}_main.csv")
    results_df.to_csv(csv_path, index=False)
    print(f"Results saved to {csv_path}")
    
    # Create main plot
    plot_aggregate(results_df, args)
    
    # Print summary statistics and generate LaTeX table
    print_summary_stats(results_df)
    generate_latex_table(results_df, args, args.outdir)


def plot_aggregate(results_df: pd.DataFrame, args):
    """Create main diversity-fidelity scatter plot with unique markers and enhanced annotations."""
    fig, ax = plt.subplots(1, 1, figsize=(10, 7))  # Larger figure for better readability
    
    # Define unique markers for each policy
    markers = ['o', 's', '^', 'D', 'v', 'p', 'h', '*']  # Different shapes for each policy
    colors = plt.get_cmap('Set1')(np.linspace(0, 1, len(args.policies)))  # More distinct colors
    # Compute success rate (robust to older CSVs)
    if 'n_success' in results_df.columns and 'n_total' in results_df.columns:
        results_df['success_rate'] = results_df['n_success'] / results_df['n_total']
    else:
        if 'uniq_success' in results_df.columns:
            if 'M' in results_df.columns:
                results_df['success_rate'] = results_df['uniq_success'] / results_df['M']
            else:
                # Fall back to args.budget as denominator
                results_df['success_rate'] = results_df['uniq_success'] / float(getattr(args, 'budget', 512))
                print("Warning: 'n_success'/'n_total' not found; using 'uniq_success'/M fallback for success_rate.")
        else:
            results_df['success_rate'] = 0.0
            print("Warning: could not compute success_rate (missing 'n_success' and 'uniq_success'); setting to 0.")

    # If requested, plot Success Rate vs Diversity (color = unique successes, marker shape = policy)
    if getattr(args, 'plot_type', 'fidelity') == 'success_diversity':
        fig, ax = plt.subplots(1, 1, figsize=(10, 7))
        cmap = plt.get_cmap('cividis')
        scatter_plots = []

        # Map each policy to a distinct marker
        policy_markers = {p: markers[i % len(markers)] for i, p in enumerate(args.policies)}

        for i, policy in enumerate(args.policies):
            policy_data = results_df[results_df['policy'] == policy]
            if policy_data.empty:
                continue

            marker = policy_markers.get(policy, 'o')
            if policy.startswith('topp:'):
                label = f"Top-p {policy.split(':')[1]}"
            else:
                label = f"Top-k {policy.split(':')[1]}"

            scatter = ax.scatter(
                policy_data['success_rate'], policy_data['diversity'],
                c=policy_data['uniq_success'], s=120, marker=marker, label=label,
                alpha=0.9, edgecolors='black', linewidth=0.8, cmap=cmap, vmin=0
            )
            scatter_plots.append(scatter)

        # Colorbar for unique successful designs
        if scatter_plots:
            cbar = plt.colorbar(scatter_plots[-1], ax=ax, shrink=0.8)
            cbar.set_label('Unique Successful Designs', fontsize=12)

        # Legend with marker shapes (proxy artists)
        from matplotlib.lines import Line2D
        proxy_handles = []
        for i, p in enumerate(args.policies):
            if p in results_df['policy'].unique():
                m = policy_markers.get(p, markers[i % len(markers)])
                name = (f"Top-p {p.split(':')[1]}" if p.startswith('topp:') else f"Top-k {p.split(':')[1]}")
                proxy_handles.append(Line2D([0], [0], marker=m, color='w', label=name,
                                             markerfacecolor='gray', markersize=9, markeredgecolor='black'))

        if proxy_handles:
            ax.legend(handles=proxy_handles, title='Policy', fontsize=10, loc='upper left', framealpha=0.9)

        ax.set_xlabel('Success Rate (n_s / M)', fontsize=14)
        ax.set_ylabel('Diversity (mean pairwise token L1)', fontsize=14)
        ax.set_xlim(0, 1)
        y_max = max(0.05, results_df['diversity'].max() * 1.05)
        ax.set_ylim(0, y_max)
        ax.grid(True, alpha=0.4)

        plt.tight_layout()

        # Save plots with explicit plot_type suffix
        pdf_path = os.path.join(args.outdir, f"diversity_success_diversity_M{args.budget}.pdf")
        png_path = os.path.join(args.outdir, f"diversity_success_diversity_M{args.budget}.png")
        plt.savefig(pdf_path, dpi=600, bbox_inches='tight')
        plt.savefig(png_path, dpi=600, bbox_inches='tight')
        plt.close()

        print(f"Success-vs-Diversity plot saved to {pdf_path} and {png_path}")

        # LaTeX snippet for new figure
        policy_legend = ", ".join([
            f"{policy_markers[p]}: {'Top-p' if p.startswith('topp:') else 'Top-k'} {p.split(':')[1]}" for p in args.policies
            if p in results_df['policy'].unique()
        ])

        caption = (
            f"Diversity vs. success-rate for decoding policies. "
            f"X: success rate per target (n_s / M). Y: diversity (mean pairwise token L1). "
            f"Color: unique successful designs. Marker shapes: {policy_legend}. "
            f"Success criterion: phase error ≤{args.theta_deg}° AND |T|² ≥{int(args.alpha_hit*100)}% of feasible threshold. "
            f"Budget M = {args.budget}, Temperature = {args.temperature}."
        )

        write_latex_snippet(fig_path=os.path.join(args.outdir, f"diversity_success_diversity_M{args.budget}"),
                            outdir=args.outdir, caption=caption, label="fig:diversity_success_diversity")

        return

    # Plot data points for each policy with unique markers, colored by unique count
    scatter_plots = []
    for i, policy in enumerate(args.policies):
        policy_data = results_df[results_df['policy'] == policy]
        if len(policy_data) == 0:
            continue
            
        # Unique marker for each policy
        marker = markers[i % len(markers)]
        
        if policy.startswith('topp:'):
            label = f"Top-p {policy.split(':')[1]}"
        else:
            label = f"Top-k {policy.split(':')[1]}"
        
        # Create scatter plot colored by unique success count
        scatter = ax.scatter(
            policy_data['d_c_min'], policy_data['diversity'],
            c=policy_data['uniq_success'], s=80, marker=marker, label=label,
            alpha=0.8, edgecolors='black', linewidth=0.8,
            cmap='viridis'  # Good colormap for unique counts
        )
        scatter_plots.append(scatter)
        
        # Simple annotations with only φ, positioned very close to data points
        for j, (_, row) in enumerate(policy_data.iterrows()):
            if not np.isinf(row['d_c_min']):
                # Position annotations much closer to the data points
                offset_x = 1 + (j % 2) * 3  # Minimal horizontal offset
                offset_y = 1 + (j % 2) * 3  # Minimal vertical offset
                
                ax.annotate(f"φ={row['phase_deg']:.0f}°", 
                           (row['d_c_min'], row['diversity']),
                           xytext=(offset_x, offset_y), textcoords='offset points',
                           fontsize=9, alpha=0.8, ha='left',
                           bbox=dict(boxstyle="round,pad=0.02", facecolor='white', alpha=0.9, edgecolor='gray', linewidth=0.1))
    
    # Add colorbar for unique success count
    if scatter_plots:
        cbar = plt.colorbar(scatter_plots[-1], ax=ax, shrink=0.8)
        cbar.set_label('Unique Successful Designs', fontsize=14)
    
    # Enhanced formatting with proper mathematical notation
    ax.set_xlabel('Fidelity', fontsize=14)
    ax.set_ylabel('Diversity', fontsize=14)
    # ax.set_title('Diversity-Fidelity for Different Generation Policies\n' + 
    #             f'Success: |Δφ| ≤ {args.theta_deg}° AND |T|² ≥ {args.alpha_hit}×min(|T*|², f(φ))', 
    #             fontsize=12, fontweight='bold')
    ax.set_title('Diversity-Fidelity Trade-Off for Different Generation Policies\n', 
                fontsize=14, fontweight='bold')
    ax.grid(True, alpha=0.5)
    
    # Bring back the legend for markers - this is crucial!
    ax.legend(fontsize=10, loc='best', framealpha=0.9)
    
    # Remove the redundant info box
    # info_text = f"M = {args.budget}, T = {args.temperature}"
    # ax.text(0.02, 0.98, info_text, transform=ax.transAxes, fontsize=9,
    #         verticalalignment='top', bbox=dict(boxstyle='round', facecolor='lightgray', alpha=0.6))
    
    plt.tight_layout()
    
    # Save plots
    pdf_path = os.path.join(args.outdir, f"diversity_fidelity_M{args.budget}_main.pdf")
    png_path = os.path.join(args.outdir, f"diversity_fidelity_M{args.budget}_main.png")
    plt.savefig(pdf_path, dpi=600, bbox_inches='tight')
    plt.savefig(png_path, dpi=600, bbox_inches='tight')
    plt.close()
    
    print(f"Main plot saved to {pdf_path} and {png_path}")
    
    # Save LaTeX snippet with enhanced caption including marker legend
    policy_legend = ", ".join([
        f"{markers[i % len(markers)]}: {'Top-p' if policy.startswith('topp:') else 'Top-k'} {policy.split(':')[1]}"
        for i, policy in enumerate(args.policies)
    ])
    
    enhanced_caption = (
        f"Diversity-fidelity frontier for different decoding policies generating metasurface designs. "
        f"Each point represents one target phase φ with transmission |T|² = 0.95×f(φ). "
        f"Fidelity measured as best-of-{args.budget} complex distance |Te^{{jφ}} - T*e^{{jφ*}}|. "
        f"Diversity measured as mean pairwise token L1 distance among successful designs. "
        f"Success criterion: phase error ≤{args.theta_deg}° AND |T|² ≥{int(args.alpha_hit*100)}\\% of feasible threshold. "
        f"Color indicates unique successful designs found. "
        f"Markers: {policy_legend}. "
        f"Budget M = {args.budget}, Temperature = {args.temperature}."
    )
    
    write_latex_snippet(
        fig_path=f"figs/diversity_fidelity_M{args.budget}_main",
        outdir=args.outdir,
        caption=enhanced_caption,
        label="fig:diversity_main"
    )


def print_summary_stats(results_df: pd.DataFrame):
    """Print summary statistics per policy."""
    print("\\n" + "="*60)
    print("SUMMARY STATISTICS")
    print("="*60)
    
    for policy in results_df['policy'].unique():
        policy_data = results_df[results_df['policy'] == policy]
        if len(policy_data) == 0:
            continue
            
        valid_data = policy_data[~np.isinf(policy_data['d_c_min'])]
        if len(valid_data) == 0:
            print(f"\\n{policy}: No valid results")
            continue
            
        print(f"\\n{policy} (n={len(valid_data)}):")
        print(f"  Median fidelity (d_c_min): {valid_data['d_c_min'].median():.4f}")
        print(f"  Median diversity: {valid_data['diversity'].median():.4f}")
        print(f"  Median unique designs: {valid_data['uniq_success'].median():.1f}")
        print(f"  Range fidelity: [{valid_data['d_c_min'].min():.4f}, {valid_data['d_c_min'].max():.4f}]")
        print(f"  Range diversity: [{valid_data['diversity'].min():.4f}, {valid_data['diversity'].max():.4f}]")


def generate_latex_table(results_df: pd.DataFrame, args, outdir: str):
    """Generate IEEE TAP ready LaTeX table with diversity-fidelity statistics."""
    
    # Collect statistics for each policy (in logical order)
    policy_order = ['topk:10', 'topk:20', 'topk:50', 'topp:0.90', 'topp:0.95']
    table_data = []
    
    for policy in policy_order:
        if policy not in results_df['policy'].unique():
            continue
            
        policy_data = results_df[results_df['policy'] == policy]
        valid_data = policy_data[~np.isinf(policy_data['d_c_min'])]
        
        if len(valid_data) == 0:
            continue
            
        # Format policy name for publication
        if policy.startswith('topp:'):
            p_val = policy.split(':')[1]
            policy_name = f"Top-$p$ ({p_val})"
        else:
            k_val = policy.split(':')[1] 
            policy_name = f"Top-$k$ ({k_val})"
        
        # Calculate statistics with proper success rate
        if 'n_success' in policy_data.columns and 'n_total' in policy_data.columns:
            # Use actual counts if available (new data format)
            total_success = policy_data['n_success'].sum()
            total_generated = policy_data['n_total'].sum()
            success_rate = total_success / total_generated if total_generated > 0 else 0
        else:
            # Fallback for old data format: estimate from unique counts
            # This is an approximation - unique count is lower bound of success count
            total_unique = policy_data['uniq_success'].sum()
            total_phases = len(policy_data)
            budget = getattr(args, 'budget', 512)
            success_rate = total_unique / (total_phases * budget) if total_phases > 0 and budget > 0 else 0
        
        stats = {
            'policy': policy_name,
            'success_rate': success_rate,
            'fidelity_median': valid_data['d_c_min'].median(),
            'diversity_median': valid_data['diversity'].median(),
            'unique_median': valid_data['uniq_success'].median()
        }
        table_data.append(stats)
    
    # Generate publication-ready LaTeX table (updated columns)
    latex_lines = [
        "% Diversity-Fidelity Statistics Table for IEEE TAP",
        "% Required packages: \\usepackage{booktabs,siunitx,threeparttable}",
        "",
        "\\begin{table}[!t]",
        "\\renewcommand{\\arraystretch}{1.3}",
        "\\caption{Performance Statistics of Decoding Policies on Diversity-Fidelity Trade-off}",
        "\\label{tab:diversity_fidelity_performance}",
        "\\centering",
        "\\begin{threeparttable}",
        "\\begin{tabular}{@{}lS[table-format=1.3]S[table-format=1.3]S[table-format=1.2]S[table-format=3.0]@{}}",
        "\\toprule",
        "{Policy} & {Success Rate\\tnote{a}} & {Fidelity\\tnote{b}} & {Diversity\\tnote{c}} & {Unique\\tnote{d}} \\\\",
        "\\midrule"
    ]
    
    # Add data rows
    for stats in table_data:
        latex_lines.append(
            f"{stats['policy']} & {stats['success_rate']:.3f} & "
            f"{stats['fidelity_median']:.3f} & "
            f"{stats['diversity_median']:.2f} & {stats['unique_median']:.0f} \\\\"
        )
    
    # Close table with comprehensive notes
    budget = getattr(args, 'budget', 'M')
    temp = getattr(args, 'temperature', 1.0)
    theta = getattr(args, 'theta_deg', 5.0)
    alpha = getattr(args, 'alpha_hit', 0.95)
    
    latex_lines.extend([
        "\\bottomrule",
        "\\end{tabular}",
        "\\begin{tablenotes}",
        "\\small",
        "\\item[a] Success Rate: Proportion of all generated sequences meeting success criterion ($n_s/M$)",
        f"\\item[b] Fidelity: Median best-of-{budget} complex distance $\\|\\mathbf{{T}} e^{{j\\phi}} - \\mathbf{{T}}^* e^{{j\\phi^*}}\\|$",
        "\\item[c] Diversity: Median mean pairwise token L1 distance among successful designs",
        "\\item[d] Unique: Median count of distinct successful design sequences",
        f"\\item[] Success criterion: $|\\Delta\\phi| \\leq {theta}°$ AND $|\\mathbf{{T}}|^2 \\geq {int(alpha*100)}\\%$ of feasible threshold.",
        f"\\item[] Sampling temperature: $T = {temp}$. Statistics computed over target phases.",
        "\\end{tablenotes}",
        "\\end{threeparttable}",
        "\\end{table}"
    ])
    
    # Save to file
    table_file = os.path.join(outdir, f"diversity_fidelity_table_M{budget}.tex")
    with open(table_file, 'w') as f:
        f.write('\n'.join(latex_lines))
    
    print(f"\\nIEEE TAP ready LaTeX table saved to: {table_file}")
    print("Required packages: \\usepackage{booktabs,siunitx,threeparttable}")
    
    # Print compact version for immediate copy-paste
    print("\\n" + "="*70)
    print("READY-TO-USE IEEE TAP TABLE")
    print("="*70)
    for line in latex_lines:
        print(line)
    print("="*70)
    
    return table_file


def cmd_insets(args):
    """Execute insets subcommand - create small plots showing alpha-dependent curves."""
    print("Starting insets analysis...")
    
    # Load frontier
    frontier_lookup = FrontierLookup(args.frontier)
    
    # Select representative phases
    if args.phases_deg is not None:
        phases_deg = args.phases_deg
        print(f"Using manual phases: {phases_deg}")
    else:
        # Auto-select 3 representative phases: easy, medium, hard
        print("Auto-selecting representative phases...")
        all_phases = frontier_lookup.select_phases(12)  # Get 12 phases first
        
        # Sample different difficulty levels based on t_square_star values
        phase_difficulties = []
        for phase in all_phases:
            frontier_t_square = frontier_lookup.lookup_frontier_value(phase)
            phase_difficulties.append((phase, frontier_t_square))
        
        # Sort by difficulty (t_square_star)
        phase_difficulties.sort(key=lambda x: x[1])
        
        if len(phase_difficulties) >= 3:
            # Select easy (high tau), medium, hard (low tau)
            easy_idx = -1  # High tau (easy)
            hard_idx = 0   # Low tau (hard)
            medium_idx = len(phase_difficulties) // 2
            
            phases_deg = [
                phase_difficulties[easy_idx][0],    # Easy
                phase_difficulties[medium_idx][0],  # Medium  
                phase_difficulties[hard_idx][0]     # Hard
            ]
        else:
            # Fallback to fixed phases
            phases_deg = [0, 90, 180]
        
        print(f"Selected phases: {phases_deg} degrees")
    
    # Load models
    device_torch = get_device(args.device)
    device_str = str(device_torch)
    
    inv_ckpt = Path(args.inverse_checkpoint_dir)
    inv_cfg_path = (inv_ckpt.parent if inv_ckpt.is_file() else inv_ckpt) / "config.yaml"
    inv_config = yaml.safe_load(open(inv_cfg_path, "r"))
    inverse_model = load_inverse_model(str(inv_ckpt), config_path=str(inv_cfg_path), device=device_str)

    fwd_ckpt = Path(args.forward_model_path)
    fwd_cfg_path = (fwd_ckpt.parent if fwd_ckpt.is_file() else fwd_ckpt) / "config.yaml"
    fwd_config = yaml.safe_load(open(fwd_cfg_path, "r"))
    forward_model = load_forward_model(str(fwd_ckpt), config_path=str(fwd_cfg_path), device=device_str)
    
    # Extract parameters
    min_w = inv_config.get('min_w_value', 0.0)
    w_interval = inv_config.get('w_interval', 1.0)
    w_len = inv_config.get('w_len', 5)
    s_len = inv_config.get('s_len', 3)
    max_length = s_len + w_len
    
    # Parse single policy
    policies = [args.policy]
    print(f"Using policy: {args.policy}")
    
    # Create figure with subplots
    fig, axes = plt.subplots(1, 3, figsize=(15, 5))
    fig.suptitle(f'Diversity-Fidelity Alpha Sensitivity Analysis\\nPolicy: {args.policy}, M={args.budget}', 
                 fontsize=14, fontweight='bold')
    
    colors = plt.colormaps.get_cmap('viridis')(np.linspace(0, 1, len(args.alphas)))
    
    # Collect all results for CSV
    all_results = []
    
    # Process each representative phase
    for phase_idx, phase_deg in enumerate(phases_deg):
        ax = axes[phase_idx]
        
        print(f"\\nProcessing phase {phase_deg}°...")
        
        # Collect data for different alpha values
        phase_results = []
        
        for alpha_idx, alpha in enumerate(args.alphas):
            print(f"  Alpha = {alpha}")
            
            # Compute target for this phase and alpha
            frontier_t_square = frontier_lookup.lookup_frontier_value(phase_deg)
            t_square_target = min(alpha * frontier_t_square, 0.98)
            
            print(f"    Target: tau={t_square_target:.3f} (frontier={frontier_t_square:.3f})")
            
            try:
                # Decode and evaluate
                t_square_pred, phi_pred, w_sequences = decode_for_target(
                    inverse_model, forward_model, t_square_target, phase_deg,
                    args.policy, args.temperature, args.budget, device_str,
                    min_w, w_interval, s_len, w_len, max_length
                )
                
                if len(t_square_pred) == 0:
                    print(f"    No sequences generated")
                    continue
                
                # Apply success criterion
                success_mask = compute_success_mask(
                    t_square_pred, phi_pred, t_square_target, phase_deg,
                    args.theta_deg, args.alpha_hit, frontier_lookup=frontier_lookup
                )
                
                successful_sequences = [w_sequences[i] for i in range(len(w_sequences)) if success_mask[i]]
                
                # Compute metrics
                if len(successful_sequences) > 0:
                    # Fidelity: best complex distance
                    distances = complex_distance(t_square_pred, phi_pred, t_square_target, phase_deg)
                    d_c_min = float(np.min(distances))
                    
                    # Diversity: mean pairwise token L1
                    diversity = compute_diversity(successful_sequences)
                    
                    # Unique successful designs
                    uniq_success = count_unique_sequences(successful_sequences)
                    
                    phase_results.append({
                        'alpha': alpha,
                        'policy': args.policy,
                        'phase_deg': phase_deg,
                        't_square_target': t_square_target,
                        'fidelity': d_c_min,
                        'diversity': diversity,
                        'n_success': len(successful_sequences),
                        'n_unique': uniq_success
                    })
                    
                    print(f"    Results: fidelity={d_c_min:.4f}, diversity={diversity:.4f}, unique={uniq_success}")
                else:
                    print(f"    No successful sequences")
                    
            except Exception as e:
                print(f"    Error: {e}")
                continue
        
        # Plot results for this phase
        if phase_results:
            df_phase = pd.DataFrame(phase_results)
            all_results.extend(phase_results)
            
            # Plot diversity vs fidelity with colors for different alphas
            for alpha_idx, alpha in enumerate(args.alphas):
                alpha_data = df_phase[df_phase['alpha'] == alpha]
                if not alpha_data.empty:
                    ax.scatter(alpha_data['fidelity'], alpha_data['diversity'], 
                             c=[colors[alpha_idx]], s=100, alpha=0.8,
                             label=f'α={alpha}', edgecolors='black', linewidth=0.5)
            
            # Formatting
            ax.set_xlabel('Fidelity (Complex Distance)', fontsize=10)
            ax.set_ylabel('Diversity (Token L1)', fontsize=10)
            ax.set_title(f'φ = {phase_deg:.0f}°', fontsize=12, fontweight='bold')
            ax.grid(True, alpha=0.3)
            ax.legend(fontsize=8)
            
            # Set consistent scales across subplots
            ax.set_xlim(left=0)
            ax.set_ylim(bottom=0)
        else:
            ax.text(0.5, 0.5, f'No data\\nfor φ={phase_deg:.0f}°', 
                   ha='center', va='center', transform=ax.transAxes,
                   fontsize=12, style='italic')
            ax.set_xlabel('Fidelity (Complex Distance)', fontsize=10)
            ax.set_ylabel('Diversity (Token L1)', fontsize=10)
            ax.set_title(f'φ = {phase_deg:.0f}°', fontsize=12, fontweight='bold')
    
    # Adjust layout and save
    plt.tight_layout()
    
    # Save results
    base_name = f"diversity_fidelity_insets_{args.policy.replace(':', '')}_M{args.budget}"
    
    pdf_path = os.path.join(args.outdir, f"{base_name}.pdf")
    png_path = os.path.join(args.outdir, f"{base_name}.png")
    
    plt.savefig(pdf_path, dpi=600, bbox_inches='tight', format='pdf')
    plt.savefig(png_path, dpi=600, bbox_inches='tight', format='png')
    plt.close()
    
    print(f"\\nInsets plots saved:")
    print(f"  PDF: {pdf_path}")
    print(f"  PNG: {png_path}")
    
    # Save summary data
    if all_results:
        csv_path = os.path.join(args.outdir, f"{base_name}.csv")
        pd.DataFrame(all_results).to_csv(csv_path, index=False)
        print(f"  CSV: {csv_path}")
    
    print("Insets analysis completed!")


def main():
    """Main function with argument parsing."""
    parser = argparse.ArgumentParser(
        description="IEEE-TAP ready diversity-fidelity analysis for metasurface design generation",
        formatter_class=argparse.RawDescriptionHelpFormatter
    )
    
    subparsers = parser.add_subparsers(dest='command', help='Analysis mode')
    
    # Common arguments
    def add_common_args(parser):
        parser.add_argument('--frontier', type=str, required=True,
                          help='Path to frontier CSV file (scan results)')
        parser.add_argument('--inverse_checkpoint_dir', type=str, 
                          default="/mnt/storage/users/nati/metamamba/runs/semi_analytical_based/metamamba_causal_lm_0.0_to_80.0_without_R^2_20250903-121054_train_0.85",
                          help='Path to inverse model checkpoint directory')
        parser.add_argument('--forward_model_path', type=str,
                          default="/mnt/storage/users/nati/metamamba/runs/fine_tune/finetune_full_hf_lr0.0005_bb0.0001_a0.7_20250903-082301/best_weighted.pth",
                          help='Path to forward model checkpoint')
        parser.add_argument('--device', type=str, default='cuda:0',
                          help='Device for model inference')
        parser.add_argument('--temperature', type=float, default=1.0,
                          help='Sampling temperature')
        parser.add_argument('--theta_deg', type=float, default=5.0,
                          help='Phase tolerance for success criterion (degrees)')
        parser.add_argument('--alpha_hit', type=float, default=0.95,
                          help='Transmission factor for success criterion')
        parser.add_argument('--alpha_t_square', type=float, default=0.95,
                  help='Multiplier to form target t_square from frontier (t_square_target = alpha_t_square * frontier_t_square)')
        parser.add_argument('--outdir', type=str, default='figs',
                          help='Output directory for figures and data')
        parser.add_argument('--cache_dir', type=str, default=None,
                          help='Directory for caching decoded results')
    
    # Replot subcommand for regenerating plots from existing data
    parser_replot = subparsers.add_parser('replot', help='Regenerate plots from existing CSV data')
    parser_replot.add_argument('--outdir', type=str, default='figs',
                             help='Directory containing CSV data and for output figures')
    parser_replot.add_argument('--budget', type=int, default=512,
                             help='Budget value to identify the correct CSV file')
    parser_replot.add_argument('--temperature', type=float, default=1.0,
                             help='Temperature for caption (cosmetic only)')
    parser_replot.add_argument('--theta_deg', type=float, default=5.0,
                             help='Phase tolerance for caption (cosmetic only)')
    parser_replot.add_argument('--alpha_hit', type=float, default=0.95,
                             help='Transmission factor for caption (cosmetic only)')
    parser_replot.add_argument('--plot_type', type=str, default='fidelity', choices=['fidelity', 'success_diversity'],
                             help='Plot type to regenerate (fidelity or success_diversity)')
    
    # Aggregate subcommand
    parser_agg = subparsers.add_parser('aggregate', help='Main diversity vs fidelity analysis')
    add_common_args(parser_agg)
    parser_agg.add_argument('--n_phases', type=int, default=12,
                          help='Number of phases to analyze')
    parser_agg.add_argument('--budget', type=int, default=512,
                          help='Number of sequences per (phase, policy)')
    parser_agg.add_argument('--policies', nargs='+', default=['topp:0.90', 'topp:0.95', 'topk:10', 'topk:20', 'topk:50'],
                          help='Decoding policies (format: topk:N or topp:P)')
    parser_agg.add_argument('--plot_type', type=str, default='fidelity', choices=['fidelity', 'success_diversity'],
                          help='Plot type: fidelity (default) or success_diversity')
    
    # Insets subcommand  
    parser_insets = subparsers.add_parser('insets', help='Small tau-scan insets analysis')
    add_common_args(parser_insets)
    parser_insets.add_argument('--phases_auto', type=int, default=1,
                             help='Auto-select representative phases (1=true, 0=false)')
    parser_insets.add_argument('--phases_deg', nargs=3, type=float, default=None,
                             help='Specific phases in degrees [easy, edge, dip]')
    parser_insets.add_argument('--budget', type=int, default=128,
                             help='Number of sequences per configuration')
    parser_insets.add_argument('--policy', type=str, default='topp:0.95',
                             help='Single decoding policy for insets')
    parser_insets.add_argument('--alphas', nargs='+', type=float, 
                             default=[0.85, 0.90, 0.95, 0.98],
                             help='Alpha values for target difficulty')
    
    args = parser.parse_args()
    
    # Create output directory
    os.makedirs(args.outdir, exist_ok=True)
    
    if args.command == 'aggregate':
        cmd_aggregate(args)
    elif args.command == 'replot':
        cmd_replot(args)
    elif args.command == 'insets':
        cmd_insets(args)
    else:
        parser.print_help()


if __name__ == '__main__':
    main()
