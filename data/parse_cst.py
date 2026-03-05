import argparse
import os
from pathlib import Path
from typing import Iterable, List, Tuple

import numpy as np
import pandas as pd


def _mm_to_mil(values: Iterable[float]) -> List[int]:
    return [round(v / 0.0254) for v in values]


def parse_cst_w_values(txt_path: os.PathLike) -> List[List[int]]:
    """
    Parse Wk* rows from a CST geometry file and convert mm -> mil.

    Args:
        txt_path: Path to file such as natiFreqResp1of11.txt
    Returns:
        List of rows, each with W parameters in mil units.
    """
    w_rows: List[List[int]] = []
    with open(txt_path, "r") as f:
        lines = f.readlines()

    data_start = None
    for i, line in enumerate(lines):
        if line.strip().startswith("Wk1"):
            data_start = i + 1
            break
    if data_start is None:
        raise ValueError(f"W header not found in {txt_path}")

    for line in lines[data_start:]:
        if not line.strip():
            continue
        vals = line.strip().split()
        if len(vals) != 5:
            break
        try:
            w_mm = [float(v) for v in vals]
            w_rows.append(_mm_to_mil(w_mm))
        except ValueError:
            break
    return w_rows


def parse_cst_freq_response_blocks(txt_path: os.PathLike) -> List[pd.DataFrame]:
    """
    Parse frequency-response blocks from CST output.

    Each block produces a DataFrame with columns ['freq', 'mag', 'pha'].
    One block corresponds to one W-row in the paired geometry file.
    """
    blocks: List[pd.DataFrame] = []
    with open(txt_path, "r") as f:
        lines = f.readlines()
    i = 0
    while i < len(lines):
        if lines[i].startswith('#"Frequency / GHz"'):
            while i < len(lines) and not lines[i].startswith("#---"):
                i += 1
            i += 1
            data = []
            while i < len(lines) and lines[i].strip() and not lines[i].startswith("#"):
                parts = lines[i].strip().split()
                if len(parts) == 3:
                    data.append([float(parts[0]), float(parts[1]), float(parts[2])])
                i += 1
            blocks.append(pd.DataFrame(data, columns=["freq", "mag", "pha"]))
        i += 1
    return blocks


def _interpolate_block(df: pd.DataFrame, freqs: np.ndarray) -> Tuple[np.ndarray, np.ndarray]:
    mag_interp = np.interp(freqs, df["freq"], df["mag"])
    pha_interp = np.interp(freqs, df["freq"], df["pha"])
    return mag_interp, pha_interp


def _compose_pair_df(
    w_rows: List[List[int]],
    blocks: List[pd.DataFrame],
    freqs: np.ndarray,
) -> pd.DataFrame:
    data = []
    for w_row, block in zip(w_rows, blocks):
        mag_interp, pha_interp = _interpolate_block(block, freqs)
        data.append(w_row + list(mag_interp) + list(pha_interp))
    w_cols = [f"W{i+1}" for i in range(len(w_rows[0]))]
    mag_cols = [f"mag_{f:.1f}" for f in freqs]
    pha_cols = [f"pha_{f:.1f}" for f in freqs]
    return pd.DataFrame(data, columns=w_cols + mag_cols + pha_cols)


def build_cst_frequency_response_dataset(
    raw_dir: os.PathLike,
    pair_indices: Iterable[int] = range(1, 12),
    geom_template: str = "natiFreqResp{idx}of11.txt",
    resp_template: str = "natiFreqResp{idx}of11T.txt",
    freq_start: float = 18.0,
    freq_end: float = 22.0,
    freq_step: float = 0.1,
    phase_delay_coeff: float = 6.0,
    phase_ref_freq: float = 20.0,
    save_raw_csv: os.PathLike | None = None,
    save_processed_csv: os.PathLike | None = None,
) -> pd.DataFrame:
    """
    Parse CST geometry/response files, correct magnitudes/phases, and output
    data in W2Sdataset-ready column order:
        [W1..Wk, T2(freqs...), phase_deg(freqs...)]

    Args:
        raw_dir: Directory containing the CST geometry/response files.
        pair_indices: Iterable of pair ids to parse (defaults to 1..11).
        geom_template: Filename template for geometry files (must include {idx}).
        resp_template: Filename template for response files (must include {idx}).
        freq_start/end/step: Frequency grid for interpolation (GHz).
        phase_delay_coeff: Multiplier used in phase delay correction (default matches notebook: 360*(3+3)*f/f_ref).
        phase_ref_freq: Reference frequency f_ref in the correction term.
        save_raw_csv: Optional path to save concatenated raw (unsquared/uncorrected) data.
        save_processed_csv: Optional path to save corrected dataset (T^2, phase corrected).
    Returns:
        Processed DataFrame with W columns first, then T^2 per freq, then phase_deg per freq.
    """
    freqs = np.round(np.arange(freq_start, freq_end + 1e-6, freq_step), 1)
    all_dfs: List[pd.DataFrame] = []

    raw_dir = Path(raw_dir)
    if "{idx}" not in geom_template or "{idx}" not in resp_template:
        raise ValueError("geom_template and resp_template must include '{idx}' placeholder")
    for idx in pair_indices:
        w_path = raw_dir / geom_template.format(idx=idx)
        t_path = raw_dir / resp_template.format(idx=idx)
        if not w_path.exists() or not t_path.exists():
            continue
        w_rows = parse_cst_w_values(w_path)
        blocks = parse_cst_freq_response_blocks(t_path)
        if len(w_rows) != len(blocks):
            raise ValueError(f"Pair {idx}: W rows ({len(w_rows)}) != response blocks ({len(blocks)})")
        df = _compose_pair_df(w_rows, blocks, freqs)
        all_dfs.append(df)

    if not all_dfs:
        raise FileNotFoundError(f"No CST pairs parsed from {raw_dir}")

    raw_df = pd.concat(all_dfs, ignore_index=True)
    if save_raw_csv is not None:
        Path(save_raw_csv).parent.mkdir(parents=True, exist_ok=True)
        raw_df.to_csv(save_raw_csv, index=False)

    eff_cols = [c for c in raw_df.columns if c.startswith("mag_")]
    pha_cols = [c for c in raw_df.columns if c.startswith("pha_")]
    w_cols = [c for c in raw_df.columns if c.startswith("W")]

    processed = raw_df.copy()
    processed[eff_cols] = processed[eff_cols] ** 2
    processed[pha_cols] = -processed[pha_cols]
    delphase = 360 * phase_delay_coeff * np.array(freqs) / phase_ref_freq
    for col, dphi in zip(pha_cols, delphase):
        processed[col] -= dphi
    processed[pha_cols] = (processed[pha_cols] + 180) % 360 - 180

    t2_cols = [c.replace("mag_", "T2_") for c in eff_cols]
    processed.rename(columns=dict(zip(eff_cols, t2_cols)), inplace=True)

    column_order = w_cols + t2_cols + pha_cols
    processed = processed[column_order]

    if save_processed_csv is not None:
        Path(save_processed_csv).parent.mkdir(parents=True, exist_ok=True)
        processed.to_csv(save_processed_csv, index=False)

    return processed


def _parse_pair_list(pairs_arg: str) -> Iterable[int]:
    """
    Parse a pair specification like "1-11" or "1,2,5".
    """
    if "-" in pairs_arg:
        start, end = pairs_arg.split("-", 1)
        return range(int(start), int(end) + 1)
    return [int(x) for x in pairs_arg.split(",") if x.strip()]


def main():
    parser = argparse.ArgumentParser(description="Parse CST frequency response files into W2S-ready CSVs.")
    parser.add_argument("--raw-dir", required=True, help="Directory containing natiFreqResp*.txt and natiFreqResp*T.txt")
    parser.add_argument("--pairs", default="1-11", help='Pairs to parse, e.g., "1-11" or "1,2,5"')
    parser.add_argument("--geom-template", default="natiFreqResp{idx}of11.txt", help="Geometry filename template with {idx}")
    parser.add_argument("--resp-template", default="natiFreqResp{idx}of11T.txt", help="Response filename template with {idx}")
    parser.add_argument("--freq-start", type=float, default=18.0)
    parser.add_argument("--freq-end", type=float, default=22.0)
    parser.add_argument("--freq-step", type=float, default=0.1)
    parser.add_argument("--phase-delay-coeff", type=float, default=6.0, help="Coefficient in phase delay correction")
    parser.add_argument("--phase-ref-freq", type=float, default=20.0, help="Reference frequency in phase correction")
    parser.add_argument("--out-raw", type=str, default=None, help="Optional path to save raw parsed CSV")
    parser.add_argument(
        "--out-processed",
        type=str,
        default=None,
        help="Optional path to save processed CSV (defaults to RAW_DIR/processed/freq_response_parsed_processed.csv)",
    )
    args = parser.parse_args()

    raw_dir = Path(args.raw_dir)
    processed_out = (
        Path(args.out_processed)
        if args.out_processed
        else raw_dir / "processed" / "freq_response_parsed_processed.csv"
    )

    pairs = _parse_pair_list(args.pairs)
    df = build_cst_frequency_response_dataset(
        raw_dir=raw_dir,
        pair_indices=pairs,
        geom_template=args.geom_template,
        resp_template=args.resp_template,
        freq_start=args.freq_start,
        freq_end=args.freq_end,
        freq_step=args.freq_step,
        phase_delay_coeff=args.phase_delay_coeff,
        phase_ref_freq=args.phase_ref_freq,
        save_raw_csv=args.out_raw,
        save_processed_csv=processed_out,
    )
    print(f"Parsed {len(df)} rows. Processed CSV saved to {processed_out}")


if __name__ == "__main__":
    main()
