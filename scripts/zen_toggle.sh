#!/bin/bash

# Path to a temporary file to track state
STATE_FILE="/tmp/sway_zen_mode"

if [ ! -f "$STATE_FILE" ]; then
    # Entering Zen Mode
    killall -SIGUSR1 waybar
    swaymsg "gaps inner current set 0"
    swaymsg "gaps outer current set 0"
    swaymsg "gaps inner all set 0"
    swaymsg "gaps outer all set 0"
    swaymsg "border none"
    touch "$STATE_FILE"
else
    # Exiting Zen Mode
    killall -SIGUSR1 waybar
    swaymsg "gaps inner current set 7"
    swaymsg "gaps outer current set 4"
    swaymsg "gaps inner all set 7"
    swaymsg "gaps outer all set 4"
    swaymsg "border pixel 2"
    rm "$STATE_FILE"
fi
