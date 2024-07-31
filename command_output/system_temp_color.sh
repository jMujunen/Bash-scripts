#!/bin/bash

output=$(sensors | grep "Sensor 2" | awk '{print $3}' | sed -E 's/.*([0-9][0-9]).*/\1/g')

if [[ $output -gt 40 ]]; then
    echo -e "\e[33m$output°C \e[0m"
elif [[ $output -gt 45 ]]; then
    echo -e "\e[31m$output°C \e[0m"
else
    echo -e "\e[38;2;99;176;105m$output°C \e[0m"
fi
