#!/bin/bash

# dos2unix_recursive.sh - Recursively converts all files in the current directory from DOS format to UNIX format

# Print help message
if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
    echo "Usage: dos2unix_recursive.sh [-h|--help]"
    exit 0
fi


# Recursively convert all files in the current directory from DOS format to UNIX format
for file in *; do
    dos2unix "$file"
done