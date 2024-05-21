#!/bin/sh

# printenv_color.sh - Adds color to printenv output
# Usage: ./printenv_color.sh


variable=$(printenv | grep -o -E "^[a-zA-Z0-9]+[^=]*")

for var in $variable
do
    value=$(printenv | grep -o -P "^$var=.*" | sed -E "s/$var=(.*)/\1/g")
    echo -e "\e[38;2;99;176;105m$var\e[0m = \e[38;5;208m$value\e[0m"
done
