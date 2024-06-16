#!/bin/bash

echo $(ping -c 1 1.1.1.1 | grep -Po "\d+\.\d\s" | sed -E 's/1.1//g') ms
