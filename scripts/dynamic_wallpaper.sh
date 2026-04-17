#!/usr/bin/env bash

# Path to backgrounds directory
WALLPAPER_DIR="$HOME/.config/backgrounds"
# Path to hyprlock config
HYPRLOCK_CONFIG="$HOME/.config/hypr/hyprlock.conf"
# Interval between changes (seconds) - 30 minutes = 1800s
INTERVAL=1800

# Initial sleep to ensure Sway is fully started and ready for swaymsg
sleep 1

while true; do
    # Pick a random image from the backgrounds folder
    RANDOM_BG=$(ls "$WALLPAPER_DIR"/*.jpg | shuf -n 1)

    # Apply to Sway
    swaymsg "output * bg '$RANDOM_BG' fill"

    # Update hyprlock configuration so lockscreen matches
    sed -i "s|path = .*|path = $RANDOM_BG|" "$HYPRLOCK_CONFIG"

    # Sync SDDM login screen background (requires sudoers rule)
    sudo /usr/local/bin/update-sddm-wallpaper "$RANDOM_BG"

    # Wait for the next cycle
    sleep "$INTERVAL"
done
