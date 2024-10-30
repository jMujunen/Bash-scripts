#!/bin/bash

line=$(tail -1 /tmp/hwinfo.csv | awk '{print $10" V,",$11" °C,",$12" MHz,",$13" MHz"}' | sed -E 's/([0-9]),/\1/g')

echo $line
