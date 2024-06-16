#!/bin/bash

####################################
####    Recursive Move Script    ###
####################################

# Print help
if [ "$1" == "--help" ]; then
    echo "Move all files with extension FILE_EXTENSION in SOURCE_DIRECTORY to DESTINATION_DIRECTORY recursively."
    echo ""
    echo "Usage: ./mv_recursive.sh SOURCE_DIRECTORY DESTINATION_DIRECTORY FILE_EXTENSION"
    echo "Example: ./mv_recursive.sh ~/Downloads ~/Videos mp4"
    exit 0
fi

# Check if required arguments are provided
if [ "$#" -ne 3 ]; then
    echo "Error: Invalid number of arguments. Use --help for usage information."
    exit 1
fi


# Move all files with extension FILE_EXTENSION in SOURCE_DIRECTORY to DESTINATION_DIRECTORY recursively,
# and provide the user with feedback every time a file is moved.
for file in "$1"/*."$3"; do
    echo "Moving $file to $2"
    mv "$file" "$2"
done
# Print completion statement
echo "Complete"
echo "Errors: $?"


