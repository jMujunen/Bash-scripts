#!/bin/sh


if [ "$1" == "--help" ]; then
    # Display usage information
    echo "Usage: ./script_name.sh SECONDS FILE_NAME"
    echo "SECONDS:   Number of seconds to log."
    exit 0
fi

# Check if required arguments are provided
if [ "$#" -lt 2 ]; then
    echo "Error: Invalid number of arguments. Use --help for usage information."
    exit 1
fi	

	touch ~/Logs/$2.log

for ((i=1; i<=$1; i++)); do
	printf "Time Elapsed: $SECONDS/$1\r"
    timestamp=$(date)
	printf "$timestamp:\n" >> $HOME/Logs/"$2.log"
	cat /proc/cpuinfo | grep "cpu MHz" >> $HOME/Logs/"$2.log"

	printf "\n" >> $HOME/Logs/"$2.log"
	sensors | grep Core >> $HOME/Logs/"$2.log"
	printf "\n" >> $HOME/Logs/"$2.log"
	sudo dmidecode --type processor | grep 'Voltage\|Speed' >> $HOME/Logs/"$2.log"
	printf "\n" >> $HOME/Logs/"$2.log"

	printf "===============================================================================\n" >> $HOME/Logs/"$2.log"

	sleep 1

done
