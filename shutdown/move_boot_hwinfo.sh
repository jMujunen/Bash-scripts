#!/bin/bash
# This shutdown script moves log file from /tmp/hwinfo.csv to ~/Logs/hwinfo/<date>.csv}

filename=$(date +%Y-%m-%d_%H)".csv"

mv /tmp/hwinfo.csv ~/Logs/hwinfo/"${filename}"