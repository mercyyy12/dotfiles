#!/usr/bin/env bash

# Simpler Rofi call to avoid theme conflicts
grep -E '^\* ' ~/dotfiles/KEYBINDINGS.md | \
    sed 's/^\* //' | \
    rofi -dmenu -i -p "Help" -width 1000 -lines 15
