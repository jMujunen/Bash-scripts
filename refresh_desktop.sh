#!/bin/bash

restart(){
	if kquitapp6 plasmashell > /dev/null 2>&1; then
		kstart plasmashell > /dev/null 2>&1 
		return 0
	fi
	return 1
}

if restart; then
	zenity --info --text="Successfully restarted Plasma" > /dev/null 2>&1 & disown
else
	zenity --warning --text="Failed to restart Plasma" > /dev/null 2>&1 & disown
fi
