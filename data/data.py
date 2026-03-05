import numpy as np
import pandas as pd
import torch
from torch.utils.data import Dataset


if __name__ == "__main__":
    print("This module provides dataset classes. Use data/parse_cst.py for CST parsing CLI.")


class W2Sdataset(Dataset):
    def __init__(self, data_array, w_min=0.0, w_max=80.0, w_len=5, s_len=3, frequency_bins=1):
        self.data = data_array
        self.s_len = s_len
        self.w_len = w_len
        self.w_min = w_min
        self.w_max = w_max
        self.frequency_bins = frequency_bins

    def process_W2S_dataset_layers(self, round_number=3, output_path=None):
        """
            Assume ordering of W parameters first, the S parameters with magnitude first, then phase:
            [W1, W2, ..., Wk, T2, T_pha]
        """


        # Extract W parameters - columns 0 to w_len
        W = self.data[:, :self.w_len]
        assert np.all((W >= self.w_min) & (W <= self.w_max)), f"W values must be in range [{self.w_min}, {self.w_max}]"

        # Normalize W to [0, 1]
        W_min = self.w_min
        W_max = self.w_max
        W_norm = (W - W_min) / (W_max - W_min)

        print(f"freq_bins: {self.frequency_bins}, w_len: {self.w_len}, s_len: {self.s_len}")

        # Extract T2 (t_squared) - come after W columns, and in the number of freq_bins
        t_squared = self.data[:, self.w_len:self.w_len + self.frequency_bins]  # Assuming T2 is after W params and magnitude bins
        assert np.all((t_squared >= 0) & (t_squared <= 1)), "T2 values must be in range [0, 1]"

        # Extract phase columns
        phase_raw = self.data[:, self.w_len + self.frequency_bins:]

        # Convert phase [-180, 180] to radians [-pi, pi]
        phase_rad = np.deg2rad(phase_raw)

        # Calculate sin and cos
        phase_sin_raw = np.sin(phase_rad) # range [-1, 1]
        phase_cos_raw = np.cos(phase_rad) # range [-1, 1]

        # Normalize sin and cos from [-1, 1] to [0, 1]
        phase_sin = (phase_sin_raw + 1) / 2
        phase_cos = (phase_cos_raw + 1) / 2
        assert np.all((phase_sin >= 0) & (phase_sin <= 1)), "sin(phase) values must be in range [0, 1]"
        assert np.all((phase_cos >= 0) & (phase_cos <= 1)), "cos(phase) values must be in range [0, 1]"

        # Interleave phase features per bin: [sin1, cos1, sin2, cos2, ...]
        phase_interleaved = np.empty((phase_sin.shape[0], 2 * self.frequency_bins), dtype=phase_sin.dtype)
        phase_interleaved[:, 0::2] = phase_sin
        phase_interleaved[:, 1::2] = phase_cos

        # Round all processed values to specified decimal places
        W_norm = np.round(W_norm, round_number)
        t_squared = np.round(t_squared, round_number) # Assuming T2 doesn't need normalization
        phase_interleaved = np.round(phase_interleaved, round_number)

        print(f"Processed data shapes: W_norm: {W_norm.shape}, t_squared: {t_squared.shape}, phase: {phase_interleaved.shape}")

        # Combine processed data into a single array and save as csv with pandas.
        # First W, then T2 bins, then interleaved phase (sin, cos) per bin.
        processed_data = np.hstack([W_norm, t_squared, phase_interleaved])
        if output_path is not None:
            phase_columns = []
            for j in range(self.frequency_bins):
                phase_columns.extend([f"sin_phi_bin_{j+1}", f"cos_phi_bin_{j+1}"])

            columns = [f"W{i+1}" for i in range(self.w_len)] + \
                    [f"T2_bin_{j+1}" for j in range(self.frequency_bins)] + \
                    phase_columns
            processed_df = pd.DataFrame(processed_data, columns=columns)
            processed_df.to_csv(output_path, index=False)
            print(f"Processed data saved to {output_path}")

        self.data = processed_data

    def __len__(self):
        return len(self.data)

    def __getitem__(self, idx):
        row = self.data[idx]
        # First w_len are W, next s_len are S
        W = torch.tensor(row[:self.w_len], dtype=torch.float32)
        S = torch.tensor(row[self.w_len:], dtype=torch.float32)
        return W.unsqueeze(-1), S.unsqueeze(-1)


class MixedTokenDataset(Dataset):
    """
    Dataset for processing sequences with both float and integer tokens.
    Handles S parameters (tau_squared, sin_phi, cos_phi) and W parameters (W1-W5).
    """
    def __init__(self, data_path, s_param_len=3, w_param_len=5, w_min=0.0, w_max=8.0, w_interval=1.0):
        """
        Initialize the dataset.

        Args:
            data_path: Path to the CSV data file
            s_param_len: Number of float S parameters at the beginning (default 3: tau_squared, sin_phi, cos_phi)
            w_param_len: Number of integer W parameters at the end (default 5: W1-W5)
        """
        # Load data
        self.data = pd.read_csv(data_path)

        # If column names exist, print them for debugging
        if not self.data.columns.empty:
            print(f"Data columns: {self.data.columns.tolist()}")

        # Keep track of parameters
        self.s_param_len = s_param_len
        self.w_param_len = w_param_len
        self.seq_len = s_param_len + w_param_len
        self.w_min = w_min
        self.w_max = w_max
        self.w_interval = w_interval
        self.num_w_bins = int((w_max - w_min) / w_interval) + 1

        # Extract parameters according to actual data ordering: [W1, ..., W5, tau_squared, sin_phi, cos_phi]
        self.w_params = self.data.iloc[:, :w_param_len].values
        self.s_params = self.data.iloc[:, w_param_len:w_param_len+s_param_len].values

        # Process S parameters (tau_squared, sin_phi, cos_phi)
        # Keep them as float values
        self.s_params = self.s_params.astype(np.float32)

        # Process W parameters (should be treated as float values for now,
        # tokenization will happen in the training loop)
        self.w_params = self.w_params.astype(np.float32)

        print(f"\nDataset loaded:")
        print(f"S parameters shape: {self.s_params.shape}")
        print(f"W parameters shape: {self.w_params.shape}")
        print(f"Example S params: {self.s_params[0]}")
        print(f"Example W params: {self.w_params[0]}")

    def __len__(self):
        return len(self.data)

    def __getitem__(self, idx):
        # Get S and W parameters for this example
        s_params = self.s_params[idx]
        w_params = self.w_params[idx]

        w_tokens = ((w_params - self.w_min) / self.w_interval).round().astype(np.int64)

        # For the causal language modeling task, we need to rearrange the sequence to:
        # [tau_squared, sin_phi, cos_phi, W1, W2, W3, W4, W5]
        # This allows the model to predict W values from S parameters
        full_sequence = np.concatenate([s_params, w_tokens])

        # Convert to tensor with shape [seq_len, 1]
        # Adding the extra dimension needed for the model
        # The DataLoader will batch these to [batch_size, seq_len, 1]
        sequence_tensor = torch.tensor(full_sequence, dtype=torch.float32).unsqueeze(-1)

        # Return the full sequence - the model will handle shifting for causal LM during training
        return sequence_tensor
