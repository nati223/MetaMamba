import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import matplotlib
import os
import argparse
from pathlib import Path

# Set up IEEE style plotting
plt.style.use('default')  # Use default instead of seaborn
matplotlib.rcParams.update({
    'font.size': 12,
    'font.family': 'serif',
    # Provide a list of common serif fallbacks so Matplotlib won't fail
    # if 'Times New Roman' isn't available on the system.
    'font.serif': ['Times New Roman', 'Times', 'DejaVu Serif', 'Liberation Serif'],
    'axes.linewidth': 0.8,
    'lines.linewidth': 1.5,
    'xtick.direction': 'in',
    'ytick.direction': 'in',
    'xtick.major.size': 4,
    'ytick.major.size': 4,
    'legend.frameon': True,
    'legend.fancybox': False,
    'legend.edgecolor': 'black',
    'legend.fontsize': 9
})

def load_and_process_scan_results(filepath):
    """Load scan results and extract predicted_t_square and predicted_phi"""
    print(f"Loading scan results from: {filepath}")
    df = pd.read_csv(filepath)
    
    # Extract relevant columns
    t_square = np.array(df['predicted_t_square'].values)
    phi_deg = np.array(df['predicted_phi'].values)
    
    print(f"Scan results: {len(df)} points")
    print(f"T_square range: {np.min(t_square):.3f} - {np.max(t_square):.3f}")
    print(f"Phi range: {np.min(phi_deg):.1f}° - {np.max(phi_deg):.1f}°")
    
    return t_square, phi_deg

def load_and_process_training_data(filepath):
    """Load training data and convert sin_phi, cos_phi to angles"""
    print(f"Loading training data from: {filepath}")
    df = pd.read_csv(filepath)
    
    # Extract normalized sin_phi and cos_phi [0,1]
    sin_phi_norm = np.array(df['sin_phi'].values)
    cos_phi_norm = np.array(df['cos_phi'].values)
    t_square = np.array(df['T_square'].values)
    
    # Denormalize from [0,1] to [-1,1]
    sin_phi = sin_phi_norm * 2.0 - 1.0
    cos_phi = cos_phi_norm * 2.0 - 1.0
    
    # Convert to angles in degrees
    phi_rad = np.arctan2(sin_phi, cos_phi)
    phi_deg = np.degrees(phi_rad)
    
    # Ensure angles are in [0, 360) range
    phi_deg = np.where(phi_deg < 0, phi_deg + 360, phi_deg)
    
    print(f"Training data: {len(df)} points")
    print(f"T_square range: {np.min(t_square):.3f} - {np.max(t_square):.3f}")
    print(f"Phi range: {np.min(phi_deg):.1f}° - {np.max(phi_deg):.1f}°")
    
    return t_square, phi_deg

def load_and_process_cst_data(filepath):
    """Load CST verification data and convert to transmission and phase"""
    print(f"Loading CST data from: {filepath}")
    
    # Read the file, skipping header lines that start with #
    data = []
    with open(filepath, 'r') as f:
        for line in f:
            line = line.strip()
            if line and not line.startswith('#'):
                parts = line.split('\t')
                if len(parts) >= 3:
                    try:
                        run_id = float(parts[0])
                        mag = float(parts[1])
                        pha_deg = float(parts[2])
                        data.append([run_id, mag, pha_deg])
                    except ValueError:
                        continue
    
    if not data:
        print("No valid data found in CST file")
        return np.array([]), np.array([])
    
    data = np.array(data)
    run_ids = data[:, 0]
    magnitudes = data[:, 1]
    phases_deg = data[:, 2]
    
    # Square the magnitude to get transmission squared
    t_square = magnitudes ** 2
    
    # Negate the phase as requested
    phi_deg = -phases_deg
    
    # Ensure angles are in [0, 360) range
    phi_deg = phi_deg % 360
    
    print(f"CST data: {len(data)} points")
    print(f"T_square range: {np.min(t_square):.3f} - {np.max(t_square):.3f}")
    print(f"Phi range: {np.min(phi_deg):.1f}° - {np.max(phi_deg):.1f}°")
    
    return t_square, phi_deg

def compute_envelope(t_square, phi_deg, num_angular_bins=360, alpha=2.5):
    """Compute envelope by finding maximum t_square for each angular bin"""
    # Convert to radians for polar coordinates
    phi_rad = np.radians(phi_deg)
    
    # Create angular bins
    angle_bins = np.linspace(0, 2*np.pi, num_angular_bins, endpoint=False)
    envelope_angles = []
    envelope_t_square = []
    
    for i, angle in enumerate(angle_bins):
        # Find points within angular tolerance (±alpha degrees)
        angle_tolerance = np.radians(alpha)
        
        # Handle wraparound at 0/360 degrees
        if angle < angle_tolerance:
            mask = (phi_rad <= angle + angle_tolerance) | (phi_rad >= 2*np.pi - angle_tolerance)
        elif angle > 2*np.pi - angle_tolerance:
            mask = (phi_rad >= angle - angle_tolerance) | (phi_rad <= angle_tolerance)
        else:
            mask = np.abs(phi_rad - angle) <= angle_tolerance
        
        if np.any(mask):
            max_t_square = np.max(t_square[mask])
            envelope_angles.append(np.degrees(angle))
            envelope_t_square.append(max_t_square)
    
    # Close the gap by ensuring continuity at 0°/360°
    if len(envelope_angles) > 0:
        # Add the first point at the end to close the loop
        envelope_angles.append(envelope_angles[0] + 360)
        envelope_t_square.append(envelope_t_square[0])
    
    return np.array(envelope_t_square), np.array(envelope_angles)

def create_polar_envelope_plot(include_081_line=False, cst_file_path=None, 
                              scan_file_path=None, output_prefix='polar_envelope_ieee',
                              plot_title='|T|² Feasibility Envelope', dpi=300,
                              use_cst_coloring=False):
    """Create the main polar envelope plot"""
    if scan_file_path is None:
        raise ValueError("scan_file_path must be provided")
    
    # Load data (only scan results, no training data)
    scan_t_square, scan_phi = load_and_process_scan_results(scan_file_path)
    
    # Compute envelope
    print("\nComputing envelope...")
    scan_envelope_t, scan_envelope_phi = compute_envelope(scan_t_square, scan_phi)
    
    # Load CST data if provided
    cst_envelope_t = None
    cst_envelope_phi = None
    if cst_file_path and os.path.exists(cst_file_path):
        print("\nLoading CST verification data...")
        cst_t_square, cst_phi = load_and_process_cst_data(cst_file_path)
        if len(cst_t_square) > 0:
            cst_envelope_t, cst_envelope_phi = compute_envelope(cst_t_square, cst_phi)
    
    # Create polar plot
    fig, ax = plt.subplots(figsize=(6, 6), subplot_kw=dict(projection='polar'))
    
    # Convert angles to radians for plotting (counter-clockwise)
    scan_phi_rad = np.radians(scan_envelope_phi)
    
    # Sort by angle for smooth plotting
    scan_sort_idx = np.argsort(scan_phi_rad)
    
    ax.plot(scan_phi_rad[scan_sort_idx], scan_envelope_t[scan_sort_idx], 
        linestyle='-', linewidth=2, label='Efficiency Envelope', color='black')
    
    # Add CST envelope if available
    if cst_envelope_t is not None and len(cst_envelope_t) > 0:
        cst_phi_rad = np.radians(cst_envelope_phi)
        cst_sort_idx = np.argsort(cst_phi_rad)
        ax.plot(cst_phi_rad[cst_sort_idx], cst_envelope_t[cst_sort_idx], 
            linestyle='-', linewidth=2, label='CST Verification', color='green')
    
    # Add 0.9 transmission dashed line in red
    angles_full = np.linspace(0, 2*np.pi, 360)
    transmission_09 = np.full_like(angles_full, 0.9)
    ax.plot(angles_full, transmission_09, linestyle='--', linewidth=1.5, 
        label='|T|² = 0.9', color='red', alpha=0.8)
    
    # Add optional 0.81 transmission dashed line
    if include_081_line:
        transmission_081 = np.full_like(angles_full, 0.81)
        ax.plot(angles_full, transmission_081, linestyle='--', linewidth=1.5, 
            label='|T|² = 0.81', color='orange', alpha=0.8)
    
    # Mark areas where transmission > 0.9 is achieved
    # Determine which data source drives the red/green coloring
    coloring_source = 'scan'
    # By default use forward/scan envelope values for coloring
    scan_vals_for_plot = scan_envelope_t[scan_sort_idx]

    if use_cst_coloring and cst_envelope_t is not None and len(cst_envelope_t) > 0:
        # Interpolate CST envelope onto the scan envelope angles so coloring
        # follows the CST predictions that contribute to the envelope.
        cst_phi_sorted_idx = np.argsort(cst_envelope_phi)
        cst_phi_sorted = cst_envelope_phi[cst_phi_sorted_idx]
        cst_t_sorted = cst_envelope_t[cst_phi_sorted_idx]

        # Extend by +360 for periodic interpolation
        cst_phi_ext = np.concatenate([cst_phi_sorted, cst_phi_sorted + 360.0])
        cst_t_ext = np.concatenate([cst_t_sorted, cst_t_sorted])

        # Target angles (degrees) in the same order used for plotting
        target_angles = np.mod(scan_envelope_phi[scan_sort_idx], 360.0)

        # Ensure interpolation domain covers targets
        cst_interp_on_scan = np.interp(target_angles, cst_phi_ext, cst_t_ext)

        coloring_source = 'CST'
        color_vals = cst_interp_on_scan
    else:
        color_vals = scan_vals_for_plot

    print(f"Coloring zones determined by: {coloring_source}")

    # Find regions where envelope is above 0.9 according to chosen source
    
    above_09_mask = color_vals > 0.9

    # Fill areas above 0.9 with light green (shape still taken from scan envelope)
    if np.any(above_09_mask):
        ax.fill_between(scan_phi_rad[scan_sort_idx], 0.9, 
                       scan_envelope_t[scan_sort_idx],
                       where=above_09_mask, 
                       alpha=0.3, color='green', 
                       label='|T|² > 0.9 achievable')
    
    # Fill areas below 0.9 with light red
    below_09_mask = ~above_09_mask
    if np.any(below_09_mask):
        ax.fill_between(scan_phi_rad[scan_sort_idx], 0, 
                       np.minimum(scan_envelope_t[scan_sort_idx], 0.9),
                       where=below_09_mask,
                       alpha=0.2, color='red', 
                       label='|T|² ≤ 0.9 region')
    
    # Configure polar plot for counter-clockwise direction
    ax.set_theta_direction(1)  # Counter-clockwise (positive direction)
    ax.set_theta_zero_location('E')  # 0° at east (right)
    
    # Set angle ticks at -90° as requested (which is 270° in standard notation)
    angle_ticks = np.arange(0, 360, 30)
    ax.set_thetagrids(angle_ticks)
    
    ax.set_rlabel_position(310)
    
    # Set radial limits and ticks (cap at 1.0)
    max_t_square = np.max(scan_envelope_t)
    if cst_envelope_t is not None and len(cst_envelope_t) > 0:
        max_t_square = max(max_t_square, np.max(cst_envelope_t))
    # Cap the radial axis at 1.0 (physical maximum for |T|^2)
    radial_max = 1.0
    if max_t_square > radial_max:
        print(f"Warning: envelope has values > {radial_max}, capping plot radial limit to {radial_max}.")
    ax.set_ylim(0, radial_max)
    
    # Configure grid and labels
    ax.grid(True, alpha=0.3)
    # ax.set_xlabel('Angle (degrees)', fontsize=12)
    # ax.set_ylabel('T² (Transmission Squared)', fontsize=12, labelpad=30)
    # ax.set_title(plot_title, fontsize=14, pad=20)
    
    # Add legend (moved slightly upwards)
    ax.legend(loc='upper right', bbox_to_anchor=(1.3, 1.12))
    
    # Adjust layout
    plt.tight_layout()
    
    # Save plot with custom prefix and DPI
    output_base = Path(output_prefix)
    output_base.parent.mkdir(parents=True, exist_ok=True)
    png_path = output_base.with_suffix('.png')
    pdf_path = output_base.with_suffix('.pdf')
    plt.savefig(png_path, dpi=dpi, bbox_inches='tight')
    plt.savefig(pdf_path, bbox_inches='tight')
    
    print(f"\nPlot saved as {output_prefix}.png and {output_prefix}.pdf")
    print(f"Scan envelope: {len(scan_envelope_t)} points")
    if cst_envelope_t is not None and len(cst_envelope_t) > 0:
        print(f"CST envelope: {len(cst_envelope_t)} points")
        # Print minimum |T|^2 from CST envelope and its angle
        min_cst_val = np.min(cst_envelope_t)
        min_cst_idx = int(np.argmin(cst_envelope_t))
        min_cst_angle = cst_envelope_phi[min_cst_idx]
        print(f"Minimum CST envelope |T|² contributing to final envelope: {min_cst_val:.4f} at {min_cst_angle:.1f}°")
    elif cst_envelope_t is not None:
        print(f"CST envelope: {len(cst_envelope_t)} points")
    
    # Print statistics about 0.9 transmission achievement
    above_09_percentage = np.sum(scan_envelope_t > 0.9) / len(scan_envelope_t) * 100
    print(f"Percentage of angles achieving |T|² > 0.9: {above_09_percentage:.1f}%")
    
    plt.show()

def main():
    """Main function with argument parsing."""
    parser = argparse.ArgumentParser(
        description='Generate polar feasibility envelope plot with optional CST verification data and reference lines.',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""Examples:
  %(prog)s                                    # Basic plot
  %(prog)s --include-081                     # With 0.81 reference line
  %(prog)s --cst-file CST_envelopeT.txt      # With CST verification data
  %(prog)s --include-081 --cst-file CST_envelopeT.txt  # With both features
        """
    )
    
    parser.add_argument(
        '--cst-file', 
        type=str, 
        help='Path to CST verification data file (tab-separated with Run ID, Magnitude, Phase columns)'
    )
    
    parser.add_argument(
        '--include-081', 
        action='store_true', 
        help='Include T² = 0.81 reference line in orange'
    )
    
    parser.add_argument(
        '--scan-file', 
        type=str, 
        required=True,
        help='Path to scan results CSV file'
    )
    
    parser.add_argument(
        '--output-prefix', 
        type=str, 
        default='polar_envelope_ieee',
        help='Output file prefix for saved plots (default: %(default)s)'
    )
    
    parser.add_argument(
        '--title', 
        type=str, 
        default='|T|² Feasibility Envelope',
        help='Plot title (default: %(default)s)'
    )
    
    parser.add_argument(
        '--dpi', 
        type=int, 
        default=300,
        help='DPI for saved PNG image (default: %(default)d)'
    )

    parser.add_argument(
        '--color-by-cst',
        action='store_true',
        help='Use CST envelope (interpolated onto scan angles) to determine red/green coloring'
    )
    
    args = parser.parse_args()
    
    # Validate CST file if provided
    if args.cst_file and not os.path.exists(args.cst_file):
        print(f"Error: CST file '{args.cst_file}' not found.")
        return 1
    
    # Validate scan file
    if not os.path.exists(args.scan_file):
        print(f"Error: Scan file '{args.scan_file}' not found.")
        return 1
    
    # Print configuration
    print("Polar Envelope Plot Configuration:")
    print(f"  Scan file: {args.scan_file}")
    print(f"  CST file: {args.cst_file if args.cst_file else 'None'}")
    print(f"  Include 0.81 line: {args.include_081}")
    print(f"  Output prefix: {args.output_prefix}")
    print(f"  Plot title: {args.title}")
    print()
    
    # Create the plot
    create_polar_envelope_plot(
        include_081_line=args.include_081,
        cst_file_path=args.cst_file,
        scan_file_path=args.scan_file,
        output_prefix=args.output_prefix,
        plot_title=args.title,
        dpi=args.dpi,
        use_cst_coloring=args.color_by_cst
    )
    
    return 0

if __name__ == "__main__":
    # Example usage (commented out - now using argparse):
    # Basic plot:
    # create_polar_envelope_plot()
    
    # With 0.81 line:
    # create_polar_envelope_plot(include_081_line=True)
    
    # With CST verification data:
    # create_polar_envelope_plot(cst_file_path='/home/nnissan/MTS_Mamba/semi_analytical_model/CST_envelopeT.txt')
    
    # With both 0.81 line and CST data:
    # create_polar_envelope_plot(
    #     include_081_line=True, 
    #     cst_file_path='/home/nnissan/MTS_Mamba/semi_analytical_model/CST_envelopeT.txt'
    # )
    
    exit(main())