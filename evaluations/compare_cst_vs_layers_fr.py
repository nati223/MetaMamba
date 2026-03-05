#!/usr/bin/env python3
"""
Frequency-response comparison between CST (reference) and model/layer predictions.

Outputs:
- Summary MAE per frequency bin for magnitude (T2) and phase (deg, wrapped).
- Parity plots for magnitude and phase (all bins stacked).
- Example frequency-response overlay (CST vs prediction) for a chosen row.

Usage example:
python evaluations/compare_cst_vs_layers_fr.py \
  --ref-csv /path/to/cst_freq_response.csv \
  --pred-csv /path/to/layers_freq_response.csv \
  --outdir figs/fr_compare \
  --example-idx 0
"""
import argparse
import os
import sys
from pathlib import Path
from typing import Dict, List, Tuple

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import torch

PROJECT_ROOT = Path(__file__).resolve().parent.parent
if str(PROJECT_ROOT) not in sys.path:
    sys.path.append(str(PROJECT_ROOT))

from eval_utils import parity_plot, wrap_phase_deg
from utils import load_forward_model, load_config, normalize_w, norm_sin_cos_to_phase_deg, get_device


def _find_columns(df: pd.DataFrame, prefixes: Tuple[str, ...]) -> List[str]:
    cols = [c for c in df.columns if c.startswith(prefixes)]
    if not cols:
        raise ValueError(f"No columns found with prefixes {prefixes}")
    return sorted(cols, key=lambda x: float(x.split("_")[-1]))


def compute_stats(ref_df: pd.DataFrame, pred_df: pd.DataFrame) -> Dict[str, pd.Series]:
    t2_cols = sorted(set(_find_columns(ref_df, ("T2_", "mag_"))) & set(_find_columns(pred_df, ("T2_", "mag_"))))
    pha_cols = sorted(set(_find_columns(ref_df, ("pha_",))) & set(_find_columns(pred_df, ("pha_",))))

    ref_t2 = ref_df[t2_cols].to_numpy()
    pred_t2 = pred_df[t2_cols].to_numpy()
    ref_pha = ref_df[pha_cols].to_numpy()
    pred_pha = pred_df[pha_cols].to_numpy()

    t2_mae = np.mean(np.abs(pred_t2 - ref_t2), axis=0)
    pha_mae = np.mean(np.abs(wrap_phase_deg(pred_pha - ref_pha)), axis=0)

    return {
        "t2_mae": pd.Series(t2_mae, index=t2_cols),
        "pha_mae": pd.Series(pha_mae, index=pha_cols),
    }

def overlay_example(ref_row: pd.Series, pred_row: pd.Series, outdir: Path, example_idx: int):
    t2_cols = _find_columns(ref_row.index.to_series().to_frame().T, ("T2_", "mag_"))
    pha_cols = _find_columns(ref_row.index.to_series().to_frame().T, ("pha_",))

    freqs_t2 = [float(c.split("_")[-1]) for c in t2_cols]
    freqs_pha = [float(c.split("_")[-1]) for c in pha_cols]

    # Magnitude
    plt.figure(figsize=(8, 3))
    plt.plot(freqs_t2, ref_row[t2_cols].to_numpy(), label="CST", marker="o", markersize=3)
    plt.plot(freqs_t2, pred_row[t2_cols].to_numpy(), label="Pred", marker="x", markersize=3)
    plt.xlabel("Freq")
    plt.ylabel("T2")
    plt.title(f"Example #{example_idx} Magnitude")
    plt.grid(alpha=0.3)
    plt.legend()
    plt.tight_layout()
    plt.savefig(outdir / f"example_{example_idx}_t2.png", dpi=300)
    plt.close()

    # Phase
    plt.figure(figsize=(8, 3))
    plt.plot(freqs_pha, ref_row[pha_cols].to_numpy(), label="CST", marker="o", markersize=3)
    plt.plot(freqs_pha, pred_row[pha_cols].to_numpy(), label="Pred", marker="x", markersize=3)
    plt.xlabel("Freq")
    plt.ylabel("Phase (deg)")
    plt.title(f"Example #{example_idx} Phase")
    plt.grid(alpha=0.3)
    plt.legend()
    plt.tight_layout()
    plt.savefig(outdir / f"example_{example_idx}_phase.png", dpi=300)
    plt.close()


def _parse_design_sequence(raw_values: List[str], design_name: str) -> np.ndarray:
    parsed: List[float] = []
    for token in raw_values:
        parts = [p.strip() for p in token.split(",") if p.strip()]
        for part in parts:
            parsed.append(float(part))
    if not parsed:
        raise ValueError(f"{design_name} sequence is empty")
    return np.asarray(parsed, dtype=np.float32)


def plot_design_ab_forward_response(
    fwd_model,
    min_w: float,
    max_w: float,
    device,
    design_a: np.ndarray,
    design_b: np.ndarray,
    outdir: Path,
    freq_start: float,
    freq_step: float,
):
    designs = np.stack([design_a, design_b], axis=0)
    w_tensor = torch.from_numpy(designs).to(device)
    w_norm = normalize_w(w_tensor, min_w, max_w)

    with torch.no_grad():
        out = fwd_model(w_norm).squeeze(-1)

    freq_bins = out.shape[1] // 3
    out = out.view(-1, freq_bins, 3)
    mag_pred = out[:, :, 0].cpu().numpy()
    sin_pred = out[:, :, 1].clamp(0, 1)
    cos_pred = out[:, :, 2].clamp(0, 1)
    pha_deg = norm_sin_cos_to_phase_deg(sin_pred, cos_pred).cpu().numpy()

    freqs = np.asarray([freq_start + i * freq_step for i in range(freq_bins)], dtype=np.float32)
    labels = ["Design A", "Design B"]

    fig, ax = plt.subplots(figsize=(10, 4))
    for i, label in enumerate(labels):
        linestyle = '-' if i == 0 else '--'
        ax.plot(freqs, mag_pred[i], label=label, linestyle=linestyle, linewidth=2.5)
    ax.set_xlabel("Frequency (GHz)")
    ax.set_ylabel(r"$|T|^2$")
    ax.grid(True, alpha=0.3)
    ax.legend()
    plt.tight_layout()
    plt.savefig(outdir / "fr_forward_designs_efficiency.pdf")
    plt.close()

    fig, ax = plt.subplots(figsize=(10, 4))
    for i, label in enumerate(labels):
        linestyle = '-' if i == 0 else '--'
        ax.plot(freqs, pha_deg[i], label=label, linestyle=linestyle, linewidth=2.5)
    ax.set_xlabel("Frequency (GHz)")
    ax.set_ylabel("Phase (deg)")
    ax.grid(True, alpha=0.3)
    ax.legend()
    plt.tight_layout()
    plt.savefig(outdir / "fr_forward_designs_phase.pdf")
    plt.close()


def main():
    parser = argparse.ArgumentParser(description="Compare CST vs layers/model frequency response.")
    parser.add_argument("--ref-csv", required=True, help="Reference CSV (CST) with T2_* and pha_* columns.")
    parser.add_argument("--layers-csv", required=True, help="Prediction CSV (layers) with matching columns.")
    parser.add_argument("--w-cols", nargs="+", default=["W1", "W2", "W3", "W4", "W5"], help="W column names for forward inference.")
    parser.add_argument("--forward-ckpt", type=str, default=None, help="Optional forward model checkpoint to generate predictions from W columns.")
    parser.add_argument("--forward-config", type=str, default=None, help="Optional config.yaml path for forward model.")
    parser.add_argument("--device", type=str, default=None, help="Device for forward model inference (e.g., cuda:0).")
    parser.add_argument("--freq-start", type=float, default=18.0, help="Start frequency (GHz) for plotting.")
    parser.add_argument("--freq-step", type=float, default=0.1, help="Frequency step (GHz).")
    parser.add_argument("--outdir", default="figs/fr_compare", help="Output directory for plots/stats.")
    parser.add_argument("--example-idx", type=int, default=0, help="Row index to plot example overlay.")
    parser.add_argument("--design-a", nargs="+", default=None, help="Optional W sequence for Design A (space or comma separated values).")
    parser.add_argument("--design-b", nargs="+", default=None, help="Optional W sequence for Design B (space or comma separated values).")
    args = parser.parse_args()

    outdir = Path(args.outdir)
    outdir.mkdir(parents=True, exist_ok=True)

    ref_df = pd.read_csv(args.ref_csv)
    layers_df = pd.read_csv(args.layers_csv)
    if len(ref_df) != len(layers_df):
        raise ValueError(f"Reference and layers CSVs must have same rows (got {len(ref_df)} vs {len(layers_df)})")

    forward_df = None
    fwd_runtime = None
    if args.forward_ckpt:
        device = get_device(args.device)
        fwd_cfg_path = Path(args.forward_config) if args.forward_config else None
        if fwd_cfg_path is None:
            ckpt_path = Path(args.forward_ckpt)
            fwd_cfg_path = (ckpt_path.parent if ckpt_path.is_file() else ckpt_path) / "config.yaml"
        fwd_cfg = load_config(str(fwd_cfg_path), validate=True, mode='loading', strict=False)
        fwd_model = load_forward_model(args.forward_ckpt, config_path=str(fwd_cfg_path), device=str(device))
        min_w = fwd_cfg.get("min_w_value", 0.0)
        max_w = fwd_cfg.get("max_w_value", 80.0)
        fwd_runtime = {
            "model": fwd_model,
            "device": device,
            "min_w": min_w,
            "max_w": max_w,
        }
        w_np = ref_df[args.w_cols].to_numpy(dtype=np.float32)
        w_tensor = torch.from_numpy(w_np).to(device)
        w_norm = normalize_w(w_tensor, min_w, max_w)
        with torch.no_grad():
            out = fwd_model(w_norm).squeeze(-1)
        freq_bins = fwd_cfg.get("frequency_bins", out.shape[1] // 3)
        out = out.view(-1, freq_bins, 3)
        mag_pred = out[:, :, 0]
        sin_pred = out[:, :, 1].clamp(0, 1)
        cos_pred = out[:, :, 2].clamp(0, 1)
        pha_deg = norm_sin_cos_to_phase_deg(sin_pred, cos_pred)
        t2_cols = [f"T2_{args.freq_start + i * args.freq_step:.1f}" for i in range(freq_bins)]
        pha_cols = [f"pha_{args.freq_start + i * args.freq_step:.1f}" for i in range(freq_bins)]
        forward_df = pd.DataFrame(
            np.hstack([mag_pred.cpu().numpy(), pha_deg.cpu().numpy()]),
            columns=t2_cols + pha_cols,
        )

    stats_layers = compute_stats(ref_df, layers_df)
    stats_layers["t2_mae"].to_csv(outdir / "t2_mae_per_freq_layers.csv", header=["mae"])
    stats_layers["pha_mae"].to_csv(outdir / "phase_mae_per_freq_layers.csv", header=["mae"])

    if forward_df is not None:
        stats_forward = compute_stats(ref_df, forward_df)
        stats_forward["t2_mae"].to_csv(outdir / "t2_mae_per_freq_forward.csv", header=["mae"])
        stats_forward["pha_mae"].to_csv(outdir / "phase_mae_per_freq_forward.csv", header=["mae"])

    # Parity plots
    t2_cols = stats_layers["t2_mae"].index.tolist()
    pha_cols = stats_layers["pha_mae"].index.tolist()
    parity_plot(ref_df[t2_cols].to_numpy().ravel(), layers_df[t2_cols].to_numpy().ravel(), "T2 (layers)", outdir / "parity_t2_layers.png")
    parity_plot(ref_df[pha_cols].to_numpy().ravel(), layers_df[pha_cols].to_numpy().ravel(), "Phase (layers)", outdir / "parity_phase_layers.png")
    if forward_df is not None:
        parity_plot(ref_df[t2_cols].to_numpy().ravel(), forward_df[t2_cols].to_numpy().ravel(), "T2 (forward)", outdir / "parity_t2_forward.png")
        parity_plot(ref_df[pha_cols].to_numpy().ravel(), forward_df[pha_cols].to_numpy().ravel(), "Phase (forward)", outdir / "parity_phase_forward.png")

    # Example overlay
    idx = min(max(args.example_idx, 0), len(ref_df) - 1)
    overlay_example(ref_df.iloc[idx], layers_df.iloc[idx], outdir, idx)
    if forward_df is not None:
        overlay_example(ref_df.iloc[idx], forward_df.iloc[idx], outdir, idx)

    if args.design_a is not None or args.design_b is not None:
        if args.design_a is None or args.design_b is None:
            raise ValueError("Both --design-a and --design-b must be provided together")
        if fwd_runtime is None:
            raise ValueError("--forward-ckpt is required when using --design-a/--design-b")

        design_a = _parse_design_sequence(args.design_a, "Design A")
        design_b = _parse_design_sequence(args.design_b, "Design B")
        expected_w_len = len(args.w_cols)
        if design_a.shape[0] != expected_w_len or design_b.shape[0] != expected_w_len:
            raise ValueError(
                f"Design sequences must each have {expected_w_len} values to match --w-cols"
            )

        plot_design_ab_forward_response(
            fwd_model=fwd_runtime["model"],
            min_w=fwd_runtime["min_w"],
            max_w=fwd_runtime["max_w"],
            device=fwd_runtime["device"],
            design_a=design_a,
            design_b=design_b,
            outdir=outdir,
            freq_start=args.freq_start,
            freq_step=args.freq_step,
        )
        print(f"Saved Design A/B forward plots to {outdir}")

    print(f"Saved outputs to {outdir}")


if __name__ == "__main__":
    main()
