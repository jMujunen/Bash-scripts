#!/bin/bash
# graph_gpu.sh - Graphs the main GPU's sensor data using ttyplot

# Print help message
if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
    echo "Usage: graph_gpu_temp.sh [OPTIONS] [PLOT_CHAR=⛚]"
    echo "OPTIONS: "
    echo "  -m Memory clock"
    echo "  -c Core clock"
    echo "  -t: Temperature in Celsius"
    echo "  -l: Core load in percent"
    echo "  -u: Core utilization in percent"
    echo "  -w: Power draw in watts"
    exit 0
fi

# Check if required arguments are provided
if [ "$#" -gt 2 ]; then
    echo "Error: Invalid number of arguments. Use --help for usage information."
    exit 1
elif

# Graph specified value




# Graph temp
# if [ "$1" == "-t" ]; then
#     nvidia-smi --loop-ms=200 --query-gpu=timestamp,utilization.gpu,power.draw,temperature.gpu,\
#     clocks.current.graphics,clocks.current.memory,fan.speed --format=csv \
#     					| sed -u 's/timestamp//g; s/^.*fan.speed [%]//g; s/^.*W,//g; s/,.*//g' \
#     					| ttyplot -c $(echo -ne " \u$(printf '%x' 9609) ") -s 100 -t "GPU TEMP -u Celsius" -u C
#     exit 0
