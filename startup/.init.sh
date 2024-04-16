#!/bin/bash
# startup/init.sh - Initialize x11 specific environment

function X11() {
    # Initial ~.xbindkeysrc
    xbindkeys
    

}

echo "voltage, avg_clock, max_clock, max_temp, avg_temp" > /tmp/cpuinfo.csv
echo "temp, usage, power, mem_clock, core_clock" > /tmp/gpuinfo.csv

#if [ $XDG_SESSION_TYPE=x11 ]; then
#	xbindkeys
#	xset r rate 300 50
#	setxkbmap -option caps:swapescape
#fi
