#!/bin/bash

# Print help statement
if [ "$1" == "--help" ]; then
    echo "Usage: ./tail_alter.sh FILE"
    echo "Example: ./tail_alter.sh /sys/class/thermal/thermal_zone0/temp"
    exit 0
fi

FILE=$1
THRESHOLD_LOWER=10
THRESHOLD_UPPER=100

tail -n 0 -f "$FILE" | while read line
do
    value=$(echo "$line" | awk '{print $1}')  # Assuming the value is in the first column
    if [ $value -lt $THRESHOLD_LOWER ] || [ $value -gt $THRESHOLD_UPPER ]; then
        echo "Alert: Value $value is not within parameters"
        notify-send "Alert" "GPU TEMPERATURE: $value"
    fi
done
