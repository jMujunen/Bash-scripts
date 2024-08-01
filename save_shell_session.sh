#!/bin/bash

# Source color definitions and the main function 'save_sesh' from .bash_functions
source "$ZDOTDIR/.color_defs"
source "$ZDOTDIR/.bash_functions"

default_dir="$HOME/Logs/kitty/"
mkdir -p "$default_dir" > /dev/null 2>&1

timestamp=$(date +%F\ %H:%M)
output_path="$default_dir/$timestamp.log"

# Define help msg
printhelp() {
    echo "Usage: save_session_hist.sh [OPTIONS]... FILE_NAME"
    echo "Save stdin history to FILE_NAME"
    echo ""
    echo "Options:"
    echo -e "\t -h, --help              display this help and exit"
    echo -e "\nPATH (default ${output_path})"
    exit 0
}
# Parse options
if [ "$1" = "-h" ] || [ "$1" = "--help" ] || [[ $* -gt 1 ]]; then
    printhelp | bat -ppl help
fi

if save_hist "$1"; then
    echo "Session history saved to $output_path"
else
    echo "Failed to save session history."
    printhelp | bat -ppl help
fi
