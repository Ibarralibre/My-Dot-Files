#!/bin/sh
set -e
xset s off dpms 0 10 0
i3lock --ignore-empty-password --show-failed-attempts --nofork -p win -i /home/lazy/Pictures/Wallpaper/The_Universe_in_a_cube.png 
xset s off -dpms
