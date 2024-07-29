#!/bin/bash
if ! nvidia-smi -pl 350.00; then
	exit 1
else
	nvidia-smi --lock-gpu-clocks=220,2115 --mode=1
	nvidia-smi --lock-memory-clocks=440,9501
fi
echo "New OC:"
echo "2115MHz Core"
echo "9500MHz Memory"
echo "Power Limit: 350w"
