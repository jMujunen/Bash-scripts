#!/bin/sh
kquitapp6 plasmashell 2>/dev/null 1>2&& kstart plasmashell 2>/dev/null 1>2&

if [ $? -eq 0 ]; then
	zenity --info --text="Successfully restarted Plasma" 2>/dev/null 1>2
else
	zenity --warning --text="Failed to restart Plasma" 2>/dev/null 1>2
fi
clear

