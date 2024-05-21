#!/bin/sh

raw_output=$(cat /proc/cpuinfo)
output_file=~/Logs/cpu_clocks.csv

echo processor,cpu MHz; 

for  i in {0..9}; do
    sed -n -E 's/.*processor\s+:\s+([0-9]+).*/\1/p; s/.*cpu MHz\s+:\s+([0-9]+)\..*/\1/p' | awk 'NR%2{printf "%s, ," /usr/bin/bash; next} 1' | awk -F', ' '{printf "%d, %dn", , }'
done