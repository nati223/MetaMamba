#!/usr/bin/env python3
"""Generate verification candidates: top-N per 2° bin inside a phase range.

Default behavior: bin size 2°, select top-2 rows by `predicted_t_square` for bins
whose bin center lies within [-45, 45] degrees, and emit a whitespace `.txt`
with W values in mm (header `Wk1 Wk2 ...`).
"""
import argparse
import time
from pathlib import Path
import ast
import numpy as np
import pandas as pd
import sys
sys.path.append(str(Path(__file__).resolve().parents[1]))
import utils
from utils import load_config

MIL_TO_MM = 0.0254


def find_phase_col(df):
    for c in ['predicted_phi', 'phi', 'phase', 'predicted_phi_deg']:
        if c in df.columns:
            return c
    raise KeyError("No phase column found (tried predicted_phi, phi, phase)")


def find_generated_col(df):
    for c in ['generated_w_values', 'generated_w_value', 'generated_w_tokens', 'generated_w']:
        if c in df.columns:
            return c
    raise KeyError("No generated-W column found")


def parse_row_vals(v):
    try:
        return utils.parse_generated_w_field(v).astype(float)
    except Exception:
        return np.array(ast.literal_eval(v), dtype=float)


def bin_center_for_index(bin_idx: int, n_bins: int) -> float:
    binsize = 360.0 / float(n_bins)
    center = (bin_idx + 0.5) * binsize
    # normalize to [-180, 180)
    c = ((center + 180.0) % 360.0) - 180.0
    return c


def main():
    p = argparse.ArgumentParser(description="Generate verification candidates: top W per phase bin")
    p.add_argument('--scan-file', required=True,
                   help='Scan CSV path (produced by evaluate_scan.py)')
    p.add_argument('--bin-size-deg', type=float, default=2.0, help='Phase bin size in degrees (default 2°)')
    p.add_argument('--default-k', type=int, default=1, help='Number of candidates to take per bin by default (outside in-range)')
    p.add_argument('--inrange-k', type=int, default=2, help='Number of candidates to take per bin when bin center in the phase range')
    p.add_argument('--phase-range', type=float, nargs=2, default=[-45.0, 45.0], help='Phase range (min max) in degrees used to decide inrange bins (default -45 45)')
    p.add_argument('--score-field', default='predicted_t_square', help='Field to maximize (default predicted_t_square)')
    p.add_argument('--output-txt', default=None, help='Output whitespace .txt path')
    p.add_argument('--output-csv', default=None, help='Optional output CSV of selected rows')
    args = p.parse_args()

    scan_path = Path(args.scan_file)
    if not scan_path.exists():
        raise FileNotFoundError(scan_path)

    df = pd.read_csv(scan_path)
    if df.empty:
        raise SystemExit("Empty scan CSV")

    phase_col = find_phase_col(df)
    gen_col = find_generated_col(df)

    # Number of bins
    n_bins = int(round(360.0 / float(args.bin_size_deg)))
    df_with_bins, bins = utils.split_by_phase_bins(df, phase_col=phase_col, n_bins=n_bins)

    sel_rows = []
    pr_min, pr_max = args.phase_range

    for bin_idx, bin_df in bins.items():
        if bin_df.empty:
            continue
        # compute bin center in [-180,180)
        center = bin_center_for_index(bin_idx, n_bins)
        if args.score_field not in bin_df.columns:
            raise KeyError(f"Score field '{args.score_field}' not found in dataframe")
        # decide how many candidates to take for this bin
        if pr_min <= center <= pr_max:
            k = args.inrange_k
        else:
            k = args.default_k
        topk = bin_df.sort_values(by=args.score_field, ascending=False).head(k)
        sel_rows.append(topk)

    if not sel_rows:
        print("No candidates selected (no populated bins in the requested phase range).")
        return

    selected = pd.concat(sel_rows, axis=0).reset_index(drop=True)

    # Determine output paths
    ts = time.strftime('%Y%m%d-%H%M%S')
    out_txt = Path(args.output_txt) if args.output_txt else Path(f"verification_candidates_{ts}.txt")
    out_csv = Path(args.output_csv) if args.output_csv else None

    # Prepare W-values matrix and write txt
    is_tokens_col = gen_col == 'generated_w_tokens'
    if is_tokens_col:
        cfg_path = Path(__file__).resolve().parents[1] / "config.yaml"
        if not cfg_path.exists():
            raise FileNotFoundError(f"config.yaml not found at {cfg_path}")
        cfg = load_config(str(cfg_path), validate=True, mode='loading', strict=False)
        min_w = cfg.get('min_w_value', 0.0)
        w_interval = cfg.get('w_interval', 1.0)
        h_len = cfg.get('h_len', 0)
        tokens_mat = utils.tokens_matrix_from_df(selected, col=gen_col)
        w_vals = utils.tokens_to_w(tokens_mat, min_w=min_w, w_interval=w_interval, h_len=h_len).astype(float)
    else:
        rows = []
        for v in selected[gen_col].tolist():
            arr = parse_row_vals(v)
            rows.append(arr.astype(float))
        max_len = max(len(r) for r in rows)
        w_vals = np.zeros((len(rows), max_len), dtype=float)
        for i, r in enumerate(rows):
            w_vals[i, : len(r)] = r

    # Convert mil -> mm
    w_vals_mm = w_vals * MIL_TO_MM

    # Write whitespace-separated .txt with header Wk1 Wk2 ...
    with open(out_txt, 'w') as f:
        headers = ['Wk{}'.format(i + 1) for i in range(w_vals_mm.shape[1])]
        f.write('  '.join(headers) + '\n')
        for row in w_vals_mm:
            fmt = ['{:.6f}'.format(float(x)) for x in row]
            f.write('   '.join(fmt) + '\n')

    print(f"W-values in mm saved to {out_txt}")

    if out_csv:
        selected.to_csv(out_csv, index=False)
        print(f"Selected rows saved to {out_csv}")


if __name__ == '__main__':
    main()
