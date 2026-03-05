# ... existing imports ...
import argparse
import torch
import time

from data.loaders import get_data_loaders_for_LMHeadModel
from trainers import MetaMambaCausalTrainer
from utils import set_seed, load_config, setup_output_directory, load_forward_model, load_inverse_model

# torch.autograd.set_detect_anomaly(True) # # NOTE: Should be used for debugging ONLY, keep commented elsewise.

# Parse command-line arguments
parser = argparse.ArgumentParser(description='Train MetaMamba model with causal LM objective')
parser.add_argument('--resume', type=str, help='Path to checkpoint directory to resume training from')
parser.add_argument('--test-only', type=str, help='Path to checkpoint directory for test-only mode', default=None)
args = parser.parse_args()

# Load configuration and set seed
config = load_config('config.yaml', validate=True, mode='training', strict=True)
set_seed(config['seed'])
torch.cuda.set_device(config['device'])

# Calculate vocabulary size from W parameter range
min_w_value = config['min_w_value']
max_w_value = config['max_w_value']
w_interval = config['w_interval']
num_w_bins = int((max_w_value - min_w_value) / w_interval) + 1
print(f"Vocabulary size (W bins): {num_w_bins}")

# Get data loaders
train_loader, val_loader, test_loader = get_data_loaders_for_LMHeadModel(
    data_path=config['data_path'],
    batch_size=config['batch_size'],
    num_workers=config['num_workers'],
    seq_len=config['seq_len'],
    s_len=config['s_len'],
    w_len=config['w_len'],
    w_min=min_w_value,
    w_max=max_w_value,
    vocab_size=num_w_bins,
    frequency_bins=config.get('frequency_bins', 1),
    train_ratio=config['train_ratio'],
    val_ratio=config['val_ratio'],
    seed=config['seed']
)

# Setup output directory and load models
if args.test_only:
    output_dir = args.test_only
    print(f"Test-only mode using checkpoint: {output_dir}")
    model = load_inverse_model(checkpoint_path=output_dir, device=config['device'])
else:
    timestamp = time.strftime("%Y%m%d-%H%M%S")
    run_name = f"metamamba_causal_lm_{min_w_value}_to_{max_w_value}_{timestamp}_train_{config['train_ratio']}"
    output_dir = setup_output_directory(config['runs_dir'] + "/semi_analytical_based", run_name, config)
    print(f"Training mode, output directory: {output_dir}")
    model = load_inverse_model(config=config, device=config['device'])

# Load forward model if specified
forward_model = None
forward_model_path = config.get('forward_model_path', None)
if forward_model_path:
    try:
        forward_model = load_forward_model(checkpoint_path=forward_model_path, device=config['device'])
        print(f"Loaded forward model from: {forward_model_path}")
    except Exception as e:
        print(f"Warning: Could not load forward model: {e}")

# Initialize trainer
trainer = MetaMambaCausalTrainer(
    model=model,
    train_loader=train_loader,
    val_loader=val_loader,
    test_loader=test_loader,
    config=config,
    output_dir=output_dir,
    forward_model=forward_model
)

# Train or test
if args.test_only:
    print("Starting test-only evaluation...")
    test_results = trainer.test(checkpoint_dir=output_dir)
    print("Testing completed.")
else:
    print("Starting training...")
    trainer.train(resume_from=args.resume)
    
    print("Testing after training...")
    test_results = trainer.test()
    print(f"Training completed. Best metrics: {trainer.best_metrics}")

print("Finished!")
