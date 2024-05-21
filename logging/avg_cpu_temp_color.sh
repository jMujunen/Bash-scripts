#!/bin/sh

output=$(sensors | grep 'Package id 0:' | sed -E 's/.*([0-9]{2}\.[0-9].C[^,\)]).*/\1/; s/\..°C//g')

if [[ $output -gt 65 ]]; then
    echo -e "\e[33m$output°C \e[0m"
elif [[ $output -gt 75 ]]; then
    echo -e "\e[31m$output°C \e[0m"
else
    echo -e "\e[38;2;99;176;105m$output°C \e[0m"
fi