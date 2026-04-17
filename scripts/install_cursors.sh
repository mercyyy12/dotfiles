#!/usr/bin/env bash

# Bibata Modern Ice Cursor Installation
echo "Installing Bibata Modern Ice Cursors..."

mkdir -p ~/.icons

# Download URL for Bibata Modern Ice
URL="https://github.com/ful1e5/Bibata_Cursor/releases/latest/download/Bibata-Modern-Ice.tar.gz"

# Temporary directory
TEMP_DIR=$(mktemp -d)

# Download and extract
curl -L "$URL" -o "$TEMP_DIR/bibata.tar.gz"
tar -xzf "$TEMP_DIR/bibata.tar.gz" -C "$TEMP_DIR"

# Install to ~/.icons
cp -r "$TEMP_DIR/Bibata-Modern-Ice" ~/.icons/

# Cleanup
rm -rf "$TEMP_DIR"

echo "Success! Bibata Modern Ice installed to ~/.icons/"
