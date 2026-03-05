import os
import time
import numpy as np
import torch
from trainers import ForwardTrainer
from data.loaders import load_w2s_dataset, get_data_loaders_for_forward
from utils import set_seed, load_config, setup_output_directory, load_forward_model

# Load configuration and set seed
config = load_config('config.yaml', validate=True, mode='training', strict=True)
set_seed(config['seed'])

# --- Load Main Dataset ---
main_dataset = load_w2s_dataset(config['data_path'], config)
main_dataset.process_W2S_dataset_layers(config['data_path'][:-4] + '_processed.csv', config) # Ccomment if W and phase are already normalized
print(f"Main dataset size: {len(main_dataset)}")

train_loader, val_loader, test_loader = get_data_loaders_for_forward(
    main_dataset=main_dataset,
    batch_size=config['batch_size'],
    train_ratio=config['train_ratio'],
    val_ratio=config['val_ratio'],
    test_ratio=config['test_ratio'],
    seed=config['seed'],
    num_workers=config['num_workers'],
    pin_memory=True # Assuming pin_memory=True is desired
)

print(f"Train Loader Samples: {len(train_loader.dataset)}")
print(f"Val Loader Samples: {len(val_loader.dataset)}")
print(f"Test Loader Samples: {len(test_loader.dataset)}")

# Save train, val, test indices
train_indices = train_loader.dataset.indices
val_indices = val_loader.dataset.indices
test_indices = test_loader.dataset.indices

# Instantiate model
model = load_forward_model(config=config, device=config.get('device', 'cuda:0'))

# Set up output directory
timestamp = time.strftime('%Y%m%d-%H%M%S')
run_name = f"semi_analytical_based/train_forward_{timestamp}"
output_dir = setup_output_directory(config['runs_dir'], run_name, config)

# Save indices for fine-tuning phase
np.savez(os.path.join(output_dir, 'data_splits.npz'), train=train_indices, val=val_indices, test=test_indices)

trainer = ForwardTrainer(model, train_loader, val_loader, test_loader, config, output_dir)
trainer.train()
trainer.test()