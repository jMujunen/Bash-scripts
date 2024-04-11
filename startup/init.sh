#!/bin/bash
# startup/init.sh - Initialize x11 specific environment

function X11() {
    # Initial ~.xbindkeysrc
    xbindkeys
    

}

if [ $XDG_SESSION_TYPE=x11 ]; then
xbindkeys
xset r rate 300 50
setxkbmap -option caps:swapescape