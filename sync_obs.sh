#!/bin/bash

sudo mount /dev/sdb1 /mnt/removable

for folder in $(find /mnt/removable/Users/Joona/Videos/NVIDIA/ -type f); do
    python3 /home/joona/python/scripts/batch_compress_mp4.py "$folder" \
    "/mnt/ssd/OBS/Joona/$folder/"
done