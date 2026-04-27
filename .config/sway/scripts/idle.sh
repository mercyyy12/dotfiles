#!/usr/bin/env bash

# Kill any existing swayidle instances
pkill swayidle || true

# Start swayidle with our configurations
swayidle -w \
    timeout 600 "bash $HOME/.config/sway/scripts/lockman.sh" \
    timeout 610 'swaymsg "output * dpms off"' \
    resume 'swaymsg "output * dpms on"' \
    timeout 1800 "systemctl suspend" \
    before-sleep "bash $HOME/.config/sway/scripts/lockman.sh"
