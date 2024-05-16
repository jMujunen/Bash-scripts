#!/bin/sh
nvidia-smi -pl 290.00
nvidia-smi --lock-gpu-clocks=220,2130 --mode=1
if [ $? -ne 0 ]; then
    echo "Permission error: Current user does not have permission to change the file."
    exit 1
fi
nvidia-smi --lock-memory-clocks=440,9501
echo "New OC: 2100MHz Core, 9500MHz Memory"
