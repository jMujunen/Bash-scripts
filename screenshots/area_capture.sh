#!/bin/sh

# Define the filename with date and time
FILENAME="$HOME/Pictures/Screenshots/Area_$(date +%F_%H-%M-%S).png"

# Take a screenshot of a selected area
import "$FILENAME"

# Notify the user where the screenshot has been saved
notify-send -i camera-photo-symbolic -t 3000 "Screenshot Taken" "Screenshot of selected area saved as $FILENAME"