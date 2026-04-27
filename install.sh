#!/usr/bin/env bash
set -e

echo "--- Core Environment Installation ---"

echo "1. System Preparation"
sudo dnf upgrade -y
sudo dnf install -y --skip-unavailable curl wget unzip tar rsync git

echo "2. Configuring Repositories (RPM Fusion & COPRs)"
sudo dnf install -y --skip-unavailable \
    https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf copr enable -y erikreider/swayosd
sudo dnf copr enable -y solopasha/hyprland
sudo dnf copr enable -y erikreider/SwayNotificationCenter
sudo dnf makecache

echo "3. Installing Sway UI Stack"
sudo dnf install -y --skip-unavailable \
    sway waybar swayidle hyprlock rofi-wayland \
    xdg-desktop-portal-wlr xdg-desktop-portal-gtk \
    kitty thunar xfce-polkit python3-i3ipc adw-gtk3-theme

echo "4. Installing Audio & Multimedia Utilities"
sudo dnf install -y --skip-unavailable \
    pipewire pipewire-utils wireplumber pavucontrol \
    brightnessctl playerctl swayosd-lib swayosd-client \
    grim slurp jq wlsunset wl-clipboard cliphist

echo "5. Installing High-Performance CLI Tools"
sudo dnf install -y --skip-unavailable \
    zsh tmux fzf bat fd-find ripgrep zoxide eza \
    neovim lazygit git-delta btop ncdu \
    gcc make gcc-c++ cargo lua luarocks nodejs npm python3-pip

echo "6. Installing Yazi (Terminal File Manager)"
curl -LO https://github.com/sxyazi/yazi/releases/latest/download/yazi-x86_64-unknown-linux-gnu.zip
unzip -o yazi-x86_64-unknown-linux-gnu.zip
mkdir -p ~/.local/bin
mv yazi-x86_64-unknown-linux-gnu/yazi ~/.local/bin/
mv yazi-x86_64-unknown-linux-gnu/ya ~/.local/bin/
rm -rf yazi-x86_64-unknown-linux-gnu*

echo "7. Finalizing Shell & Tiling"
sudo systemctl enable --now swayosd-lib.service || true
sudo chsh -s $(which zsh) $(whoami)
pip install autotiling --user --break-system-packages

echo "--- Core Setup Complete ---"
echo "Next Steps:"
echo "1. Run './setup_links.sh' to deploy configs"
echo "2. Run './scripts/install_fonts.sh'"
echo "3. Run './scripts/install_cursors.sh'"
echo "4. Run './scripts/install_icons.sh'"
echo "5. Run 'sudo ./scripts/setup-sddm-theme.sh'"
echo "6. NVIDIA Users (Choose one):"
echo "   - Always NVIDIA: './scripts/fix-sway-nvidia.sh'"
echo "   - Hybrid Mode:   './scripts/setup-hybrid-graphics.sh'"
echo "7. Reboot your system"