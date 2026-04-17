#!/usr/bin/env bash
FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"

echo "Downloading Fonts..."
curl -fLo "$FONT_DIR/feather.ttf" "https://github.com/adi1090x/rofi/raw/master/fonts/feather.ttf"
curl -fLo "$FONT_DIR/HackNerdFont-Regular.ttf" "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/HackNerdFont-Regular.ttf"
curl -fLo "$FONT_DIR/FiraSans-Regular.otf" "https://github.com/mozilla/Fira/raw/master/otf/FiraSans-Regular.otf"
curl -fLo "$FONT_DIR/FiraSans-SemiBold.otf" "https://github.com/mozilla/Fira/raw/master/otf/FiraSans-SemiBold.otf"

fc-cache -fv
echo "Fonts installed!"
