#!/usr/bin/env bash

MODE=$1
DATE=$(date +%Y%m%d_%H%M%S)
DIR="$HOME/Pictures/Screenshots"
FILE="$DIR/$DATE.png"
LAST_CLIP="$DIR/last_clip.png"

mkdir -p "$DIR"

case $MODE in
    full)
        grim "$FILE" && notify-send -i "$FILE" "󰄄 Screenshot" "Full screen saved"
        ;;
    area)
        GEOM=$(slurp)
        if [ -n "$GEOM" ]; then
            grim -g "$GEOM" "$FILE" && notify-send -i "$FILE" "󰄄 Screenshot" "Area saved"
        fi
        ;;
    clip)
        GEOM=$(slurp)
        if [ -n "$GEOM" ]; then
            grim -g "$GEOM" - | tee "$LAST_CLIP" | wl-copy && \
            notify-send -i "$LAST_CLIP" "󰅌 Screenshot" "Copied to clipboard"
        fi
        ;;
esac
