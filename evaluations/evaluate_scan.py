import os
import sys
# append parent dir to path
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
import argparse
import torch
import yaml
import numpy as np
import pandas as pd
from tqdm import tqdm
import math
import time
import matplotlib.pyplot as plt
from pathlib import Path
from utils import (
    load_inverse_model,
    load_forward_model,
    get_device,
    tokens_to_w,
    phase_deg_to_sin_cos_norm,
    norm_sin_cos_to_phase_deg,
    predict_s_from_w,
)

# Visualization function
def visualize_results(results_df, output_dir='.', filename_prefix="scan_polar_plot"):
    """Generates a polar plot comparing input and predicted S-parameters."""
    if results_df.empty:
        print("Skipping visualization: No results to plot.")
        return

    # Drop rows with NaN predictions for plotting
    plot_df = results_df.dropna(subset=['predicted_t_square', 'predicted_phi']).copy()
    
    # Also drop rows where input_t_square is less than some threshold
    threshold_t_square = 0.81
    plot_df = plot_df[plot_df['predicted_t_square'] >= threshold_t_square].copy()

    print(f"Filtered results for plotting: {len(plot_df)} valid entries after dropping NaNs and input_t_square < {threshold_t_square}.")

    if plot_df.empty:
        print(f"Skipping visualization: No valid results to plot after filtering NaNs and input_t_square < {threshold_t_square}.")
        return

    # Convert degrees to radians for plotting
    plot_df['input_phi_rad'] = np.radians(plot_df['input_phi'])
    plot_df['predicted_phi_rad'] = np.radians(plot_df['predicted_phi'])

    # Create polar plot
    fig, ax = plt.subplots(subplot_kw={'projection': 'polar'}, figsize=(10, 10))

    # Plot input points (use smaller markers, perhaps semi-transparent)
    # Group by input to avoid plotting the same input point multiple times if desired,
    # or plot all predictions originating from each input. Let's plot all predictions.
    ax.scatter(plot_df['input_phi_rad'], plot_df['input_t_square'],
               c='blue', s=10, alpha=0.6, label='Input (T_sq, Phi)')

    # Plot predicted points
    ax.scatter(plot_df['predicted_phi_rad'], plot_df['predicted_t_square'],
               c='red', s=10, alpha=0.6, label='Predicted (T_sq\', Phi\')')

    # Customize plot
    ax.set_rmax(1.1) # T_square max is 1.0, add some margin
    ax.set_rticks(np.arange(0, 1.1, 0.1))  # Radius ticks for T_square
    ax.set_rlabel_position(-22.5)  # Move radial labels away from plotted points
    ax.set_thetagrids(np.arange(0, 360, 30)) # Angle ticks
    ax.grid(True)
    ax.set_title("Inverse -> Forward Model Evaluation: Input vs. Predicted S-Parameters", va='bottom')
    ax.legend(loc='upper right', bbox_to_anchor=(1.1, 1.1))

    # Save plot
    timestamp = time.strftime('%Y%m%d-%H%M%S')
    output_filename = os.path.join(output_dir, f"{filename_prefix}_{timestamp}.png")
    # Ensure output directory exists
    os.makedirs(output_dir, exist_ok=True)
    try:
        plt.savefig(output_filename, bbox_inches='tight')
        print(f"Polar plot saved to {output_filename}")
    except Exception as e:
        print(f"Error saving plot: {e}")
    plt.close(fig) # Close the figure to free memory

# Main function
def main(args):
    # Determine device based on args first
    device = args.device
    target_device = get_device(device)
    print(f"Using device: {target_device}")
    temperature = args.temperature

    # Load inverse model + config
    print(f"Loading inverse model from: {args.inverse_checkpoint_dir}")
    inv_ckpt = Path(args.inverse_checkpoint_dir)
    inv_cfg_path = (inv_ckpt.parent if inv_ckpt.is_file() else inv_ckpt) / "config.yaml"
    inv_config = yaml.safe_load(open(inv_cfg_path, "r"))
    inverse_model = load_inverse_model(checkpoint_path=str(inv_ckpt), config_path=str(inv_cfg_path), device=device)
    print(f"Inverse model loaded on {target_device}")

    # Extract W parameters from inverse model config
    min_w = inv_config.get('min_w_value', 0.0)
    max_w = inv_config.get('max_w_value', 80.0) # Not directly used in main loop after config load
    w_interval = inv_config.get('w_interval', 1.0)
    w_len = inv_config.get('w_len', 5) # Expected length of W sequence
    s_len = inv_config.get('s_len', 3) # Expected length of S sequence

    # Load forward model, passing the determined device string
    forward_model_path = args.forward_model_path or inv_config.get('forward_model_path')
    if not forward_model_path:
        raise ValueError("Forward model path must be provided via --forward_model_path or in the inverse model's config.yaml")
    print(f"Loading forward model from: {forward_model_path}")
    fwd_ckpt = Path(forward_model_path)
    fwd_cfg_path = (fwd_ckpt.parent if fwd_ckpt.is_file() else fwd_ckpt) / "config.yaml"
    fwd_config = yaml.safe_load(open(fwd_cfg_path, "r"))
    forward_model = load_forward_model(checkpoint_path=str(fwd_ckpt), config_path=str(fwd_cfg_path), device=device)
    print(f"Forward model loaded on {target_device}")

    # Define scan parameters
    # Ensure the stop value is inclusive by adding a small epsilon or the step itself
    t_square_values = np.arange(args.t_square_start, args.t_square_stop + args.t_square_step, args.t_square_step)
    phi_values = np.arange(args.phi_start, args.phi_stop, args.phi_step)

    forward_model_batch_preparation_list = []

    # Start scan for inverse model generation
    total_combinations = len(t_square_values) * len(phi_values)
    print(f"Starting inverse model scan over {len(t_square_values)} T_square values and {len(phi_values)} phi values ({total_combinations} total combinations)...")

    pbar_inverse = tqdm(total=total_combinations, desc="Inverse Model: Generating W-sequences")
    for t_square in t_square_values:
        for phi_deg in phi_values:
            sin_phi_norm, cos_phi_norm = phase_deg_to_sin_cos_norm(phi_deg)
            sin_phi_norm = float(sin_phi_norm)
            cos_phi_norm = float(cos_phi_norm)
            # Use S order: [t_square, sin_norm, cos_norm]
            s_params_input = torch.tensor([[t_square, sin_phi_norm, cos_phi_norm]], device=target_device, dtype=torch.float32)

            generated_w_sequences_tokens = set()
            input_ids = s_params_input
            
            if not hasattr(inverse_model, 'generate'):
                 raise AttributeError("Inverse model does not have a standard 'generate' method.")
            generate_fn = inverse_model.generate
            total_generate_length = s_len + w_len

            # Greedy generation
            with torch.no_grad():
                try:
                    output_k1 = generate_fn(
                        input_ids=input_ids,
                        max_length=total_generate_length,
                        top_k=1, top_p=1.0, temperature=temperature, eos_token_id=None,
                        return_dict_in_generate=True
                    )
                    output_tokens_k1 = output_k1.sequences if hasattr(output_k1, 'sequences') else output_k1
                    if output_tokens_k1 is not None and output_tokens_k1.shape[1] >= total_generate_length:
                         generated_tokens = output_tokens_k1[:, s_len:].squeeze().long().tolist()
                         if isinstance(generated_tokens, list) and len(generated_tokens) == w_len : # Ensure it's a list of correct length
                            generated_w_sequences_tokens.add(tuple(generated_tokens))
                         elif isinstance(generated_tokens, int) and w_len == 1: # Handle single token case
                            generated_w_sequences_tokens.add(tuple([generated_tokens]))
                         else:
                            print(f"Warning: Greedy generation produced malformed token list for T_sq={t_square:.2f}, Phi={phi_deg}. Tokens: {generated_tokens}")
                    elif output_tokens_k1 is not None:
                         print(f"Warning: Greedy generation produced sequence shorter than expected ({output_tokens_k1.shape[1]} < {total_generate_length}) for T_sq={t_square:.2f}, Phi={phi_deg}. Skipping.")
                except Exception as e:
                    import inspect
                    if "unexpected keyword argument" in str(e) or "missing 1 required positional argument" in str(e):
                         print(f"\nError during greedy generation (Argument Mismatch) for T_sq={t_square:.2f}, Phi={phi_deg}: {e}")
                         print(f"Check generate function signature: {inspect.signature(generate_fn)}")
                    else:
                        print(f"\nError during greedy generation for T_sq={t_square:.2f}, Phi={phi_deg}: {e}")
                        
            # Top-p generation
            # num_p_samples = args.num_top_p_samples # Use arg for num_p_samples # This line is slightly adjusted
            # Modified condition for top-p sampling:
            if not args.disable_top_p_sampling and args.num_top_p_samples > 0:
                num_p_samples = args.num_top_p_samples # Assign here, inside the conditional block
                input_ids_p = input_ids.repeat(num_p_samples, 1)
                with torch.no_grad():
                    try:
                        output_p = generate_fn(
                            input_ids=input_ids_p,
                            max_length=total_generate_length,
                            top_k=0, 
                            top_p=args.top_p_value, # Use the new command-line argument
                            temperature=temperature, 
                            eos_token_id=None,
                            return_dict_in_generate=True
                        )
                        output_tokens_p = output_p.sequences if hasattr(output_p, 'sequences') else output_p
                        if output_tokens_p is not None and output_tokens_p.dim() == 2 and output_tokens_p.size(0) == num_p_samples:
                            for i in range(output_tokens_p.size(0)):
                                if output_tokens_p[i].shape[0] >= total_generate_length:
                                    generated_tokens = output_tokens_p[i, s_len:].long().tolist()
                                    if isinstance(generated_tokens, list) and len(generated_tokens) == w_len: # Ensure list of correct length
                                        generated_w_sequences_tokens.add(tuple(generated_tokens))
                                    elif isinstance(generated_tokens, int) and w_len == 1: # Handle single token case
                                        generated_w_sequences_tokens.add(tuple([generated_tokens]))
                                    else:
                                        print(f"Warning: Top-p sample {i} produced malformed token list for T_sq={t_square:.2f}, Phi={phi_deg}. Tokens: {generated_tokens}")

                                else:
                                    print(f"Warning: Top-p generation sample {i} shorter than expected ({output_tokens_p[i].shape[0]} < {total_generate_length}) for T_sq={t_square:.2f}, Phi={phi_deg}. Skipping.")
                        elif output_tokens_p is not None:
                             print(f"Warning: Unexpected output shape from top-p generation: {output_tokens_p.shape}. Expected: [{num_p_samples}, {total_generate_length}] for T_sq={t_square:.2f}, Phi={phi_deg}. Skipping batch.")
                    except Exception as e:
                        import inspect
                        if "unexpected keyword argument" in str(e) or "missing 1 required positional argument" in str(e):
                             print(f"\nError during top-p generation (Argument Mismatch) for T_sq={t_square:.2f}, Phi={phi_deg}: {e}")
                             print(f"Check generate function signature: {inspect.signature(generate_fn)}")
                        else:
                            print(f"\nError during top-p generation for T_sq={t_square:.2f}, Phi={phi_deg}: {e}")
            
            # Top-k generation
            if args.top_k_value > 0 and args.num_top_k_samples > 0:
                num_k_samples = args.num_top_k_samples
                input_ids_k = input_ids.repeat(num_k_samples, 1)
                with torch.no_grad():
                    try:
                        output_k = generate_fn(
                            input_ids=input_ids_k,
                            max_length=total_generate_length,
                            top_k=args.top_k_value, 
                            top_p=1.0, # Ensure top_p is not conflicting
                            temperature=temperature, 
                            eos_token_id=None,
                            return_dict_in_generate=True
                        )
                        output_tokens_k = output_k.sequences if hasattr(output_k, 'sequences') else output_k
                        if output_tokens_k is not None and output_tokens_k.dim() == 2 and output_tokens_k.size(0) == num_k_samples:
                            for i in range(output_tokens_k.size(0)):
                                if output_tokens_k[i].shape[0] >= total_generate_length:
                                    generated_tokens = output_tokens_k[i, s_len:].long().tolist()
                                    if isinstance(generated_tokens, list) and len(generated_tokens) == w_len:
                                        generated_w_sequences_tokens.add(tuple(generated_tokens))
                                    elif isinstance(generated_tokens, int) and w_len == 1:
                                        generated_w_sequences_tokens.add(tuple([generated_tokens]))
                                    else:
                                        print(f"Warning: Top-k sample {i} produced malformed token list for T_sq={t_square:.2f}, Phi={phi_deg}. Tokens: {generated_tokens}")
                                else:
                                    print(f"Warning: Top-k generation sample {i} shorter than expected ({output_tokens_k[i].shape[0]} < {total_generate_length}) for T_sq={t_square:.2f}, Phi={phi_deg}. Skipping.")
                        elif output_tokens_k is not None:
                             print(f"Warning: Unexpected output shape from top-k generation: {output_tokens_k.shape}. Expected: [{num_k_samples}, {total_generate_length}] for T_sq={t_square:.2f}, Phi={phi_deg}. Skipping batch.")
                    except Exception as e:
                        import inspect
                        if "unexpected keyword argument" in str(e) or "missing 1 required positional argument" in str(e):
                             print(f"\\nError during top-k generation (Argument Mismatch) for T_sq={t_square:.2f}, Phi={phi_deg}: {e}")
                             print(f"Check generate function signature: {inspect.signature(generate_fn)}")
                        else:
                            print(f"\\nError during top-k generation for T_sq={t_square:.2f}, Phi={phi_deg}: {e}")

            # Prepare inputs for batched forward pass
            for w_token_tuple in generated_w_sequences_tokens:
                if len(w_token_tuple) != w_len:
                     print(f"Warning: Skipping evaluation for sequence with incorrect length {len(w_token_tuple)} (expected {w_len}). Sequence: {w_token_tuple}")
                     continue

                w_token_tensor = torch.tensor(w_token_tuple, device=target_device, dtype=torch.long).unsqueeze(0)
                w_values_tensor = tokens_to_w(w_token_tensor, min_w, w_interval).to(target_device)
                forward_model_batch_preparation_list.append({
                    "input_t_square": t_square,
                    "input_phi_deg": phi_deg,
                    "w_token_tuple": w_token_tuple,
                    "w_values_tensor_orig": w_values_tensor,
                })
            pbar_inverse.update(1)
    pbar_inverse.close()
    print(f"\nInverse model generation completed. Collected {len(forward_model_batch_preparation_list)} W-sequences for forward pass.")

    # Deduplicate W-sequences before forward evaluation to avoid redundant forward passes
    seen_w_tokens = set()
    unique_forward_model_batch_preparation_list = []
    for item in forward_model_batch_preparation_list:
        w_key = item.get("w_token_tuple")
        if w_key not in seen_w_tokens:
            seen_w_tokens.add(w_key)
            unique_forward_model_batch_preparation_list.append(item)

    removed_duplicates_before_forward = len(forward_model_batch_preparation_list) - len(unique_forward_model_batch_preparation_list)
    if removed_duplicates_before_forward > 0:
        print(f"Removed {removed_duplicates_before_forward} duplicate W-sequences before forward evaluation. {len(unique_forward_model_batch_preparation_list)} unique sequences remain.")

    forward_model_batch_preparation_list = unique_forward_model_batch_preparation_list

    results = []
    if not forward_model_batch_preparation_list:
        print("No W-sequences generated by inverse model. Saving empty results and exiting.")
        results_df = pd.DataFrame(results) # Empty dataframe
        output_filename = args.output_csv or f"scan_results_{time.strftime('%Y%m%d-%H%M%S')}_empty.csv"
        output_dir = os.path.dirname(output_filename)
        if output_dir: os.makedirs(output_dir, exist_ok=True)
        results_df.to_csv(output_filename, index=False)
        print(f"Empty results saved to {output_filename}")
        visualize_results(results_df, output_dir=output_dir or '.')
        return

    # --- Batch Evaluation with Forward Model (using utils.predict_s_from_w) ---
    print(f"Starting batched forward model evaluation for {len(forward_model_batch_preparation_list)} sequences...")

    # Build numpy array of w-values (N, w_len)
    w_values_list = [item["w_values_tensor_orig"].squeeze().cpu().numpy() for item in forward_model_batch_preparation_list]
    if not w_values_list:
        print("No W-sequences to evaluate with forward model. Exiting.")
        results_df = pd.DataFrame(results)
        output_filename = args.output_csv or f"scan_results_{time.strftime('%Y%m%d-%H%M%S')}_empty.csv"
        output_dir = os.path.dirname(output_filename)
        if output_dir: os.makedirs(output_dir, exist_ok=True)
        results_df.to_csv(output_filename, index=False)
        print(f"Empty results saved to {output_filename}")
        visualize_results(results_df, output_dir=output_dir or '.')
        return

    w_values_array = np.stack(w_values_list, axis=0)
    batch_size = args.forward_batch_size
    all_s_params_pred_batches = []
    pbar_forward = tqdm(total=w_values_array.shape[0], desc="Forward Model: Processing Batches")
    for start in range(0, w_values_array.shape[0], batch_size):
        stop = min(start + batch_size, w_values_array.shape[0])
        batch = w_values_array[start:stop]
        try:
            s_pred_batch = predict_s_from_w(forward_model, batch, min_w, max_w, device=device, clamp=True)
            all_s_params_pred_batches.append(s_pred_batch)
        except Exception as e:
            print(f"\nError during forward model batch prediction for indices {start}:{stop}: {e}")
            nan_block = np.full((stop - start, s_len), np.nan, dtype=float)
            all_s_params_pred_batches.append(nan_block)
        pbar_forward.update(stop - start)
    pbar_forward.close()

    final_all_s_params_pred = np.vstack(all_s_params_pred_batches)

    print("\nProcessing batched forward model results...")
    for i in range(len(forward_model_batch_preparation_list)):
        item_context = forward_model_batch_preparation_list[i]
        s_params_pred_single_tensor = final_all_s_params_pred[i] # Shape [s_len]

        input_t_square_val = item_context["input_t_square"]
        input_phi_deg_val = item_context["input_phi_deg"]
        w_token_tuple_val = item_context["w_token_tuple"]
        w_values_tensor_val = item_context["w_values_tensor_orig"]

        pred_t_square_val, pred_phi_deg_val = float('nan'), float('nan')
        t_square_error_val, phi_error_val = float('nan'), float('nan')

        # `final_all_s_params_pred` is a numpy array; use numpy isnan
        if np.isnan(s_params_pred_single_tensor).any():
            # print(f"Warning: NaN prediction encountered for input T_sq={input_t_square_val:.2f}, Phi={input_phi_deg_val}, W={w_token_tuple_val}. Errors will be NaN.")
            pass # Errors will remain NaN by default
        elif s_params_pred_single_tensor.shape == (s_len,) and s_len == 3:
            # Model outputs S as [t_square, sin_norm, cos_norm]
            pred_t_square_val = float(s_params_pred_single_tensor[0])
            pred_sin_phi_val = float(s_params_pred_single_tensor[1])
            pred_cos_phi_val = float(s_params_pred_single_tensor[2])

            pred_phi_deg_val = float(norm_sin_cos_to_phase_deg(pred_sin_phi_val, pred_cos_phi_val))

            t_square_error_val = abs(pred_t_square_val - input_t_square_val)
            phi_error_raw_val = abs(pred_phi_deg_val - input_phi_deg_val)
            phi_error_val = min(phi_error_raw_val, 360 - phi_error_raw_val)
        else:
            print(f"Warning: Unexpected shape or s_len for single prediction result. Shape: {s_params_pred_single_tensor.shape}, s_len: {s_len}. For input T_sq={input_t_square_val:.2f}, Phi={input_phi_deg_val}, W={w_token_tuple_val}")

        results.append({
            "input_t_square": input_t_square_val,
            "input_phi": input_phi_deg_val,
            "generated_w_tokens": w_token_tuple_val,
            "generated_w_values": tuple(w_values_tensor_val.squeeze().cpu().tolist()),
            "predicted_t_square": pred_t_square_val,
            "predicted_phi": pred_phi_deg_val,
            "t_square_error": t_square_error_val,
            "phi_error": phi_error_val
        })

    print(f"\nScan and evaluation completed. Processed {len(results)} W-sequences in total.")

    # Deduplicate results before saving
    if results:
        original_count = len(results)
        # Convert list of dicts to list of tuples of sorted items to make them hashable for set operations
        seen_results_tuples = set()
        unique_results_list = []
        for res_dict in results:
            # Sort items by key to ensure consistent tuple representation
            res_tuple = tuple(sorted(res_dict.items()))
            if res_tuple not in seen_results_tuples:
                seen_results_tuples.add(res_tuple)
                unique_results_list.append(res_dict)
        
        results = unique_results_list
        deduplicated_count = len(results)
        print(f"Removed {original_count - deduplicated_count} duplicate entries from results. {deduplicated_count} unique entries remaining.")
    else:
        print("No results to deduplicate.")

    # Save results to CSV
    results_df = pd.DataFrame(results)
    # remove duplicates according to W values before saving, print how much were removed
    before_deduplication = results_df.shape[0]
    results_df = results_df[~results_df['generated_w_values'].duplicated(keep='first')]
    after_deduplication = results_df.shape[0]
    print(f"Removed {before_deduplication - after_deduplication} duplicate entries from results. {after_deduplication} unique entries remaining.")
    output_filename = args.output_csv or f"scan_results_{time.strftime('%Y%m%d-%H%M%S')}.csv"
    output_dir = os.path.dirname(output_filename)
    if output_dir: # Ensure output directory exists
        os.makedirs(output_dir, exist_ok=True)
    
    results_df.to_csv(output_filename, index=False)
    print(f"Full scan results saved to {output_filename}")

    # Visualize results
    visualize_results(results_df, output_dir=output_dir or '.', filename_prefix=os.path.splitext(os.path.basename(output_filename))[0])


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Evaluate inverse model generation scan.')
    parser.add_argument('--inverse_checkpoint_dir', type=str, required=True,
                        help='Path to the inverse model checkpoint directory (containing config.yaml and model weights)')
    parser.add_argument('--forward_model_path', type=str, default=None,
                        help='Path to the forward model checkpoint (.pth file). If None, tries to find path in inverse model config.')
    parser.add_argument('--output_csv', type=str, default=None,
                        help='Path to save the results CSV file (e.g., results/scan.csv). Defaults to scan_results_<timestamp>.csv in the current directory.')
    
    parser.add_argument('--device', type=str, default='cuda:0',
                        help=f'Device to use (e.g., "cuda:0"')
    
    # Scan range arguments
    parser.add_argument('--t_square_start', type=float, default=0.81, help='Start value for T_square scan (default: 0.81)')
    parser.add_argument('--t_square_stop', type=float, default=1.0, help='Stop value for T_square scan (inclusive, default: 1.0)')
    parser.add_argument('--t_square_step', type=float, default=0.01, help='Step size for T_square scan (default: 0.01)')
    parser.add_argument('--phi_start', type=int, default=0, help='Start value for phi scan in degrees (default: 0)')
    parser.add_argument('--phi_stop', type=int, default=360, help='Stop value for phi scan in degrees (exclusive, default: 360)')
    parser.add_argument('--phi_step', type=int, default=2,
                        help='Step size for phi values in degrees during scan (default: 2).')
    # Sampling arguments
    parser.add_argument('--num_top_p_samples', type=int, default=512,
                        help='Number of samples to generate with top-p sampling (default: 512). Set to 0 to disable top-p.')
    parser.add_argument('--disable_top_p_sampling', action='store_true',
                        help='If present, top-p sampling will be skipped.')
    parser.add_argument('--top_p_value', type=float, default=0.9,
                        help='The p value for top-p sampling (default: 0.9).')
    parser.add_argument('--top_k_value', type=int, default=0,
                        help='The k value for top-k sampling. If > 0, top-k sampling is enabled. (default: 0, i.e., disabled)')
    parser.add_argument('--num_top_k_samples', type=int, default=512,
                        help='Number of samples to generate with top-k sampling if enabled (default: 512). Set to 0 to disable top-k even if top_k_value is set.')
    parser.add_argument('--temperature', type=float, default=1.0,
                        help='Temperature for sampling (default: 1.0).')
    parser.add_argument('--forward_batch_size', type=int, default=16384,
                        help='Batch size for forward model evaluation (default: 16384).')
    args = parser.parse_args()

    main(args)