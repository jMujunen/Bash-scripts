#!/bin/sh

# log_gpu.sh - Log GPU temperature and utilization for $x seconds

function print_help() {
    echo "Usage: ./script_name.sh SECONDS FILE_NAME"
    echo "------------------------------------------"
    echo "SECONDS:   Number of seconds to log."
    echo "FILE_NAME: Name of the log file."
    echo "Log file gets saved as /Logs/<FILE_NAME>.csv"
}

if [ "$1" == "--help" ]; then
    # Display usage information
    print_help
    exit 0
fi

# Check if required arguments are provided
if [ "$#" -eq 1 ]; then
    # Display usage information
    file=~/Logs/gpu.csv
    if [ "$1" == "--nostop" ]; then
        count=2147000000
    else
        count=$1
    fi
fi

if [ "$#" -eq 2 ]; then
    count=$1
    file=$2
fi
# Check if required arguments are provided
if [ "$#" -gt 2 ]; then
    # Display usage information
    echo "Error: Invalid number of arguments."
    print_help
    exit 1
fi

# output=$(nvidia-smi --query-gpu=timestamp,temperature.gpu,utilization.gpu,power.draw,temperature.gpu,clocks.current.graphics,clocks.current.memory,fan.speed  --format=csv)
# echo "$output" | tee ~/Logs/$2.csv

# If file doesnt exsist
if [ ! -e $file ]; then
    echo "FILE != EXSIST"
    echo "datetime,temperature,usage,power,core_clock,memory_clock,fan,voltage" >$file
fi

for ((i = 1; i <= $count; i++)); do
    printf "Time Elapsed: $SECONDS/$1 \r"
    voltage=$(nvidia-smi -q --display=Voltage | grep -o -P "Graphics.*" | awk '{ printf "%.1f\n", $3}')
    output=$(nvidia-smi --query-gpu=timestamp,temperature.gpu,utilization.gpu,power.draw,clocks.current.graphics,clocks.current.memory,fan.speed \
        --format=csv,noheader,nounits)
    printf "$output, $voltage\r" | sed -E 's/\//-/g'
    echo "$output, $voltage" | sed -E 's/\//-/g' >>$file
    sleep 1
done
