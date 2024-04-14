#!/bin/bash

# Create directories for each partition of the drive
# lsblk /dev/sdc | grep -P "sdc\d" | awk '{print $1'} |

lsblk /dev/sdc | grep -P "sdc\d" | awk '{print $1'} |sed -E "s/.*([a-z][a-z][a-z][0-9]).*/\1/g" | while read -r line; do
    mkdir /run/media/joona/$line
    mount /dev/$line /run/media/joona/$line
done  