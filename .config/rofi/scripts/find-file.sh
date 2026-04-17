#!/usr/bin/env bash
selected=$(find "$HOME" -maxdepth 3 -not -path '*/.*' 2>/dev/null | rofi -dmenu -i -p " Find File" -theme ~/.config/rofi/config.rasi)
if [ -n "$selected" ]; then
    xdg-open "$selected"
fi
