#!/bin/bash

uptime=$(uptime -p)
host=$(uname -n)

diskSpace=$(df -Ph | grep /dev/root | awk '{print $5}')
memoryUsed=`free -t -m | grep Total | awk '{print $3" MB";}'`


echo -e "\033[38;2;138;6;146m===========================================\033[0m"
echo -e "\033[38;2;203;121;7mHost: $host\033[0m"
echo -e "\033[1;32mUptime: $(uptime -p)\033[0m"
echo -e "\033[38;2;0;187;218mDisk Use: $diskSpace\nMemory Use: $memoryUsed/1000MB\033[0m"
echo -e "\033[38;2;138;6;146m===========================================\033[0m"

#echo -e ""
