#!/usr/bin/env bash
# Script to create a dedicated Sway session for NVIDIA users.
set -e

echo "Creating Sway NVIDIA wrapper script..."
sudo tee /usr/local/bin/sway-nvidia > /dev/null <<EOF
#!/usr/bin/env bash
export WLR_NO_HARDWARE_CURSORS=1
export GBM_BACKEND=nvidia-drm
export __GLX_VENDOR_LIBRARY_NAME=nvidia
export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=sway
export MOZ_ENABLE_WAYLAND=1
export _JAVA_AWT_WM_NONREPARENTING=1

exec sway --unsupported-gpu "\$@"
EOF

sudo chmod +x /usr/local/bin/sway-nvidia

echo "Creating Wayland session entry..."
sudo tee /usr/share/wayland-sessions/sway-nvidia.desktop > /dev/null <<EOF
[Desktop Entry]
Name=Sway (NVIDIA)
Comment=SirCmpwn's Wayland window manager (NVIDIA Patch)
Exec=/usr/local/bin/sway-nvidia
Type=Application
DesktopNames=sway
Keywords=tiling;wm;windowmanager;window;manager;wayland;
EOF

echo "Success! You can now select 'Sway (NVIDIA)' from your login manager."
