#!/usr/bin/env bash
# Script to install the premium Tela-circle Purple icon theme.
set -e

echo "Installing Tela-circle Icons (Purple edition)..."

TEMP_DIR=$(mktemp -d)
git clone --depth 1 https://github.com/vinceliuice/Tela-circle-icon-theme.git "$TEMP_DIR"

# Install only the Purple variant to match Tokyo Night highlights
"$TEMP_DIR/install.sh" -d "$HOME/.local/share/icons" purple

# Apply the theme
gsettings set org.gnome.desktop.interface icon-theme 'Tela-circle-purple-dark'

# Cleanup
rm -rf "$TEMP_DIR"

echo "Success! Tela-circle-purple icons installed and applied."
