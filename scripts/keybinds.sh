#!/usr/bin/env bash

# Parse KEYBINDINGS.md and show it in Rofi with categories
# Uses awk to prepend the section name (e.g. [Sway]) to each keybind
awk '
    /^## / { 
        # Extract category name, removing Markdown headers and extra info
        cat=$0; 
        gsub(/^## /, "", cat); 
        gsub(/ \(.*\)/, "", cat); 
    } 
    /^\* / { 
        # Print the keybind with the current category as a prefix
        print "[" cat "] " substr($0, 3) 
    }
' ~/dotfiles/KEYBINDINGS.md | rofi -dmenu -i -p "󰌌 Help" -width 1000 -lines 15
