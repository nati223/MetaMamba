from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np


def wrap_phase_radians(phi):
    """Wrap phase to (-π, π] radians."""
    return ((phi + np.pi) % (2 * np.pi)) - np.pi


def wrap_phase_deg(delta):
    values = np.asarray(delta)
    return (values + 180.0) % 360.0 - 180.0


def parity_plot(ref_vals, pred_vals, label, outpath, figsize=(5, 5), s=6, alpha=0.5):
    ref_vals = np.asarray(ref_vals)
    pred_vals = np.asarray(pred_vals)
    outpath = Path(outpath)
    outpath.parent.mkdir(parents=True, exist_ok=True)

    plt.figure(figsize=figsize)
    plt.scatter(ref_vals, pred_vals, s=s, alpha=alpha)
    min_v = min(ref_vals.min(), pred_vals.min())
    max_v = max(ref_vals.max(), pred_vals.max())
    plt.plot([min_v, max_v], [min_v, max_v], "k--", linewidth=1)
    plt.xlabel(f"Reference {label}")
    plt.ylabel(f"Predicted {label}")
    plt.title(f"Parity: {label}")
    plt.grid(alpha=0.3)
    plt.tight_layout()
    plt.savefig(outpath, dpi=300)
    plt.close()


def parity_axes(ax, y_true, y_pred, is_phase=False, scatter_size=60, scatter_alpha=0.7):
    y_true = np.asarray(y_true)
    y_pred = np.asarray(y_pred)

    if is_phase:
        y_true = wrap_phase_deg(y_true)
        y_pred = wrap_phase_deg(y_pred)
        lim_min, lim_max = -180, 180
        ticks = np.arange(-180, 181, 45)
    else:
        lim_min = float(min(y_true.min(), y_pred.min()))
        lim_max = float(max(y_true.max(), y_pred.max()))
        span = lim_max - lim_min
        lim_min -= 0.01 * span
        lim_max += 0.01 * span
        ticks = None

    ax.scatter(y_true, y_pred, s=scatter_size, alpha=scatter_alpha, edgecolor='none')
    ax.plot([lim_min, lim_max], [lim_min, lim_max], 'r--', lw=1)
    ax.set_xlim(lim_min, lim_max)
    ax.set_ylim(lim_min, lim_max)
    if ticks is not None:
        ax.set_xticks(ticks)
        ax.set_yticks(ticks)
    ax.grid(alpha=0.25, linestyle='--', linewidth=0.8)
    return y_true, y_pred