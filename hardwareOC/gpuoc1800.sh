#!/bin/sh
nvidia-smi --lock-gpu-clocks=1500,1800 --mode=1
if [ $? -ne 0 ]; then
    echo "Permission error: Current user does not have permission to change the file."
    exit 1
fi
nvidia-smi --lock-memory-clocks=5001,9501
echo "New OC: 1800MHz Core, 9500MHz Memory"
