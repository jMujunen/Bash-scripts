#!/bin/bash

# log_gpu.sh - Log GPU temperature and utilization for $x seconds

if [ "$1" == "--help" ]; then
    # Display usage information
    echo "Usage: ./script_name.sh SECONDS FILE_NAME"
    echo "SECONDS:   Number of seconds to log."
    echo "FILE_NAME: Name of the log file."
    exit 0
fi
# Check if required arguments are provided
if [ "$#" -lt 2 ]; then
    # Display usage information
    echo "Error: Invalid number of arguments."
    echo "Usage: ./script_name.sh SECONDS FILE_NAME"
    echo "SECONDS:   Number of seconds to log."
    echo "FILE_NAME: Name of the log file."
    exit 1
fi

# Check if required arguments are provided
if [ "$#" -gt 2 ]; then
    # Display usage information
    echo "Error: Invalid number of arguments."
    echo "Usage: ./script_name.sh SECONDS FILE_NAME"
    echo "SECONDS:   Number of seconds to log."
    echo "FILE_NAME: Name of the log file."
    exit 1
fi

output=$(nvidia-smi --query-gpu=timestamp,utilization.gpu,power.draw,temperature.gpu,clocks.current.graphics,clocks.current.memory,fan.speed --format=csv)
echo "$output" | tee ~/Logs/$2.csv

for ((i=1; i<=$1; i++)); do
	printf "Time Elapsed: $SECONDS/$1 \r"
    output=$(nvidia-smi --query-gpu=timestamp,utilization.gpu,power.draw,temperature.gpu,clocks.current.graphics,clocks.current.memory,fan.speed --format=csv | tail -1)
    echo "$output" | tee -a  ~/Logs/$2.csv
    sleep 1
done