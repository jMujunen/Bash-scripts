#!/bin/sh

# force_kill.sh - force kill known problem processes

# Wine
kill 997 1021 >/dev/null 2>&1
wineserver -k 15 && echo "Killed wineserver" || echo "wineserver not running"
# Ollama
killall -9 ollama >/dev/null 2>&1
killall -9 ollama_llama_server >/dev/null 2>&1 && echo "Killed Ollama" || echo "Ollama not running"

# Steam
killall -9 steamwebhelper >/dev/null 2>&1 && echo "Killed Steam" || echo "Steam not running"



