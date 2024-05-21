#!/bin/sh

line=$(tail -1 /tmp/hwinfo.csv | awk '{print $7" °C,",$8" W,",$9" V,",$10" %"}' | sed -E 's/([0-9]),/\1/g')

echo $line
