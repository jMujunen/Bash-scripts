#!/bin/bash

###################################
#        ---jpg2gif.sh---         #
#     converts all jpg files      #
#   in current directory to gif   #
###################################


# Print help
if [ "$1" == "--help" ]; then
    echo "Converts all jpg files in current directory to gif."
    echo ""
    echo "Usage: ./jpg2gif.sh 
fi


convert -delay 20 -loop 0 *.jpg myimage.gif
