#!/usr/bin/env python3
"""
CST vs Semi-Analytical (SA) Comparison Analysis Script

This script performs comprehensive comparison analysis between CST simulations and 
semi-analytical (SA) model results, including forward model predictions.

Features:
- Data loading and preprocessing
- Forward model evaluation
- Parity plots with metrics
- Polar error maps
- All figures saved in both PNG and PDF formats
"""

import os
import sys
from pathlib import Path
import math
import argparse
import datetime as dt
import numpy as np
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
from scipy import stats
import torch
from matplotlib.collections import LineCollection

# Ensure project root is in path before project imports
PROJECT_ROOT = Path(__file__).resolve().parent.parent
if str(PROJECT_ROOT) not in sys.path:
    sys.path.append(str(PROJECT_ROOT))

from eval_utils import parity_axes, wrap_phase_deg
from utils import load_forward_model, load_config, normalize_w

# Configuration
pd.set_option('display.max_columns', 200)
pd.set_option('display.width', 200)
sns.set_theme(style="whitegrid", context="notebook")
np.random.seed(42)

class CSTPMATLABAnalyzer:
    """Main analyzer class for CST vs Semi-Analytical comparison."""
    
    def __init__(self, cst_csv, matlab_csv, checkpoint, split, device='cuda', forward_config=None, outdir=None):
        """Initialize analyzer with user-provided paths."""
        self.cst_path = cst_csv
        self.matlab_path = matlab_csv
        self.fwd_path = checkpoint
        self.split_path = split
        self.device = device
        self.fwd_cfg_path = Path(forward_config) if forward_config else (Path(self.fwd_path).parent / "config.yaml")
        self.fwd_cfg = load_config(str(self.fwd_cfg_path), validate=True, mode='loading', strict=False)
        self.min_w = self.fwd_cfg.get('min_w_value', 0.0)
        self.max_w = self.fwd_cfg.get('max_w_value', 80.0)
        
        # Create output directory
        now = dt.datetime.now().strftime("%Y%m%d-%H%M%S")
        if outdir:
            self.fig_dir = Path(outdir)
        else:
            self.fig_dir = Path(self.fwd_path).parent / f"figures_cst_vs_matlab_{now}"
        self.fig_dir.mkdir(parents=True, exist_ok=True)
        
        print(f"Figures and outputs will be saved to: {self.fig_dir}")
        
        # Data containers
        self.merged = None
        self.merged_test = None
        self.val_idx = None
        self.test_idx = None
        self.forward_model = None
        
        # Analysis results
        self.error_stats = {}
        
    def load_data(self):
        """Load and preprocess CSV data."""
        print("Loading CSV data...")
        
        # Load CSVs
        cst_df = pd.read_csv(self.cst_path)
        mat_df = pd.read_csv(self.matlab_path)
        
        # Load split indices
        spl = np.load(self.split_path)
        self.val_idx = spl.get('val')
        self.test_idx = spl.get('test')
        
        print(f"train size: {len(spl.get('train',[]))}, val size: {len(self.val_idx)}, test size: {len(self.test_idx)}")
        
        # Expected columns
        w_cols = ["W1","W2","W3","W4","W5"]
        required_cst = set(["T_pha","T_square"]) | set(w_cols)
        required_mat = set(["T_pha","T_square"])
        
        missing_cst = [c for c in required_cst if c not in cst_df.columns]
        missing_mat = [c for c in required_mat if c not in mat_df.columns]
        if missing_cst:
            raise ValueError(f"CST CSV missing required columns: {missing_cst}")
        if missing_mat:
            raise ValueError(f"MATLAB CSV missing required columns: {missing_mat}")
        
        # Rename to avoid collisions
        cst_df = cst_df.rename(columns={"T_pha":"T_pha_CST", "T_square":"T_square_CST"})
        mat_df = mat_df.rename(columns={"T_pha":"T_pha_MATLAB", "T_square":"T_square_MATLAB"})
        
        # Align dataframes
        min_len = min(len(cst_df), len(mat_df))
        cst_df = cst_df.iloc[:min_len].reset_index(drop=True)
        mat_df = mat_df.iloc[:min_len].reset_index(drop=True)
        
        # Drop NaN rows
        key_cols = ["T_pha_CST","T_square_CST","T_pha_MATLAB","T_square_MATLAB"]
        combined_key = pd.concat([cst_df[key_cols[:2]], mat_df[key_cols[2:]]], axis=1)
        mask = combined_key[key_cols].notna().all(axis=1)
        kept = int(mask.sum())
        print(f"Keeping {kept}/{len(combined_key)} rows after dropping NaNs in key columns.")
        
        cst_df = cst_df[mask].reset_index(drop=True)
        mat_df = mat_df[mask].reset_index(drop=True)
        
        # Merge frames
        self.merged = pd.concat([
            cst_df[w_cols + ["T_pha_CST","T_square_CST"]],
            mat_df[["T_pha_MATLAB","T_square_MATLAB"]]
        ], axis=1)
        
        # Create SA aliases
        self.merged['T_pha_SA'] = self.merged['T_pha_MATLAB']
        self.merged['T_square_SA'] = self.merged['T_square_MATLAB']
        
        print(f"Merged data shape: {self.merged.shape}")
        
    def load_forward_model(self):
        """Load and configure the forward model."""
        print("Loading forward model...")
        
        self.forward_model = load_forward_model(
            checkpoint_path=self.fwd_path,
            config_path=str(self.fwd_cfg_path),
            device=self.device,
        )
        self.forward_model.eval()
        self._device = next(self.forward_model.parameters()).device
        print("Forward model ready on:", self._device)
        
    def run_forward_predictions(self, data_subset=None):
        """Run forward model predictions on data."""
        print("Running forward model predictions...")
        
        if data_subset is None:
            data_subset = self.merged
            
        w_cols = ["W1","W2","W3","W4","W5"]
        W_np = data_subset[w_cols].to_numpy(dtype=np.float32)
        W_n = torch.from_numpy(W_np).unsqueeze(-1).to(self._device)
        
        # Normalize inputs
        W_n = normalize_w(W_n, self.min_w, self.max_w)
        
        with torch.no_grad():
            out = self.forward_model(W_n)
            if out.dim() == 3 and out.shape[-1] == 1:
                out = out.squeeze(-1)

            freq_bins = self.fwd_cfg.get("frequency_bins", out.shape[1] // 3)
            out = out.view(-1, freq_bins, 3)
            pred_tsq = out[:, 0, 0].detach().cpu().numpy()
            pred_sin = out[:, 0, 1].detach().cpu().numpy()
            pred_cos = out[:, 0, 2].detach().cpu().numpy()
        
        # Convert to degrees
        pred_sin01 = np.clip(pred_sin, 0, 1)
        pred_cos01 = np.clip(pred_cos, 0, 1)
        pred_sin11 = pred_sin01 * 2 - 1
        pred_cos11 = pred_cos01 * 2 - 1
        pred_phi_deg = (np.degrees(np.arctan2(pred_sin11, pred_cos11)) + 360) % 360
        
        return pred_phi_deg, pred_tsq
        
    def prepare_test_data(self):
        """Prepare test subset with forward predictions."""
        print("Preparing test data...")
        
        self.merged_test = self.merged.iloc[self.test_idx].reset_index(drop=True)
        pred_phi_deg, pred_tsq = self.run_forward_predictions(self.merged_test)
        
        self.merged_test['T_square_FWD_FT'] = pred_tsq
        self.merged_test['T_pha_FWD_FT'] = pred_phi_deg
        
        print(f"Test subset size: {len(self.merged_test)}")
        
    @staticmethod
    def wrap_deg(delta):
        """Wrap phase difference to [-180, 180) degrees."""
        return wrap_phase_deg(delta)
    
    @staticmethod
    def add_radius_guides(ax, radii=None, color='#BBBBBB', lw=0.6, ls=':', alpha=0.7):
        """Add concentric magnitude circles to polar plots."""
        if radii is None:
            radii = np.arange(0.2, 1.01, 0.2)
        for r in radii:
            circ = plt.Circle((0,0), r, edgecolor=color, facecolor='none', 
                            lw=lw, ls=ls, alpha=alpha)
            ax.add_patch(circ)
        ax.set_xlim(-1.05, 1.05)
        ax.set_ylim(-1.05, 1.05)
        ax.set_aspect('equal', adjustable='box')
        
    @staticmethod
    def add_radius_scale(ax, step=0.2, rmax=1.0, label_angle_deg=-90,
                        circle_kwargs=None, text_kwargs=None,
                        draw_cross=True, draw_grid=True, fontsize=12):
        """Add concentric radius guide circles with labels."""
        if circle_kwargs is None:
            circle_kwargs = dict(color='0.55', lw=0.7, ls='--', alpha=0.5, zorder=0)
        if text_kwargs is None:
            text_kwargs = dict(color='0.35', fontsize=12, ha='left', va='bottom')
            
        theta = np.deg2rad(label_angle_deg)
        ct, st = np.cos(theta), np.sin(theta)
        
        ax.set_aspect('equal', adjustable='box')
        
        radii = np.arange(step, rmax + 1e-9, step)
        for r in radii:
            circ = plt.Circle((0, 0), r, fill=False, **circle_kwargs)
            ax.add_patch(circ)
            ax.text(ct * r * 1.02, st * r * 1.02, f"{r:.1f}", **text_kwargs)
            
        if draw_cross:
            ax.axhline(0, color='0.7', lw=0.6, alpha=0.6)
            ax.axvline(0, color='0.7', lw=0.6, alpha=0.6)
        if draw_grid:
            ax.grid(True, color='0.8', lw=0.6, ls=':', alpha=0.6)
        
    def save_figure(self, fig, name, formats=['png', 'pdf'], dpi=300):
        """Save figure in multiple formats."""
        saved_files = []
        # Ensure the figure size is fixed before saving
        size_inches = fig.get_size_inches().tolist()
        fig.set_size_inches(size_inches)

        for fmt in formats:
            path = self.fig_dir / f"{name}.{fmt}"
            if fmt.lower() == 'png':
                # Save raster with explicit dpi and without tight bbox so page size matches PDF
                fig.savefig(path, dpi=dpi, bbox_inches=None, pad_inches=0.02, facecolor='white')
            else:
                # Save vector format using the figure size (no tight bbox)
                fig.savefig(path, format=fmt, bbox_inches=None, facecolor='white')
            saved_files.append(path)
        return saved_files
        
    def plot_parity_analysis(self):
        """Generate parity plots for phase and magnitude."""
        print("Generating parity plots...")
            
        def _metrics(y_true, y_pred, is_phase=False):
            if is_phase:
                y_true = wrap_phase_deg(y_true)
                y_pred = wrap_phase_deg(y_pred)
                d = wrap_phase_deg(y_pred - y_true)
            else:
                d = y_pred - y_true
            mae = np.mean(np.abs(d))
            if np.std(y_true) < 1e-9 or np.std(y_pred) < 1e-9:
                r = np.nan
            else:
                r, _ = stats.pearsonr(y_true, y_pred)
            r2 = r**2 if not np.isnan(r) else np.nan
            return {'N': len(y_true), 'MAE': mae, 'R2': r2}
        
        def _annot(ax, m):
                txt = (f"MAE={m['MAE']:.3f}\n$R^2$={m['R2']:.3f}" if not np.isnan(m['R2'])
                    else f"MAE={m['MAE']:.3f}\n$R^2$=--")
                # larger annotation box for readability; move slightly lower and more right to remain inside figure
                ax.text(0.06, 0.93, txt,
                    transform=ax.transAxes, va='top', ha='left', fontsize=14,
                    bbox=dict(boxstyle='round', facecolor='white', alpha=0.95, edgecolor='#333', linewidth=1.0, pad=0.8))
        
        def _parity_axes(ax, y_true, y_pred, is_phase=False):
            y_true_plot, y_pred_plot = parity_axes(ax, y_true, y_pred, is_phase=is_phase)
            return _metrics(y_true_plot, y_pred_plot, is_phase=is_phase)
        
        plt.rcParams.update({
            'font.size': 11,
            'axes.labelsize': 11,
            'axes.titlesize': 11,
            'xtick.labelsize': 10,
            'ytick.labelsize': 10,
            'legend.fontsize': 9,
        })
        
        # Create four separate parity figures (each saved individually)
        # 1) LAYERS phase vs CST
        fig1, ax1 = plt.subplots(1, 1, figsize=(5.0, 5.0), constrained_layout=True)
        m1 = _parity_axes(ax1, self.merged_test['T_pha_MATLAB'].to_numpy(), self.merged_test['T_pha_CST'].to_numpy(), is_phase=True)
        # ax1.set_xlabel(r'LAYERS $\angle T$ (deg)')
        # ax1.set_ylabel(r'CST $\angle T$ (deg)')
        ax1.set_xlabel(r'LAYERS Phase (deg)', fontsize=16)
        ax1.set_ylabel(r'CST Phase (deg)', fontsize=16)
        _annot(ax1, m1)
        ax1.set_aspect('equal', adjustable='box')
        self.save_figure(fig1, 'parity_phase_layers_vs_cst')
        plt.close(fig1)

        # 2) Forward phase vs CST
        fig2, ax2 = plt.subplots(1, 1, figsize=(5.0, 5.0), constrained_layout=True)
        m2 = _parity_axes(ax2, self.merged_test['T_pha_FWD_FT'].to_numpy(), self.merged_test['T_pha_CST'].to_numpy(), is_phase=True)
        # ax2.set_xlabel(r'Fine-Tuned Forward $\angle T$ (deg)')
        # ax2.set_ylabel(r'CST $\angle T$ (deg)')
        ax2.set_xlabel(r'FT Forward Surrogate Phase (deg)', fontsize=16)
        ax2.set_ylabel(r'CST Phase (deg)', fontsize=16)
        _annot(ax2, m2)
        ax2.set_aspect('equal', adjustable='box')
        self.save_figure(fig2, 'parity_phase_forward_vs_cst')
        plt.close(fig2)

        # 3) LAYERS magnitude vs CST
        fig3, ax3 = plt.subplots(1, 1, figsize=(5.0, 5.0), constrained_layout=True)
        m3 = _parity_axes(ax3, self.merged_test['T_square_MATLAB'].to_numpy(), self.merged_test['T_square_CST'].to_numpy(), is_phase=False)
        ax3.set_xlabel(r'LAYERS $|T|^2$', fontsize=16)
        ax3.set_ylabel(r'CST $|T|^2$', fontsize=16)
        _annot(ax3, m3)
        ax3.set_aspect('equal', adjustable='box')
        self.save_figure(fig3, 'parity_magnitude_layers_vs_cst')
        plt.close(fig3)

        # 4) Forward magnitude vs CST
        fig4, ax4 = plt.subplots(1, 1, figsize=(5.0, 5.0), constrained_layout=True)
        m4 = _parity_axes(ax4, self.merged_test['T_square_FWD_FT'].to_numpy(), self.merged_test['T_square_CST'].to_numpy(), is_phase=False)
        ax4.set_xlabel(r'FT Forward Surrogate $|T|^2$', fontsize=16)
        ax4.set_ylabel(r'CST $|T|^2$', fontsize=16)
        _annot(ax4, m4)
        ax4.set_aspect('equal', adjustable='box')
        self.save_figure(fig4, 'parity_magnitude_forward_vs_cst')
        plt.close(fig4)
        
    def plot_polar_agreement(self):
        """Generate polar agreement plots."""
        print("Generating polar agreement plots...")
        
        def unit_circle_from_phase_deg(phi_deg):
            phi_rad = np.radians(phi_deg)
            return np.cos(phi_rad), np.sin(phi_rad)
        
        # SA vs CST phase agreement
        phi_sa = self.merged['T_pha_MATLAB'].to_numpy()
        phi_cst = self.merged['T_pha_CST'].to_numpy()
        
        x_sa, y_sa = unit_circle_from_phase_deg(phi_sa)
        x_cst, y_cst = unit_circle_from_phase_deg(phi_cst)
        
        # Identify best/worst points
        phase_gap_deg = self.wrap_deg(phi_cst - phi_sa)
        phase_err_mag = np.abs(phase_gap_deg) / 180.0
        
        frac = 0.1
        n = len(phase_gap_deg)
        keep = max(1, int(n * frac))
        
        phase_best_idx = np.argsort(phase_err_mag)[:keep]
        phase_worst_idx = np.argsort(phase_err_mag)[-keep:]
        
        theta = np.linspace(0, 2*np.pi, 400)
        
        fig = plt.figure(figsize=(6,6))
        plt.plot(np.cos(theta), np.sin(theta), 'k-', lw=0.8, alpha=0.4)
        plt.scatter(x_sa, y_sa, s=5, alpha=0.15, label=r'LAYERS $\angle T$')
        plt.scatter(x_cst, y_cst, s=5, alpha=0.15, label=r'CST $\angle T$')
        
        for idx in phase_best_idx:
            plt.plot([x_sa[idx], x_cst[idx]], [y_sa[idx], y_cst[idx]], 
                    color='tab:green', alpha=0.7, lw=1)
        for idx in phase_worst_idx:
            plt.plot([x_sa[idx], x_cst[idx]], [y_sa[idx], y_cst[idx]], 
                    color='tab:red', alpha=0.7, lw=1)
                    
        plt.gca().set_aspect('equal', adjustable='box')
        plt.title(r'LAYERS vs CST $\angle T$ Agreement (Best=green / Worst=red)')
        plt.xlabel(r'$\cos(\angle T)$')
        plt.ylabel(r'$\sin(\angle T)$')
        self.add_radius_scale(plt.gca())
        plt.legend(loc='upper right', fontsize=8, frameon=False)
        plt.tight_layout()
        
        self.save_figure(fig, 'polar_phase_agreement_SA_CST')
        plt.close(fig)
        
        # Magnitude agreement
        r_sa = self.merged['T_square_MATLAB'].to_numpy()
        r_cst = self.merged['T_square_CST'].to_numpy()
        phi_ref = phi_sa
        phi_rad = np.radians(phi_ref)
        
        x_sa_r = r_sa * np.cos(phi_rad)
        y_sa_r = r_sa * np.sin(phi_rad)
        x_cst_r = r_cst * np.cos(phi_rad)
        y_cst_r = r_cst * np.sin(phi_rad)
        
        ampl_gap = r_cst - r_sa
        ampl_err_mag = np.abs(ampl_gap)
        ampl_best_idx = np.argsort(ampl_err_mag)[:keep]
        ampl_worst_idx = np.argsort(ampl_err_mag)[-keep:]
        
        fig = plt.figure(figsize=(6,6))
        plt.plot(np.cos(theta), np.sin(theta), 'k-', lw=0.8, alpha=0.3)
        plt.scatter(x_sa_r, y_sa_r, s=5, alpha=0.15, 
                   label=r'$|T|^2_{SA}$ @ $\angle T_{SA}$')
        plt.scatter(x_cst_r, y_cst_r, s=5, alpha=0.15, 
                   label=r'$|T|^2_{CST}$ @ $\angle T_{SA}$')
        
        for idx in ampl_best_idx:
            plt.plot([x_sa_r[idx], x_cst_r[idx]], [y_sa_r[idx], y_cst_r[idx]], 
                    color='tab:green', alpha=0.7, lw=1)
        for idx in ampl_worst_idx:
            plt.plot([x_sa_r[idx], x_cst_r[idx]], [y_sa_r[idx], y_cst_r[idx]], 
                    color='tab:red', alpha=0.7, lw=1)
                    
        plt.gca().set_aspect('equal', adjustable='box')
        plt.title(r'LAYERS vs CST $|T|^2$ Agreement (Best=green / Worst=red)')
        plt.xlabel(r'Re{$|T|^2$}')
        plt.ylabel(r'Im{$|T|^2$}')
        self.add_radius_scale(plt.gca())
        plt.legend(loc='upper right', fontsize=8, frameon=False)
        plt.tight_layout()
        
        self.save_figure(fig, 'polar_magnitude_agreement_SA_CST')
        plt.close(fig)
        
        
    def plot_complex_distance_comparison(self):
        """Generate side-by-side complex distance error maps for LAYERS vs CST and Forward vs CST."""
        print("Generating complex distance comparison plots...")
        
        def polar_to_cart(r, phi_deg):
            phi_rad = np.deg2rad(phi_deg)
            return r * np.cos(phi_rad), r * np.sin(phi_rad)
        
        def compute_complex_distance(r_ref, phi_ref_deg, r_est, phi_est_deg):
            pr = np.deg2rad(phi_ref_deg)
            pe = np.deg2rad(phi_est_deg)
            xr, yr = r_ref * np.cos(pr), r_ref * np.sin(pr)
            xe, ye = r_est * np.cos(pe), r_est * np.sin(pe)
            return np.sqrt((xr - xe)**2 + (yr - ye)**2)
        
        def add_sparse_connection_lines(ax, x_ref, y_ref, x_est, y_est, step=25, 
                           alpha=0.5, linewidth=0.5, color='red'):
            segs = []
            for i in range(0, len(x_ref), step):
                segs.append([(x_ref[i], y_ref[i]), (x_est[i], y_est[i])])
            lc = LineCollection(segs, colors=color, linewidths=linewidth, 
                               alpha=alpha, zorder=3, antialiaseds=True)
            ax.add_collection(lc)
            return lc
        
        # Get data for test subset
        test_data = self.merged_test
        
        # SA vs CST 
        phi_cst = wrap_phase_deg(test_data['T_pha_CST'].to_numpy().astype(float))
        phi_sa = wrap_phase_deg(test_data['T_pha_MATLAB'].to_numpy().astype(float))
        amp2_cst = np.clip(test_data['T_square_CST'].to_numpy().astype(float), 0, None)
        amp2_sa = np.clip(test_data['T_square_MATLAB'].to_numpy().astype(float), 0, None)
        mag_cst = np.sqrt(amp2_cst)
        mag_sa = np.sqrt(amp2_sa)
        
        # Forward model vs CST
        phi_fwd = wrap_phase_deg(test_data['T_pha_FWD_FT'].to_numpy().astype(float))
        amp2_fwd = np.clip(test_data['T_square_FWD_FT'].to_numpy().astype(float), 0, None)
        mag_fwd = np.sqrt(amp2_fwd)
        
        # Compute complex distances
        complex_dist_sa = compute_complex_distance(mag_cst, phi_cst, mag_sa, phi_sa)
        complex_dist_fwd = compute_complex_distance(mag_cst, phi_cst, mag_fwd, phi_fwd)
            
        def _polar_scatter(mag_ref, phi_ref, mag_cmp, phi_cmp, err_array, title, ax):
            x_cmp, y_cmp = polar_to_cart(mag_cmp, phi_cmp)
            x_ref, y_ref = polar_to_cart(mag_ref, phi_ref)
            sc = ax.scatter(x_cmp, y_cmp, color='tab:blue', s=28, alpha=0.8, edgecolors='none')
            self.add_radius_scale(ax, draw_cross=False, draw_grid=False, label_angle_deg=-45, fontsize=12)
            ax.grid(False)
            add_sparse_connection_lines(ax, x_ref, y_ref, x_cmp, y_cmp, step=max(1, len(x_cmp)//250))
            ax.set_xlabel(r'Re{|T|²$e^{j\phi}$}', fontsize=16)
            ax.set_ylabel(r'Im{|T|²$e^{j\phi}$}', fontsize=16)
            # ax.set_xlim(-1.05, 1.05)
            # ax.set_ylim(-1.05, 1.05)
            ax.set_aspect('equal', adjustable='box')
            # ax.set_title(title, fontsize=11)
            return sc

        # LAYERS vs CST (blue markers, no colorbar)
        fig_a, ax_a = plt.subplots(figsize=(5.0, 5.0), constrained_layout=True)
        _polar_scatter(mag_cst, phi_cst, mag_sa, phi_sa, complex_dist_sa, 'LAYERS vs CST Complex Distance', ax_a)
        self.save_figure(fig_a, 'complex_distance_sa_vs_cst_blue')
        plt.close(fig_a)

        # Fine-Tuned Forward vs CST (blue markers, no colorbar)
        fig_b, ax_b = plt.subplots(figsize=(5.0, 5.0), constrained_layout=True)
        _polar_scatter(mag_cst, phi_cst, mag_fwd, phi_fwd, complex_dist_fwd, 'Fine-Tuned Forward vs CST Complex Distance', ax_b)
        self.save_figure(fig_b, 'complex_distance_forward_vs_cst_blue')
        plt.close(fig_b)
        
    def compute_summary_statistics(self):
        """Compute and save summary statistics."""
        print("Computing summary statistics...")
        
        def compute_summary(y_true, y_pred, d, ae, se, smape):
            mae = ae.mean()
            mse = se.mean()
            bias = d.mean()
            med_ae = ae.median()
            r, _ = stats.pearsonr(y_true, y_pred)
            r2 = r**2
            return {
                'count': len(d),
                'bias_mean': bias,
                'bias_std': d.std(),
                'mae': mae,
                'median_ae': med_ae,
                'r2': r2,
                'smape_mean': smape.mean()
            }
        
        # Compute residuals for merged data
        self.merged['d_pha_raw'] = self.merged['T_pha_CST'] - self.merged['T_pha_MATLAB']
        self.merged['d_pha'] = self.merged['d_pha_raw'].apply(self.wrap_deg)
        self.merged['d_Tsquare'] = np.abs(self.merged['T_square_CST'] - self.merged['T_square_MATLAB'])
        
        # Absolute and squared errors
        self.merged['ae_pha'] = self.merged['d_pha'].abs()
        self.merged['se_pha'] = self.merged['d_pha']**2
        self.merged['ae_Tsquare'] = self.merged['d_Tsquare'].abs()
        self.merged['se_Tsquare'] = self.merged['d_Tsquare']**2
        
        # Relative errors (safe)
        eps = 1e-9
        self.merged['rel_pha'] = self.merged['ae_pha'] / (self.merged['T_pha_MATLAB'].abs() + eps)
        self.merged['rel_Tsquare'] = self.merged['ae_Tsquare'] / (self.merged['T_square_MATLAB'].abs() + eps)
        
        # sMAPE
        self.merged['smape_pha'] = 2 * self.merged['ae_pha'] / (self.merged['T_pha_CST'].abs() + self.merged['T_pha_MATLAB'].abs() + eps)
        self.merged['smape_Tsquare'] = 2 * self.merged['ae_Tsquare'] / (self.merged['T_square_CST'].abs() + self.merged['T_square_MATLAB'].abs() + eps)
        
        summary = {}
        summary['T_pha'] = compute_summary(
            self.merged['T_pha_MATLAB'], self.merged['T_pha_CST'], 
            self.merged['d_pha'], self.merged['ae_pha'], self.merged['se_pha'], 
            self.merged['smape_pha']
        )
        summary['T_square'] = compute_summary(
            self.merged['T_square_MATLAB'], self.merged['T_square_CST'], 
            self.merged['d_Tsquare'], self.merged['ae_Tsquare'], self.merged['se_Tsquare'], 
            self.merged['smape_Tsquare']
        )
        
        summary_df = pd.DataFrame(summary).T
        
        # Save summary
        summary_path = self.fig_dir / 'comparison_summary_statistics.csv'
        summary_df.to_csv(summary_path)
        print(f"Summary statistics saved to: {summary_path}")
        
        # Also save detailed data
        merged_path = self.fig_dir / 'merged_test_with_predictions.parquet'
        self.merged_test.to_parquet(merged_path)
        print(f"Test data with predictions saved to: {merged_path}")
        
        return summary_df
        
    def generate_statistical_tables(self):
        """Generate statistical summary tables for phase and magnitude differences."""
        print("Generating statistical summary tables...")
        
        def compute_statistics(y_true, y_pred, metric_name, is_phase=False):
            """Compute statistical measures for differences."""
            if is_phase:
                # For phase, compute wrapped differences
                diff = self.wrap_deg(y_pred - y_true)
            else:
                # For magnitude, compute direct differences
                diff = y_pred - y_true
            
            # Compute absolute errors for mean and std
            abs_diff = np.abs(diff)
            
            stats_dict = {
                'Metric': metric_name,
                'Mean_|Error|': f"{np.mean(abs_diff):.4f}",
                'Std_|Error|': f"{np.std(abs_diff):.4f}",
                'Min_Error': f"{np.min(abs_diff):.4f}",
                'Max_Error': f"{np.max(abs_diff):.4f}",
                'MAE': f"{np.mean(abs_diff):.4f}",
            }
            return stats_dict
        
        # Compute statistics for MATLAB vs CST
        matlab_phase_stats = compute_statistics(
            self.merged_test['T_pha_CST'].to_numpy(),
            self.merged_test['T_pha_MATLAB'].to_numpy(),
            'Phase Difference (degrees)', 
            is_phase=True
        )
        
        matlab_magnitude_stats = compute_statistics(
            self.merged_test['T_square_CST'].to_numpy(),
            self.merged_test['T_square_MATLAB'].to_numpy(),
            'Magnitude Difference (|T|²)',
            is_phase=False
        )
        
        # Compute statistics for Forward Model vs CST
        forward_phase_stats = compute_statistics(
            self.merged_test['T_pha_CST'].to_numpy(),
            self.merged_test['T_pha_FWD_FT'].to_numpy(),
            'Phase Difference (degrees)',
            is_phase=True
        )
        
        forward_magnitude_stats = compute_statistics(
            self.merged_test['T_square_CST'].to_numpy(),
            self.merged_test['T_square_FWD_FT'].to_numpy(),
            'Magnitude Difference (|T|²)',
            is_phase=False
        )
        
        # Create DataFrames
        matlab_df = pd.DataFrame([matlab_phase_stats, matlab_magnitude_stats])
        forward_df = pd.DataFrame([forward_phase_stats, forward_magnitude_stats])
        
        # Save individual tables
        matlab_path = self.fig_dir / 'MATLAB_vs_CST_statistics.csv'
        forward_path = self.fig_dir / 'Forward_vs_CST_statistics.csv'
        
        matlab_df.to_csv(matlab_path, index=False)
        forward_df.to_csv(forward_path, index=False)
        
        # Create comprehensive comparison table
        comprehensive_data = []
        
        for model_name, phase_stats, mag_stats in [
            ('MATLAB vs CST', matlab_phase_stats, matlab_magnitude_stats),
            ('Forward vs CST', forward_phase_stats, forward_magnitude_stats)
        ]:
            # Add phase row
            phase_row = {'Model': model_name, **phase_stats}
            comprehensive_data.append(phase_row)
            
            # Add magnitude row  
            mag_row = {'Model': model_name, **mag_stats}
            comprehensive_data.append(mag_row)
        
        comprehensive_df = pd.DataFrame(comprehensive_data)
        comprehensive_path = self.fig_dir / 'Comprehensive_Statistics_Table.csv'
        comprehensive_df.to_csv(comprehensive_path, index=False)
        
        # Generate formatted table figures
        self._create_table_figure(matlab_df, 'MATLAB vs CST Statistical Summary', 'MATLAB_statistics_table')
        self._create_table_figure(forward_df, 'Forward Model vs CST Statistical Summary', 'Forward_statistics_table')
        self._create_comprehensive_table_figure(comprehensive_df)
        
        print(f"Statistical tables saved:")
        print(f"  MATLAB vs CST: {matlab_path}")
        print(f"  Forward vs CST: {forward_path}")
        print(f"  Comprehensive: {comprehensive_path}")
        
        return matlab_df, forward_df, comprehensive_df
    
    def _create_table_figure(self, df, title, filename):
        """Create a formatted table figure."""
        fig, ax = plt.subplots(figsize=(12, 4))
        ax.axis('tight')
        ax.axis('off')
        
        # Create table
        table = ax.table(cellText=df.values, colLabels=df.columns,
                        cellLoc='center', loc='center')
        table.auto_set_font_size(False)
        table.set_fontsize(10)
        table.scale(1.2, 2.0)
        
        # Style the table
        for (i, j), cell in table.get_celld().items():
            if i == 0:  # Header row
                cell.set_facecolor('#4472C4')
                cell.set_text_props(weight='bold', color='white')
            elif j == 0:  # First column (Metric names)
                cell.set_facecolor('#E7E6E6')
                cell.set_text_props(weight='bold')
            else:
                cell.set_facecolor('#F2F2F2' if i % 2 == 0 else 'white')
        
        plt.title(title, fontsize=14, fontweight='bold', pad=20)
        self.save_figure(fig, filename)
        plt.close(fig)
    
    def _create_comprehensive_table_figure(self, df):
        """Create a comprehensive comparison table figure."""
        fig, ax = plt.subplots(figsize=(14, 6))
        ax.axis('tight')
        ax.axis('off')
        
        # Create table
        table = ax.table(cellText=df.values, colLabels=df.columns,
                        cellLoc='center', loc='center')
        table.auto_set_font_size(False)
        table.set_fontsize(9)
        table.scale(1.2, 2.2)
        
        # Style the table
        for (i, j), cell in table.get_celld().items():
            if i == 0:  # Header row
                cell.set_facecolor('#4472C4')
                cell.set_text_props(weight='bold', color='white')
            elif j == 0:  # Model column
                cell.set_facecolor('#D9E2F3')
                cell.set_text_props(weight='bold')
            elif j == 1:  # Metric column
                cell.set_facecolor('#E7E6E6')
                cell.set_text_props(weight='bold')
            else:
                # Alternate row colors
                cell.set_facecolor('#F2F2F2' if i % 2 == 0 else 'white')
        
        plt.title('Comprehensive Statistical Comparison: Phase and Magnitude Differences vs CST', 
                  fontsize=14, fontweight='bold', pad=20)
        self.save_figure(fig, 'Comprehensive_Statistics_Table')
        plt.close(fig)
        
    def run_complete_analysis(self):
        """Run the complete analysis pipeline."""
        print("=" * 60)
        print("CST vs Semi-Analytical (SA) Comparison Analysis")
        print("=" * 60)
        
        # Load and prepare data
        self.load_data()
        self.load_forward_model()
        self.prepare_test_data()
        
        # Run all analyses
        self.plot_parity_analysis()
        self.plot_polar_agreement()
        self.plot_complex_distance_comparison()
        summary_stats = self.compute_summary_statistics()
        
        # Generate statistical tables
        matlab_stats, forward_stats, comprehensive_stats = self.generate_statistical_tables()
        
        print("\n" + "=" * 60)
        print("ANALYSIS COMPLETE")
        print("=" * 60)
        print(f"Output directory: {self.fig_dir}")
        print("\nGenerated files:")
        for file_path in sorted(self.fig_dir.glob('*')):
            print(f"  {file_path.name}")
        
        print("\nSummary Statistics:")
        print(summary_stats)
        
        print("\nStatistical Tables Generated:")
        print("\nMATLAB vs CST:")
        print(matlab_stats.to_string(index=False))
        print("\nForward Model vs CST:")
        print(forward_stats.to_string(index=False))
        
        return summary_stats, matlab_stats, forward_stats, comprehensive_stats


def main():
    """Main execution function."""
    parser = argparse.ArgumentParser(description="CST vs LAYERS/Forward analysis")
    parser.add_argument("--cst-csv", required=True, help="Path to CST combined CSV")
    parser.add_argument("--matlab-csv", required=True, help="Path to MATLAB/LAYERS CSV")
    parser.add_argument("--checkpoint", required=True, help="Path to forward model checkpoint")
    parser.add_argument("--split", required=True, help="Path to split indices npz file")
    parser.add_argument("--forward-config", default=None, help="Optional path to forward config.yaml")
    parser.add_argument("--device", default="cuda" if torch.cuda.is_available() else "cpu", help="Device for forward inference")
    parser.add_argument("--outdir", default=None, help="Optional output directory for generated figures/tables")
    args = parser.parse_args()

    analyzer = CSTPMATLABAnalyzer(
        cst_csv=args.cst_csv,
        matlab_csv=args.matlab_csv,
        checkpoint=args.checkpoint,
        split=args.split,
        device=args.device,
        forward_config=args.forward_config,
        outdir=args.outdir,
    )
    results = analyzer.run_complete_analysis()
    return analyzer, results


if __name__ == "__main__":
    analyzer, results = main()