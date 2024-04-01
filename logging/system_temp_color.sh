#!/bin/bash

output=$(sensors | grep -A 3 iwlwifi_1-virtual-0 | sed -n -E '/.*([0-9]{2}\.[0-9])/p' | sed -E 's/.*([0-9]{2}).*/\1/g')

if [[ $output -gt 40 ]]; then
    echo -e "\e[33m$output°C \e[0m"
elif [[ $output -gt 45 ]]; then
    echo -e "\e[31m$output°C \e[0m"
else
    echo -e "\e[38;2;99;176;105m$output°C \e[0m"
fi