"""Select diverse candidate W-sequences per phase via KMeans clustering.

Bins by predicted phase (default) and clusters on token indices.
Selects top `predicted_t_square` candidate per cluster.
"""
import argparse
import os
import sys
import time
import ast
import numpy as np
import pandas as pd
from typing import Optional
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
import utils


def load_scan_csv(path: str) -> pd.DataFrame:
    if not os.path.exists(path):
        raise FileNotFoundError(path)
    df = pd.read_csv(path)
    return df


def select_candidates(
    df: pd.DataFrame,
    phase_col: str = 'predicted_phi',
    n_phase_bins: int = 72,
    n_clusters: int = 4,
    score_field: str = 'predicted_t_square',
    top_k: int = 1,
    random_state: Optional[int] = 42,
) -> pd.DataFrame:
    # Parse token sequences into matrix
    tokens_mat = utils.tokens_matrix_from_df(df, col='generated_w_tokens')

    # Assign phase bins
    df_with_bins, bins = utils.split_by_phase_bins(df, phase_col=phase_col, n_bins=n_phase_bins)

    selected_rows = []
    for bin_idx, bin_df in bins.items():
        if bin_df.empty:
            continue
        indices = bin_df.index.to_numpy()
        sub_tokens = tokens_mat[indices]

        num_clusters = min(n_clusters, max(1, sub_tokens.shape[0]))
        labels, centroids = utils.cluster_w_matrix(sub_tokens, num_clusters, random_state=random_state)

        # For each cluster, pick top-k rows by score_field
        for cluster_id in range(labels.max() + 1):
            mask_local = labels == cluster_id
            if not np.any(mask_local):
                continue
            local_indices = indices[mask_local]
            local_df = df_with_bins.loc[local_indices]
            # sort by score_field descending, select top_k
            if score_field not in local_df.columns:
                raise KeyError(f"Score field '{score_field}' not found in dataframe")
            local_sorted = local_df.sort_values(by=score_field, ascending=False).head(top_k)
            selected_rows.append(local_sorted)

    if not selected_rows:
        return pd.DataFrame()

    result = pd.concat(selected_rows, axis=0)
    # Ensure we include phase_bin
    result = result.sort_values(by=['phase_bin', score_field], ascending=[True, False])
    return result


def main():
    parser = argparse.ArgumentParser(description='Select diverse W candidates per phase via KMeans clustering')
    parser.add_argument('--input-csv', required=True, help='Scan results CSV produced by evaluate_scan.py')
    parser.add_argument('--output-csv', default=None, help='Output CSV for selected candidates')
    parser.add_argument('--phase-col', default='predicted_phi', help='Which phi column to bin on (default: predicted_phi)')
    parser.add_argument('--n-phase-bins', type=int, default=72, help='Number of equal phase bins (default: 72)')
    parser.add_argument('--n-clusters', type=int, default=4, help='KMeans clusters per phase bin (default: 4)')
    parser.add_argument('--top-k', type=int, default=1, help='Top-k candidates to keep per cluster (default: 1)')
    parser.add_argument('--score-field', default='predicted_t_square', help='Field to maximize when selecting (default: predicted_t_square)')
    parser.add_argument('--random-state', type=int, default=42, help='Random state for KMeans')
    parser.add_argument('--emit-cst-txt', action='store_true', help='Also emit whitespace-separated W values file (mm) alongside CSV')

    args = parser.parse_args()

    df = load_scan_csv(args.input_csv)
    print(f"Loaded {len(df)} rows from {args.input_csv}")

    selected = select_candidates(
        df,
        phase_col=args.phase_col,
        n_phase_bins=args.n_phase_bins,
        n_clusters=args.n_clusters,
        score_field=args.score_field,
        top_k=args.top_k,
        random_state=args.random_state,
    )

    out = args.output_csv or f"selected_candidates_{time.strftime('%Y%m%d-%H%M%S')}.csv"
    out_dir = os.path.dirname(out)
    if out_dir:
        os.makedirs(out_dir, exist_ok=True)

    selected.to_csv(out, index=False)
    print(f"Saved {len(selected)} selected candidates to {out}")

    # Optionally emit W-values in mm to a whitespace-separated .txt file
    if getattr(args, 'emit_cst_txt', False):
        txt_out = os.path.splitext(out)[0] + '.txt'
        # Use generated_w_values column (should be numeric tuples in CSV)
        def parse_row_vals(v):
            try:
                return utils.parse_generated_w_field(v).astype(float)
            except Exception:
                # fallback: try ast literal_eval
                return np.array(ast.literal_eval(v), dtype=float)

        with open(txt_out, 'w') as f:
            # header
            w_len = None
            if not selected.empty:
                sample_vals = parse_row_vals(selected.iloc[0]['generated_w_values'])
                w_len = sample_vals.shape[0]
            if w_len is None:
                print(f"No rows selected, skipping {txt_out}")
            else:
                headers = ['Wk{}'.format(i+1) for i in range(w_len)]
                f.write('  '.join(headers) + '\n')
                for _, row in selected.iterrows():
                    vals = parse_row_vals(row['generated_w_values'])
                    # convert mil -> mm (1 mil = 0.0254 mm)
                    vals_mm = vals * 0.0254
                    fmt_vals = ['{:.6f}'.format(float(x)) for x in vals_mm]
                    f.write('   '.join(fmt_vals) + '\n')
        print(f"W-values in mm saved to {txt_out}")


if __name__ == '__main__':
    main()
