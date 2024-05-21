#!/bin/sh

line=$(tail -1 /tmp/hwinfo.csv | awk '{print $3" V,",$4" °C,",$5" MHz,",$6" MHz"}' | sed -E 's/([0-9]),/\1/g')

echo $line
