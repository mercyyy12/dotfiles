#!/usr/bin/env bash
echo "Applying Sway NVIDIA config..."
sudo cp /home/init0/dotfiles/scripts/sway-nvidia /usr/local/bin/sway-nvidia
sudo chmod +x /usr/local/bin/sway-nvidia
sudo cp /home/init0/dotfiles/scripts/sway-nvidia.desktop /usr/share/wayland-sessions/sway-nvidia.desktop
echo "Success! Select 'Sway (NVIDIA)' from the login manager."
