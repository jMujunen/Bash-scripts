#!/bin/bash

# tmp hwdata log files

/bin/python3 /home/joona/python/Projects/Logging/csv_output.py

[[ -f /usr/bin/corectrl ]] && /bin/corectrl -m PowerSave --minimize-systray
[[ -f /usr/bin/ollama ]] && /usr/bin/ollama serve
