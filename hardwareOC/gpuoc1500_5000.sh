#!/bin/bash
nvidia-smi --lock-gpu-clocks=0,1600 --mode=1 | sed -u s/.*//
if [ $? -ne 0 ]; then
    echo "Permission error: Current user does not have permission to change the file."
    exit 1
fi
nvidia-smi --lock-memory-clocks=0,5001 | sed -u s/.*//
nvidia-smi -pl 100.00 | sed -u s/.*//

clear
echo "New OC: "
echo "Core: 1500MHz"
echo "Memory: 5000MHz"
echo "Power Limit: 100w"

