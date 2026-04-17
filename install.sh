#!/usr/bin/env bash
set -e

echo "Starting system preparation & updates"
sudo dnf upgrade -y
sudo dnf install -y --skip-unavailable curl wget unzip tar rsync git

echo "Configuring repositories"
sudo dnf install -y --skip-unavailable \
    https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# SwayOSD and Hyprlock COPRs
sudo dnf copr enable -y erikreider/swayosd
sudo dnf copr enable -y solopasha/hyprland
sudo dnf copr enable -y erikreider/SwayNotificationCenter
# Autotiling will be installed via pip
sudo dnf makecache

echo "Installing Sway and UI stack"
sudo dnf install -y --skip-unavailable \
    sway waybar swayidle hyprlock rofi-wayland \
    xdg-desktop-portal-wlr xdg-desktop-portal-gtk \
    kitty thunar xfce-polkit python3-i3ipc \
    adw-gtk3-theme

echo "Installing audio and utilities"
sudo dnf install -y --skip-unavailable \
    pipewire pipewire-utils wireplumber pavucontrol \
    brightnessctl playerctl swayosd-lib swayosd-client \
    grim slurp jq wlsunset wl-clipboard cliphist

echo "Installing CLI tools"
sudo dnf install -y --skip-unavailable \
    zsh tmux fzf bat fd-find ripgrep zoxide eza \
    neovim lazygit git-delta btop ncdu \
    gcc make gcc-c++ cargo lua luarocks \
    nodejs npm python3-pip fastfetch

echo "Installing Yazi"
curl -LO https://github.com/sxyazi/yazi/releases/latest/download/yazi-x86_64-unknown-linux-gnu.zip
unzip -o yazi-x86_64-unknown-linux-gnu.zip
mkdir -p ~/.local/bin
mv yazi-x86_64-unknown-linux-gnu/yazi ~/.local/bin/
mv yazi-x86_64-unknown-linux-gnu/ya ~/.local/bin/
rm -rf yazi-x86_64-unknown-linux-gnu*

echo "Configuring system"
sudo systemctl enable --now swayosd-lib.service || echo "SwayOSD may need manual start after reboot"

CUR_USER=$(whoami)
sudo chsh -s $(which zsh) $CUR_USER

# Install autotiling via pip
pip install autotiling --user --break-system-packages

echo "Installation complete"
echo "Next steps:"
echo "Run setup_links.sh"
echo "Run scripts/install_fonts.sh"
echo "Optional: run scripts/fix-sway-nvidia.sh for NVIDIA GPUs"
echo "Reboot system"