#!/usr/bin/env bash

# Parse KEYBINDINGS.md and show it in Rofi with better formatting
# Formats output as: Description │ Keybinding │ Category
awk -F ' : ' '
    /^## / { 
        cat=$0; sub(/^## /, "", cat);
        # Extract text inside parentheses if it exists (e.g., "Sway", "Tmux")
        if (match(cat, /\(.*\)/)) {
            cat = substr(cat, RSTART + 1, RLENGTH - 2);
        }
        # Further shorten specific categories
        if (cat == "Hybrid Graphics") cat = "GPU";
        next;
    } 
    /^\* / { 
        # Strip the leading "* " and split by " : "
        line = substr($0, 3);
        if (index(line, " : ") > 0) {
            split(line, parts, " : ");
            key = parts[1];
            desc = parts[2];
            printf "%-55s │ %-35s │ %s\n", desc, key, cat
        } else {
            printf "%-92s │ %s\n", line, cat
        }
    }
' ~/dotfiles/KEYBINDINGS.md | rofi -dmenu -i -p "󰌌 Help" \
    -width 1200 \
    -lines 15 \
    -theme-str 'listview { columns: 1; }' \
    -theme-str 'window { width: 1200px; }'
