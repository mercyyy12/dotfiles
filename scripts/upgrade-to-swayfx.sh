#!/usr/bin/env bash
# Level 2 Optimization: SwayFX & Utility Upgrades
set -e

echo "--- Level 2: Aesthetic & Utility Upgrades ---"

echo "1. Installing trash-cli..."
sudo dnf install -y trash-cli

echo "2. Enabling SwayFX COPR..."
sudo dnf copr enable -y swayfx/swayfx

echo "3. Replacing Sway with SwayFX (Overriding System Protection)..."
# Using dnf5 swap with --setopt to allow replacing the 'protected' sway package
sudo dnf5 swap -y sway swayfx --allowerasing --setopt=protected_packages=

echo "--- Upgrades Installed ---"
echo "Note: Please logout and log back in to activate SwayFX."
echo "Once you are in SwayFX, you can uncomment the lines in ~/.config/sway/config.d/01-swayfx.conf to see the magic!"
