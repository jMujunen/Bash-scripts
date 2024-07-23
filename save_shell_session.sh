#!/bin/bash

printhelp() {
    echo "Usage: $0 [OPTIONS]... PATH"
    echo "Copy stdin to the clipboard with kitty"
    echo ""
    echo "Options:"
    echo -e "\t -h, --help              display this help and exit"
    echo -e "\nPATH (default: ${output_path}"
    exit 0
}

save_hist() {
    # Create file with timestamp as name
    timestamp=$(date +%F\ %H:%M)
    # Create directory if not exists, nullify output incase it exists
    mkdir -p "$HOME/Logs/kitty/" >/dev/null 2>&1
    # Define output path
    output_path="$HOME/Logs/kitty/$timestamp.log"
    # Create file
    touch "$output_path"

    # Copy stdin to clipboard
    kitten @ launch --type clipboard --stdin-source @screen_scrollback
    # Save clipboard content to file
    wl-paste >"${output_path}"
}
# Parse options
if [ "$1" = "-h" ] || [ "$1" = "--help" ] || [[ $* -gt 1 ]]; then
    printhelp
fi

save_hist
