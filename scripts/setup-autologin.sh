#!/usr/bin/env bash
# Script to enable SDDM autologin for a seamless boot-to-hyprlock experience.
# Run this with sudo.

set -e

USER_NAME="init0"
SESSION_NAME="sway-nvidia"

echo "Enabling SDDM autologin for $USER_NAME..."

mkdir -p /etc/sddm.conf.d

cat <<EOF > /etc/sddm.conf.d/autologin.conf
[Autologin]
User=$USER_NAME
Session=$SESSION_NAME
EOF

echo "Autologin configured! Please reboot to test."
