#!/usr/bin/env python3
"""Utility script to produce a clean single-policy diversity vs success-rate plot."""

import argparse
import os
from pathlib import Path

import numpy as np
import pandas as pd

import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib import ticker as mtick
from matplotlib.transforms import Bbox
from matplotlib.colors import Normalize


def parse_args():
    parser = argparse.ArgumentParser(
        description="Create a single-policy success-rate vs diversity scatter plot with phase annotations",
        formatter_class=argparse.ArgumentDefaultsHelpFormatter,
    )
    parser.add_argument('--csv', type=str, required=True,
                        help='Path to aggregate CSV (e.g., diversity_fidelity_M512_main.csv)')
    parser.add_argument('--policy', type=str, default='topk:20',
                        help='Policy to visualize (must match entries in CSV)')
    parser.add_argument('--outdir', type=str, default='figs/single_policy',
                        help='Directory for output figures')
    parser.add_argument('--fig_name', type=str, default='single_policy_plot',
                        help='Base filename (without extension) for saved figure')
    parser.add_argument('--marker_size', type=float, default=70,
                        help='Scatter marker size')
    parser.add_argument('--alpha', type=float, default=0.85,
                        help='Marker alpha value to reduce clutter')
    parser.add_argument('--title', type=str, default=None,
                        help='Optional custom title (default uses policy label)')
    parser.add_argument('--budget', type=int, default=512,
                        help='Generation budget M (for display in subtitle)')
    return parser.parse_args()


def load_policy_data(csv_path: str, policy: str) -> pd.DataFrame:
    df = pd.read_csv(csv_path)
    policy_df = df[df['policy'] == policy].copy()
    if policy_df.empty:
        raise ValueError(f"Policy '{policy}' not found in {csv_path}")

    if 'n_success' not in policy_df.columns or 'n_total' not in policy_df.columns:
        raise ValueError("CSV must contain 'n_success' and 'n_total' columns to compute success rate")

    policy_df['success_rate_pct'] = (policy_df['n_success'] / policy_df['n_total']) * 100.0
    policy_df.sort_values('phase_deg', inplace=True)
    return policy_df


def annotate_phases(ax, data: pd.DataFrame, marker_size: float):
    """Label each phase with a clean angle text positioned to avoid overlaps."""
    fig = ax.figure
    fig.canvas.draw()
    renderer = fig.canvas.get_renderer()

    base_offsets = np.array([
        (0.0, 1.0), (0.7, 0.7), (1.0, 0.0), (0.7, -0.7),
        (0.0, -1.0), (-0.7, -0.7), (-1.0, 0.0), (-0.7, 0.7)
    ])

    x_lo, x_hi = ax.get_xlim()
    y_lo, y_hi = ax.get_ylim()
    x_span = max(x_hi - x_lo, 1.0)
    y_span = max(y_hi - y_lo, 1.0)
    base_dx = 0.03 * x_span
    base_dy = 0.04 * y_span

    marker_radius_px = np.sqrt(max(marker_size, 1e-3) / np.pi) * (fig.dpi / 72.0)

    placed_bboxes = []

    def overlaps_existing(bbox: Bbox) -> bool:
        return any(bbox.overlaps(existing) for existing in placed_bboxes)

    ax_bbox = ax.get_window_extent(renderer)

    for idx, row in enumerate(data.itertuples(index=False)):
        x = row.success_rate_pct
        y = row.diversity
        label = f"{row.phase_deg:.0f}°"
        text = ax.text(x, y, label, fontsize=10, ha='center', va='center')

        dirs = np.roll(base_offsets, idx % len(base_offsets), axis=0)
        point_px = ax.transData.transform((x, y))
        point_bbox = Bbox.from_extents(
            point_px[0] - marker_radius_px,
            point_px[1] - marker_radius_px,
            point_px[0] + marker_radius_px,
            point_px[1] + marker_radius_px,
        )

        placed = False
        for scale in (1.0, 1.4, 1.8, 2.2):
            for dx_norm, dy_norm in dirs:
                candidate_x = np.clip(x + dx_norm * base_dx * scale, x_lo, x_hi)
                candidate_y = np.clip(y + dy_norm * base_dy * scale, y_lo, y_hi)
                text.set_position((candidate_x, candidate_y))
                fig.canvas.draw()
                bbox = text.get_window_extent(renderer).expanded(1.05, 1.05)
                shift_x = 0.0
                shift_y = 0.0
                if bbox.x0 < ax_bbox.x0:
                    shift_x = ax_bbox.x0 - bbox.x0
                elif bbox.x1 > ax_bbox.x1:
                    shift_x = ax_bbox.x1 - bbox.x1
                if bbox.y0 < ax_bbox.y0:
                    shift_y = ax_bbox.y0 - bbox.y0
                elif bbox.y1 > ax_bbox.y1:
                    shift_y = ax_bbox.y1 - bbox.y1
                if shift_x or shift_y:
                    dx_data = shift_x / max(ax_bbox.width, 1e-6) * x_span
                    dy_data = shift_y / max(ax_bbox.height, 1e-6) * y_span
                    new_x = np.clip(candidate_x + dx_data, x_lo, x_hi)
                    new_y = np.clip(candidate_y + dy_data, y_lo, y_hi)
                    text.set_position((new_x, new_y))
                    fig.canvas.draw()
                    bbox = text.get_window_extent(renderer).expanded(1.05, 1.05)
                if bbox.overlaps(point_bbox) or overlaps_existing(bbox):
                    continue
                placed_bboxes.append(bbox)
                placed = True
                break
            if placed:
                break

        if not placed:
            text.set_position((x, min(y_hi, y + 0.05 * y_span)))
            fig.canvas.draw()
            bbox = text.get_window_extent(renderer)
            placed_bboxes.append(bbox)


def policy_display_name(policy: str) -> str:
    if policy.startswith('topp:'):
        return f"Top-p {policy.split(':')[1]}"
    if policy.startswith('topk:'):
        return f"Top-k {policy.split(':')[1]}"
    return policy


def plot_policy(policy_df: pd.DataFrame, args):
    cmap = plt.get_cmap('viridis')
    uniq_values = policy_df['uniq_success']
    color_norm = Normalize(vmin=uniq_values.min(), vmax=uniq_values.max())

    fig, ax = plt.subplots(figsize=(6.5, 4.5))
    scatter = ax.scatter(
        policy_df['success_rate_pct'],
        policy_df['diversity'],
        c=uniq_values,
        cmap=cmap,
        norm=color_norm,
        s=args.marker_size,
        alpha=args.alpha,
        edgecolor='black',
        linewidth=0.6,
    )

    ax.set_xlabel('Success Rate', fontsize=12)
    ax.set_ylabel('Diversity', fontsize=12)
    ax.xaxis.set_major_formatter(mtick.PercentFormatter(decimals=0))

    x_min, x_max = policy_df['success_rate_pct'].min(), policy_df['success_rate_pct'].max()
    y_min, y_max = policy_df['diversity'].min(), policy_df['diversity'].max()

    x_margin = max(2.0, 0.03 * (x_max - x_min))
    y_margin = max(0.2, 0.05 * (y_max - y_min))

    ax.set_xlim(max(0, x_min - x_margin), min(100, x_max + x_margin))
    ax.set_ylim(max(0, y_min - y_margin), y_max + y_margin)

    annotate_phases(ax, policy_df, args.marker_size)

    title = args.title if args.title else f"Generative Diversity vs. Success Rate Across Efficiency Frontier"
    ax.set_title(title, fontsize=13, fontweight='bold')
    # add subtitle below with total unique successful designs
    cbar = plt.colorbar(scatter, ax=ax, pad=0.02)
    cbar.set_label('Unique Successful Designs', fontsize=10)

    ax.grid(True, alpha=0.3)
    plt.tight_layout()

    Path(args.outdir).mkdir(parents=True, exist_ok=True)
    pdf_path = Path(args.outdir) / f"{args.fig_name}.pdf"
    png_path = Path(args.outdir) / f"{args.fig_name}.png"

    plt.savefig(pdf_path, dpi=600, bbox_inches='tight')
    plt.savefig(png_path, dpi=600, bbox_inches='tight')
    plt.close(fig)

    print(f"Saved figure to {pdf_path} and {png_path}")


def main():
    args = parse_args()
    policy_df = load_policy_data(args.csv, args.policy)
    plot_policy(policy_df, args)


if __name__ == '__main__':
    main()
