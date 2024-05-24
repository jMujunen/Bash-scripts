#!/bin/sh

# force_kill.sh - force kill known problem processes

if [[ "$#" -eq 1 ]]; then
	zenity --question --text="Kill all?" || exit
fi


# Wine
kill 997 1021 >/dev/null 2>&1
wineserver -k 15 && echo "Killed wineserver" || echo "wineserver not running"
# Ollama
killall -9 ollama >/dev/null 2>&1
killall -9 ollama_llama_server >/dev/null 2>&1 && echo "Killed Ollama" || echo "Ollama not running"

# Steam
killall -9 steamwebhelper >/dev/null 2>&1 && echo "Killed Steam" || echo "Steam not running"

# Osrs
matches=$(ps aux | grep -E "jagex" | wc -l)
procs=$(echo $matches-1 | bc)

for proc in $(ps aux | grep -E "jagex" | tail -5 | awk '{print $2}'); do
	kill -9 $proc && echo "Killed PID $proc" || echo "Error killing PID $proc"
done
