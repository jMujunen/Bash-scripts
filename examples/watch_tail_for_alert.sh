#!/bin/bash

# Print help statement


FILE=/home/joona/Logs/gpu_altert.log
THRESHOLD_LOWER=15
THRESHOLD_UPPER=75

tail -n 1 -f $FILE | while read line
do
    value=$(cat $FILE | tail -n 1)  # Assuming the value is in the first column
    echo "Value: $value"
    if [ $value -lt $THRESHOLD_LOWER ] || [ $value -gt $THRESHOLD_UPPER ]; then
        echo "Alert: Value $value is not within parameters"
        notify-send "Alert" "GPU TEMPERATURE: $value"
    fi
done
