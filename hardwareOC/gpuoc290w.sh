#!/bin/sh
nvidia-smi -pl 290.00
if [ $? -ne 0 ]; then
    echo "Permission error: Current user does not have permission to change the file."
    exit 1
fi

