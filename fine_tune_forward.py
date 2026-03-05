import os
import time
import torch
import numpy as np
import argparse
from torch.utils.data import DataLoader, random_split, Subset
from Models import ForwardModel
from trainers import FineTuneForwardTrainer
import random
from utils import set_seed, load_config, setup_output_directory, load_forward_model
from data.loaders import load_w2s_dataset


def build_high_fid_loaders(config, output_dir, ablation_mode=False, train_size_ablation=None, 
                          val_size_ablation=None, reference_split_path=None):
    """
    Build high-fidelity data loaders. Supports both normal and ablation modes.
    
    Args:
        config: Configuration dictionary
        output_dir: Output directory for saving split indices
        ablation_mode: If True, use ablation mode with fixed test set and limited train/val
        train_size_ablation: Number of training samples for ablation (only used if ablation_mode=True)
        val_size_ablation: Number of validation samples for ablation (only used if ablation_mode=True)
        reference_split_path: Path to reference split indices for test set (only used if ablation_mode=True)
    """
    high_ds = load_w2s_dataset(config['high_fid_path'], config)
    high_ds.process_W2S_dataset_layers(config['high_fid_path'][:-4] + '_processed.csv', config) # Comment if W and phase are already normalized
    total = len(high_ds)
    
    if ablation_mode:
        # Ablation mode: use existing test indices and limit training/validation data
        if not reference_split_path or not os.path.exists(reference_split_path):
            raise FileNotFoundError(f"Reference split indices not found: {reference_split_path}")
        
        ref_npz = np.load(reference_split_path)
        test_idx = ref_npz['test']
        print(f"Loaded reference test indices: {len(test_idx)} samples")
        
        # Create a pool of all indices except the test ones
        all_indices = set(range(total))
        test_indices_set = set(test_idx)
        available_indices = list(all_indices - test_indices_set)
        print(f"Available indices for train/val (excluding test): {len(available_indices)}")
        
        # Shuffle available indices with the configured seed
        random.Random(config['seed']).shuffle(available_indices)
        
        if len(available_indices) < (train_size_ablation + val_size_ablation):
            raise ValueError(f"Not enough available indices. Need {train_size_ablation + val_size_ablation}, have {len(available_indices)}")
        
        train_idx = available_indices[:train_size_ablation]
        val_idx = available_indices[train_size_ablation:train_size_ablation + val_size_ablation]
        
        print(f"Ablation split - Train: {len(train_idx)}, Val: {len(val_idx)}, Test: {len(test_idx)} (from reference)")
        
        # Create subsets
        train_subset = Subset(high_ds, train_idx)
        val_subset = Subset(high_ds, val_idx)
        test_subset = Subset(high_ds, test_idx.tolist())
        
        # Save the ablation split indices
        split_indices_path = os.path.join(output_dir, 'high_fid_split_indices_ablation.npz')
        np.savez(split_indices_path, 
                 train=np.array(train_idx), 
                 val=np.array(val_idx), 
                 test=test_idx)
        print(f"Saved ablation split indices to {split_indices_path}")
        
    else:
        # Normal mode: create new splits based on ratios
        train_ratio = config.get('high_fid_train_ratio', config['train_ratio'])
        val_ratio = config.get('high_fid_val_ratio', config['val_ratio'])
        test_ratio = config.get('high_fid_test_ratio', 1.0 - train_ratio - val_ratio)
        
        print(f"High-fidelity split ratios: train={train_ratio:.1%}, val={val_ratio:.1%}, test={test_ratio:.1%}")
        
        train_size = int(train_ratio * total)
        val_size = int(val_ratio * total)
        test_size = int(test_ratio * total)
        
        # Ensure total splits don't exceed dataset size
        if train_size + val_size + test_size > total:
            test_size = total - train_size - val_size
            
        print(f"High-fidelity split sizes: train={train_size}, val={val_size}, test={test_size} (total={total})")
        
        train_ds, val_ds, test_ds = random_split(high_ds, [train_size, val_size, test_size], 
                                                  generator=torch.Generator().manual_seed(config['seed']))
        
        # Get subsets
        train_subset = train_ds
        val_subset = val_ds
        test_subset = test_ds
        
        # Save the split indices
        train_idx = train_ds.indices
        val_idx = val_ds.indices
        test_idx = test_ds.indices
        split_indices_path = os.path.join(output_dir, 'high_fid_split_indices.npz')
        np.savez(split_indices_path, train=train_idx, val=val_idx, test=test_idx)
        print(f"Saved high-fidelity split indices to {split_indices_path}")

    high_batch = config.get('batch_size_high', 128)
    common_dl_args = dict(num_workers=config['num_workers'], pin_memory=True)
    return {
        'train': DataLoader(train_subset, batch_size=high_batch, shuffle=True, **common_dl_args),
        'val': DataLoader(val_subset, batch_size=high_batch, shuffle=False, **common_dl_args),
        'test': DataLoader(test_subset, batch_size=high_batch, shuffle=False, **common_dl_args)
    }


def build_low_fid_loaders(config):
    if not os.path.exists(config['low_fid_path']):
        print("Low fidelity path not found, skipping low-fid loaders.")
        return {}
    low_ds = load_w2s_dataset(config['low_fid_path'], config)
    low_ds.process_W2S_dataset_layers(config['low_fid_path'][:-4] + '_processed.csv', config) # Comment if W and phase are already normalized
    split_path = config.get('lf_split_indices_path')
    if not split_path or not os.path.exists(split_path):
        raise FileNotFoundError(f"lf_split_indices_path missing or not found: {split_path}. Generate it with extract_lf_split_indices.py first.")
    npz = np.load(split_path)
    train_idx = npz['train']
    val_idx = npz['val']
    test_idx = npz['test']
    print(f"Loaded LF split indices: train={len(train_idx)} val={len(val_idx)} test={len(test_idx)}")
    train_subset = Subset(low_ds, train_idx.tolist())
    val_subset = Subset(low_ds, val_idx.tolist())
    test_subset = Subset(low_ds, test_idx.tolist())
    low_batch = config.get('batch_size_low', 1024)
    common = dict(num_workers=config['num_workers'], pin_memory=True)
    return {
        'train': DataLoader(train_subset, batch_size=low_batch, shuffle=True, **common),
        'val': DataLoader(val_subset, batch_size=low_batch, shuffle=False, **common),
        'test': DataLoader(test_subset, batch_size=low_batch, shuffle=False, **common)
    }

def main():
    # Parse command-line arguments
    parser = argparse.ArgumentParser(description='Fine-tune forward model')
    parser.add_argument('--ablation', action='store_true', 
                       help='Run in ablation mode with limited training data')
    parser.add_argument('--train-size', type=int, default=378,
                       help='Number of training samples for ablation mode (default: 378)')
    parser.add_argument('--val-size', type=int, default=81,
                       help='Number of validation samples for ablation mode (default: 81)')
    parser.add_argument('--reference-split', type=str, 
                       default='/mnt/storage/users/nati/metamamba/runs/fine_tune/finetune_FR_full_hf_lr0.0005_bb0.0001_a0.7_20251216-214853/high_fid_split_indices.npz',
                       help='Path to reference split indices for ablation mode')
    args = parser.parse_args()
    
    config = load_config('config.yaml', validate=True, mode='training', strict=True)
    
    forward_dir = os.path.dirname(config['forward_model_path'])
    forward_config = load_config(os.path.join(forward_dir, 'config.yaml'), validate=True, mode='loading', strict=False)

    # overrides / additions for fine-tune script
    config.setdefault('batch_size_high', 128)
    config.setdefault('batch_size_low', 1024)

    set_seed(config['seed'])

    # Prepare output dir
    phase = config.get('fine_tune_mode','heads')
    timestamp = time.strftime('%Y%m%d-%H%M%S')
    
    if args.ablation:
        run_name = f"fine_tune_ablation/FR_finetune_ablation_{phase}_hf_lr{config.get('head_lr')}_bb{config.get('backbone_lr','na')}_a{config.get('alpha_weighted_val',0.7)}_{args.train_size}train_{args.val_size}val_{timestamp}"
    else:
        run_name = f"fine_tune/finetune_FR_{phase}_hf_lr{config.get('head_lr')}_bb{config.get('backbone_lr','na')}_a{config.get('alpha_weighted_val',0.7)}_{timestamp}"
    
    output_dir = setup_output_directory(config['runs_dir'], run_name, config)
    
    # Build loaders
    if args.ablation:
        print(f"Running in ablation mode with train_size={args.train_size}, val_size={args.val_size}")
        high_loaders = build_high_fid_loaders(config, output_dir, 
                                              ablation_mode=True,
                                              train_size_ablation=args.train_size,
                                              val_size_ablation=args.val_size,
                                              reference_split_path=args.reference_split)
    else:
        high_loaders = build_high_fid_loaders(config, output_dir)
    
    low_loaders = build_low_fid_loaders(config)

    # Instantiate model with pretrained weights
    model = load_forward_model(config=forward_config, checkpoint_path=config['forward_model_path'])
    
    # Trainer
    trainer = FineTuneForwardTrainer(model, high_loaders, low_loaders, config, output_dir)
    trainer.train()
    trainer.evaluate_test()

    # Save history
    hist_path = os.path.join(output_dir,'history.json')
    try:
        import json
        with open(hist_path,'w') as f:
            json.dump(trainer.history, f, indent=2)
        print(f"Training history saved to {hist_path}")
    except Exception as e:
        print(f"Could not save history: {e}")

if __name__ == '__main__':
    main()
