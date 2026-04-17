#!/usr/bin/env bash

# Catppuccin Mocha Dark Cursor Installation
echo "Installing Catppuccin Mocha Dark Cursors..."

mkdir -p ~/.icons

# Download URL for Catppuccin Mocha Dark
URL="https://github.com/catppuccin/cursors/releases/latest/download/Catppuccin-Mocha-Dark-Cursors.zip"

# Temporary directory
TEMP_DIR=$(mktemp -d)

# Download and extract
curl -L "$URL" -o "$TEMP_DIR/cursors.zip"
unzip -q "$TEMP_DIR/cursors.zip" -d "$TEMP_DIR"

# Install to ~/.icons
cp -r "$TEMP_DIR/catppuccin-mocha-dark-cursors" ~/.icons/Catppuccin-Mocha-Dark-Cursors

# Cleanup
rm -rf "$TEMP_DIR"

echo "Success! Catppuccin Mocha Dark Cursors installed to ~/.icons/Catppuccin-Mocha-Dark-Cursors"
