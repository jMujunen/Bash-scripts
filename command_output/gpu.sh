#!/bin/bash

line=$(tail -1 /tmp/hwinfo.csv | awk '{print $7" °C,",$8" W,",$9" %,",$10" V,",$11" %"}' | sed -E 's/([0-9]),/\1/g')

echo $line
