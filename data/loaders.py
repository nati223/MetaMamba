import random
import numpy as np
import pandas as pd
import torch
from torch.utils.data import DataLoader, TensorDataset, random_split


def seed_worker(worker_id: int):
    """Seed numpy and python.random in each worker for full reproducibility."""
    try:
        worker_seed = torch.initial_seed() % 2**32
    except Exception:
        worker_seed = 0
    np.random.seed(worker_seed)
    random.seed(worker_seed)
    

def load_w2s_dataset(csv_path: str, config: dict):
    """
    Load W2S dataset with consistent parameter ordering.
    
    Args:
        csv_path: Path to CSV file
        config: Configuration dictionary with dataset parameters
        
    Returns:
        W2Sdataset instance
    """
    import pandas as pd
    from data.data import W2Sdataset
    
    print(f"Loading dataset: {csv_path}")
    df = pd.read_csv(csv_path, header=None, skiprows=1)
    data = df.values.astype(np.float32)
    
    # Use named arguments to avoid parameter order bugs
    dataset = W2Sdataset(
        data,
        w_min=config['min_w_value'],
        w_max=config['max_w_value'],
        s_len=config['s_len'],
        w_len=config['w_len'],
        frequency_bins=config.get('frequency_bins', 1)
    )
    
    print(f"Loaded {len(dataset)} samples from {csv_path}")
    return dataset


def get_data_loaders_for_forward(
    main_dataset,
    batch_size,
    train_ratio,
    val_ratio,
    test_ratio,
    seed,
    num_workers=0,
    pin_memory=True,
):
    """Split main_dataset into train/val/test and return loaders.

    Args:
        main_dataset: Any ``torch.utils.data.Dataset`` instance (typically
            a ``W2Sdataset``).
        batch_size: Number of samples per batch for all three loaders.
        train_ratio: Fraction of data used for training (e.g. 0.7).
        val_ratio: Fraction of data used for validation (e.g. 0.15).
        test_ratio: Fraction of data used for testing.  Must satisfy
            ``train_ratio + val_ratio + test_ratio == 1.0``.
        seed: Integer seed for the random split and worker generators,
            ensuring reproducible data splits across runs.
        num_workers: Number of subprocesses for data loading.
        pin_memory: If ``True``, pin host memory for faster GPU transfer.

    Returns:
        Tuple of ``(train_loader, val_loader, test_loader)`` as
        ``torch.utils.data.DataLoader`` instances.
    """
    total_size = len(main_dataset)
    train_size = int(train_ratio * total_size)
    val_size = int(val_ratio * total_size)
    test_size = total_size - train_size - val_size
    assert train_size + val_size + test_size == total_size, "Split sizes do not sum to total dataset size"

    train_dataset_main, val_dataset, test_dataset = random_split(
        main_dataset, [train_size, val_size, test_size], generator=torch.Generator().manual_seed(seed)
    )

    gen_train = torch.Generator().manual_seed(seed + 0)
    gen_val = torch.Generator().manual_seed(seed + 1)
    gen_test = torch.Generator().manual_seed(seed + 2)

    train_loader = DataLoader(
        train_dataset_main,
        batch_size=batch_size,
        shuffle=True,
        num_workers=num_workers,
        pin_memory=pin_memory,
        worker_init_fn=seed_worker,
        generator=gen_train,
    )
    val_loader = DataLoader(
        val_dataset,
        batch_size=batch_size,
        shuffle=False,
        num_workers=num_workers,
        pin_memory=pin_memory,
        worker_init_fn=seed_worker,
        generator=gen_val,
    )
    test_loader = DataLoader(
        test_dataset,
        batch_size=batch_size,
        shuffle=False,
        num_workers=num_workers,
        pin_memory=pin_memory,
        worker_init_fn=seed_worker,
        generator=gen_test,
    )

    return train_loader, val_loader, test_loader


def get_data_loaders_for_LMHeadModel(
    data_path,
    batch_size,
    num_workers,
    seq_len,
    s_len,
    w_len,
    w_min=0,
    w_max=80,
    vocab_size=81,
    frequency_bins=1,
    channels=3,
    train_ratio=0.8,
    val_ratio=0.1,
    seed=42,
):
    """
    Create loaders for causal LM head training.
    
    Expected CSV column order:
    - W parameters: w_len columns (first)
    - t_square magnitudes: frequency_bins columns
    - Phase sin/cos (normalized): 2*frequency_bins columns (sin then cos for each freq)
    
    Output sequence order: [S parameters, W parameters] where S = [t_square, phase_sin, phase_cos]
    """
    data = pd.read_csv(data_path).astype(float)
    
    # Extract columns by position
    w_cols = data.iloc[:, :w_len]  # First w_len columns
    t_square_cols = data.iloc[:, w_len:w_len + frequency_bins]  # Next frequency_bins columns
    phase_cols = data.iloc[:, w_len + frequency_bins:]  # Remaining 2*frequency_bins columns (already sin/cos normalized)
    
    # Normalize W values to token indices (subtract min, already discretized)
    w_normalized = w_cols - w_min
    
    # Reorder: S parameters first (t_square + phase), then W parameters
    reordered_data = pd.concat([t_square_cols, phase_cols, w_normalized], axis=1)
    reordered_data = reordered_data.round(4)
    
    # Convert to sequence tensor
    sequence_data = reordered_data.values.reshape(-1, seq_len, 1)
    sequence_tensor = torch.tensor(sequence_data, dtype=torch.float32)

    dataset = TensorDataset(sequence_tensor)
    total_size = len(dataset)
    train_size = int(train_ratio * total_size)
    val_size = int(val_ratio * total_size)
    test_size = total_size - train_size - val_size
    train_data, val_data, test_data = torch.utils.data.random_split(
        dataset, [train_size, val_size, test_size], generator=torch.Generator().manual_seed(seed)
    )

    gen_train = torch.Generator().manual_seed(seed + 0)
    gen_val = torch.Generator().manual_seed(seed + 1)
    gen_test = torch.Generator().manual_seed(seed + 2)

    train_loader = DataLoader(
        train_data,
        batch_size=batch_size,
        num_workers=num_workers,
        shuffle=True,
        pin_memory=True,
        worker_init_fn=seed_worker,
        generator=gen_train,
    )
    val_loader = DataLoader(
        val_data,
        batch_size=batch_size,
        num_workers=num_workers,
        shuffle=False,
        pin_memory=True,
        worker_init_fn=seed_worker,
        generator=gen_val,
    )
    test_loader = DataLoader(
        test_data,
        batch_size=batch_size,
        num_workers=num_workers,
        shuffle=False,
        pin_memory=True,
        worker_init_fn=seed_worker,
        generator=gen_test,
    )

    return train_loader, val_loader, test_loader
