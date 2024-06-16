#!/bin/bash

output=$(ping -c 1 10.0.0.1 | sed -u 's/^.*time=//g; s/ ms//g; s/^PING.*//g; s/^---.*//g; s/^.*packets.*//g; s/^rtt.*//g')
# Round to 1 decimal places
rounded=$(printf "%.1f" "$output")

echo $rounded ms
echo $rounded >> /tmp/ping.log
