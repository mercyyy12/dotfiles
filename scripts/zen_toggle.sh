#!/bin/bash

# Path to a temporary file to track state
STATE_FILE="/tmp/sway_zen_mode"

if [ ! -f "$STATE_FILE" ]; then
    # Entering Zen Mode
    killall -SIGUSR1 waybar
    swaymsg "gaps inner all set 0"
    swaymsg "gaps outer all set 0"
    swaymsg "border none"
    touch "$STATE_FILE"
else
    # Exiting Zen Mode
    killall -SIGUSR1 waybar
    swaymsg "gaps inner all set 10"
    swaymsg "gaps outer all set 5"
    swaymsg "border pixel 2"
    rm "$STATE_FILE"
fi
