#!/usr/bin/env bash

# Parse KEYBINDINGS.md and show it in Rofi
# Only lines starting with '*' (the actual keybinds)
grep -E '^\* ' ~/dotfiles/KEYBINDINGS.md | \
    sed 's/^\* //' | \
    rofi -dmenu -i -p "󰌌 Help" -theme-str 'window {width: 40%;}'
