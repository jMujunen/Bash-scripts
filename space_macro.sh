#!/bin/bash

# space_macro.sh - Presses the spacebar 5 times
#                  when mouse button 9 is pressed (b:9)

for i in {1..5}
do
  xdotool keydown space
  sleep 0.025
  xdotool keyup space
  sleep 0.025
done
     