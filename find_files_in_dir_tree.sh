#!/bin/bash

# find_files_in_dir_tree.sh - Find jpg, png, svg, ico files in a directory tree to consolidate to a folder
# Usage: ./find_files_in_dir_tree.sh

# Find icons/images
find . -type f -name "*.jpg" -o -name "*.png" -o -name "*.svg" -o -name "*.ico" -print1 | xargs -0 -I {} mv {} ../icons