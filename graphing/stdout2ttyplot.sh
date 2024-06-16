#!/bin/bash

# Plot sys temp
{ while true; do 
    echo $(sensors | grep -A 3 iwlwifi_1-virtual-0 | sed -n -E '/[0-9]{2}/p' | sed -E 's/.*([0-9]{2}).*/\1/g'); 
    sleep 0.2; 
    done } | ttyplot -c . -m 60 -M 25 -u °C 

# Plot GPU Wattage
{ while true; do 
    echo $(nvidia-smi --query-gpu=power.draw --format=csv,noheader | sed -E "s/([0-9]+).*/\1/g"); 
    sleep 0.2; 
    done } | ttyplot -c . -m 200 -M 5 -u W

# Plot fan1
{ while true; do
    echo $(sensors | grep fan1: | sed -E 's/.*([0-9]{3,4}).*/\1/g' | tee -a /tmp/fan.log)
    sleep 0.2;
done } | ttyplot -c . -m 1000 -M 25 -u RPM

# Plot cpu volts
{ while true; do
    echo -e "\033[1;32m $(sensors | grep VIN3 | awk '{print $2 / 1000}'| tee -a /tmp/cpuvolts.log) \033[0m"
    #echo -e "\033 $(sensors | grep VIN3 | awk '{print $2 / 1000}'| tee -a /tmp/fan.log)
    sleep 0.2;
done } | ttyplot -c . -m 1.5 -M 0.5 -u V


# Plot cpu volts
{ while true; do
    echo -e "\033[1;32m $(sensors | grep VIN7 | awk '{print $2 / 1000}'| tee -a /tmp/cpuvolts1.log) \033[0m"
    #echo -e "\033 $(sensors | grep VIN3 | awk '{print $2 / 1000}'| tee -a /tmp/fan.log)
    sleep 0.2;
done } | ttyplot -c . -m 1.5 -M 0.5 -u V