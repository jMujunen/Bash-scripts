#!/bin/bash
if ! nvidia-smi -pl 350.00 >/dev/null; then
    exit 1
else
    nvidia-smi --lock-gpu-clocks=220,1980 --mode=1 >/dev/null
    nvidia-smi --lock-memory-clocks=440,9501 >/dev/null
fi
echo "New OC:"
echo "2115MHz Core"
echo "9500MHz Memory"
echo "Power Limit: 350w"
