#!/bin/bash

# Check if an argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <number_of_iterations>"
    exit 1
fi
echo $1
# Use a for loop to iterate based on the provided argument
for ((i=1; i<=$1; i++)); do
    echo 'Iteration $i $2.log'
    # Add your code here for each iteration
done


for i in {1..10}; do
    echo "Iteration $i"
done


i=1
while [ $i -le 10 ]; do
    echo "Iteration $i"
    i=$((i+1))
done


i=1
until [ $i -gt 10 ]; do
    echo "Iteration $i"
    i=$((i+1))
done