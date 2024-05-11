#!/bin/bash

# tmp hwdata log files

sleep 5
/bin/python3 /home/joona/python/Projects/Logging/csv_output.py
sleep 5
nohup /bin/corectrl -m PowerSave --minimize-systray >/dev/null 2>&1
