#!/bin/bash

# tmp hwdata log files

sleep 5
/bin/python3 /home/joona/python/Projects/Logging/csv_output.py
sleep 5
nohup /bin/corectrl -m PowerSave --minimize-systray 2>/dev/null 1>2&
