#!/usr/bin/env bash
# Script to finalize SDDM theme and NVIDIA Early KMS setup.
# Run this with sudo.

set -e

echo "Installing SDDM theme dependencies (Qt5 and Qt6 compatibility)..."
# Fedora 43 uses Qt6 greeter, so we need both or compatibility layers
dnf install -y qt5-qtgraphicaleffects qt5-qtquickcontrols2 qt5-qtsvg \
               qt6-qt5compat qt6-qtdeclarative qt6-qtsvg qt6-qtvirtualkeyboard

echo "Installing Tokyo Night SDDM theme..."
THEME_DIR="/usr/share/sddm/themes/tokyo-night-sddm"
if [ ! -d "$THEME_DIR" ]; then
    git clone https://github.com/rototrash/tokyo-night-sddm.git "$THEME_DIR"
    rm -rf "$THEME_DIR/.git" "$THEME_DIR/README.md" "$THEME_DIR/LICENSE" "$THEME_DIR/COPYING" "$THEME_DIR/Previews"
fi

echo "Applying custom Hyprlock-style layout..."
cp /home/init0/dotfiles/scripts/assets/sddm-custom-greeter.qml "$THEME_DIR/Main.qml"

echo "Applying SDDM theme configuration..."
mkdir -p /etc/sddm.conf.d
cat <<EOF > /etc/sddm.conf.d/theme.conf
[Theme]
Current=tokyo-night-sddm
EOF

echo "Applying SDDM NVIDIA greeter fix..."
cat <<EOF > /etc/sddm.conf.d/nvidia-greeter.conf
[Wayland]
CompositorCommand=/usr/libexec/sddm-compositor-sway --unsupported-gpu

[General]
GreeterEnvironment=QT_WAYLAND_SHELL_INTEGRATION=xdg-shell,WLR_NO_HARDWARE_CURSORS=1,GBM_BACKEND=nvidia-drm,__GLX_VENDOR_LIBRARY_NAME=nvidia,QT_QPA_PLATFORM=wayland,WLR_DRM_NO_ATOMIC=1
EOF

# echo "Setting up SDDM autologin..."
# cat <<EOF > /etc/sddm.conf.d/autologin.conf
# [Autologin]
# User=$(logname)
# Session=sway
# EOF

echo "Setting up Early KMS for NVIDIA..."
cat <<EOF > /etc/dracut.conf.d/nvidia.conf
force_drivers+=" nvidia nvidia_modeset nvidia_uvm nvidia_drm "
EOF

echo "Rebuilding initramfs (this may take a minute)..."
dracut -f

echo "Ensuring wallpaper sync script is in place..."
cp /home/init0/dotfiles/scripts/update-sddm-wallpaper /usr/local/bin/update-sddm-wallpaper
chmod +x /usr/local/bin/update-sddm-wallpaper

echo "Setting up sudoers rule for wallpaper sync..."
echo "$USER ALL=(ALL) NOPASSWD: /usr/local/bin/update-sddm-wallpaper" > /etc/sudoers.d/sddm-wallpaper
chmod 440 /etc/sudoers.d/sddm-wallpaper

echo "Setup complete! Please reboot to see the changes."
