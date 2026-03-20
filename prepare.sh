#!/usr/bin/env bash
set -euo pipefail

echo "=== Installing dependencies ==="
pip install -r requirements.txt

echo ""
echo "=== Verifying CUDA + Triton ==="
python3 -c "
import torch
print(f'PyTorch: {torch.__version__}')
print(f'CUDA available: {torch.cuda.is_available()}')
if torch.cuda.is_available():
    print(f'CUDA device: {torch.cuda.get_device_name(0)}')
import triton
print(f'Triton: {triton.__version__}')
print('OK: CUDA + Triton ready')
"
