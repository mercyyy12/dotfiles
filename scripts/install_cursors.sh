#!/usr/bin/env bash
# Script to install premium cursor themes.

set -e
mkdir -p ~/.icons
TEMP_DIR=$(mktemp -d)

install_bibata() {
    echo "Installing Bibata Modern Ice Cursors..."
    URL="https://github.com/ful1e5/Bibata_Cursor/releases/latest/download/Bibata-Modern-Ice.tar.gz"
    curl -L "$URL" -o "$TEMP_DIR/bibata.tar.gz"
    tar -xzf "$TEMP_DIR/bibata.tar.gz" -C "$TEMP_DIR"
    cp -r "$TEMP_DIR/Bibata-Modern-Ice" ~/.icons/
}

install_catppuccin() {
    echo "Installing Catppuccin Mocha Dark Cursors..."
    URL="https://github.com/catppuccin/cursors/releases/latest/download/Catppuccin-Mocha-Dark-Cursors.zip"
    curl -L "$URL" -o "$TEMP_DIR/cursors.zip"
    unzip -q "$TEMP_DIR/cursors.zip" -d "$TEMP_DIR"
    cp -r "$TEMP_DIR/catppuccin-mocha-dark-cursors" ~/.icons/Catppuccin-Mocha-Dark-Cursors
}

case $1 in
    bibata) install_bibata ;;
    catppuccin) install_catppuccin ;;
    *) 
        install_bibata
        install_catppuccin
        ;;
esac

rm -rf "$TEMP_DIR"
echo "Success! Cursors installed to ~/.icons/"
