#!/bin/bash

for folder in $(find /mnt/win_ssd/Users/Joona/Videos/NVIDIA/ -type d); do
    python3 /home/joona/python/scripts/batch_compress_mp4.py "$folder" \
    "/mnt/ssd/OBS/Joona/$folder/"
done