#!/usr/bin/env sh
swayidle -w timeout 5 'swaymsg "output * dpms off"' resume 'swaymsg "output * dpms on"' &
IDLE_PID=$!
hyprlock
kill $IDLE_PID 2>/dev/null
