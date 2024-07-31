#!/bin/bash

restart() {
    if kquitapp6 plasmashell > /dev/null 2>&1; then
        kstart plasmashell > /dev/null 2>&1
        return 0
    fi
    return 1
}

if restart; then
    kdialog --msgbox "Successfully restarted Plasma" > /dev/null 2>&1 &
    disown
else
    kdialog --error "Failed to restart Plasma" > /dev/null 2>&1 &
    disown
fi
