#!/bin/bash

# compress_mp4.sh
# 
# This script compresses all .mp4 files in a specified directory
# and saves the compressed files in another specified directory.

# Display help
if [ "$1" == "-h" ] || [ "$1" == "--help" ] || [ "$#" -ne 2 ]; then
    echo "Usage: compress_mp4.sh INPUT_DIRECTORY OUTPUT_DIRECTORY"
    exit 0
fi

# Set the input and output directories
input_directory=$1
output_directory=$2


# Iterate over all .mp4 files in the input directory
for input_file in "$input_directory"/*.mp4; do
    # Print information about the current file to the user
    echo "Processing file: $input_file"

    # Extract the file name without extension
    file_name=$(basename "$input_file" .mp4)

    # Define the output file path
    output_file="$output_directory/$file_name_output.mp4"

    # Run ffmpeg command for each file
    ffmpeg -i "$input_file" -vcodec copy -crf 28 "$output_file"
done

echo "Batch conversion completed."