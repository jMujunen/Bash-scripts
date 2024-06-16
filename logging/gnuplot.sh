#!/bin/bash

# gnuplot.sh - Terminal plotting with gnuplot
# Set the filename of the CSV file
filename="/tmp/cpuinfo.csv"

# Set the Gnuplot commands in a heredoc
gnuplot_commands=$(cat << EOM
set datafile separator ","
set xlabel "Time"
set ylabel "Value"
set title "Live Data Plot"
plot "< tail -100 < $filename" using 1 with lines
EOM
)

# Start Gnuplot and pass the commands
echo "$gnuplot_commands" | gnuplot -persist &

while true; do
    # Update the plot every 4 seconds
    sleep 2
    echo "replot" > /tmp/gnuplot_fifo
done