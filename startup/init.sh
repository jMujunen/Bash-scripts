#!/bin/bash

# tmp hwdata log files
#python3 -u /home/joona/python/Projects/Logging/csv_output.py
/bin/corectrl -m PowerSave --minimize-systray
/usr/bin/ollama serve
