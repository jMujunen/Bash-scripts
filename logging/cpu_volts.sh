#!/bin/bash

output=$(sensors | grep VIN3 | sed -E 's/.*(.[^+][0-9]{1,2}\.[0-9].).*/\1/')
#stripped=$(echo $output | cut -d . -f 1)
stripped=$(echo $output | xargs)
size=${#stripped}

if [[ $size -eq 6 ]]; then
    conveted=$(echo $stripped / 1000 | calc)
    echo "$conveted"v

else
    echo "$stripped"v
fi