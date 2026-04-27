#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/.config/backgrounds"

# Find all images (following symlinks), exclude 032.png, and pick a random one
RANDOM_WALLPAPER=$(find -L "$WALLPAPER_DIR" -maxdepth 1 -type f \( -name '*.jpg' -o -name '*.png' -o -name '*.jpeg' \) ! -name '032.png' ! -name '032.jpg' | shuf -n 1)

if [ -n "$RANDOM_WALLPAPER" ]; then
    # Change the wallpaper in Sway using proper command format
    swaymsg output \* bg "$RANDOM_WALLPAPER" fill
    
    # Send a notification
    notify-send -i "$RANDOM_WALLPAPER" "󰸉 Wallpaper Changed" "Enjoy the new view!"
fi
