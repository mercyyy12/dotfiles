#!/bin/bash
if pkill -x wlsunset; then
    notify-send "Night Light" "Disabled" -t 2000
else
    wlsunset -l 27.7 -L 85.3 -t 5000 &
    notify-send "Night Light" "Enabled (5000K)" -t 2000
fi
