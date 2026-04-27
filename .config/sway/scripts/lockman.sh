#!/usr/bin/env sh

# Prevent multiple instances
pgrep -x hyprlock && exit 0

# Run hyprlock in the background so it doesn't block swayidle
hyprlock &
# Give it a moment to render before allowing the system to sleep
sleep 0.5


