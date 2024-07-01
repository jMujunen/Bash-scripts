#!/bin/bash
symbol=$1

if [ -z "$symbol" ]; then
  echo "Error: No symbol provided"
  exit 1
fi

hex_code=$(echo $symbol | iconv -f UTF-8 -t hex | perl -pe 's/\n//; s/(0x)?([0-9A-F]{4})/\U\2/')

echo $hex_code
