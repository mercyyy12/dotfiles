#!/usr/bin/env bash
# Hybrid Graphics Setup for Legion Slim (Intel + NVIDIA)

# 1. Create the nvrun helper script
echo "Creating /usr/local/bin/nvrun..."
sudo tee /usr/local/bin/nvrun > /dev/null <<EOF
#!/usr/bin/env bash
export __NV_PRIME_RENDER_OFFLOAD=1
export __GLX_VENDOR_LIBRARY_NAME=nvidia
export __VK_LAYER_NV_optimus=NVIDIA_only
exec "\$@"
EOF
sudo chmod +x /usr/local/bin/nvrun

# 2. Create the Sway Hybrid wrapper
echo "Creating /usr/local/bin/sway-hybrid..."
sudo tee /usr/local/bin/sway-hybrid > /dev/null <<EOF
#!/usr/bin/env bash
# Relaxed hybrid mode (Let Sway decide the primary GPU)
export WLR_NO_HARDWARE_CURSORS=1

# Essential Wayland variables
export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=sway
export MOZ_ENABLE_WAYLAND=1
export _JAVA_AWT_WM_NONREPARENTING=1

exec sway --unsupported-gpu "\$@"
EOF
sudo chmod +x /usr/local/bin/sway-hybrid

# 3. Create the Wayland session entry
echo "Creating /usr/share/wayland-sessions/sway-hybrid.desktop..."
sudo tee /usr/share/wayland-sessions/sway-hybrid.desktop > /dev/null <<EOF
[Desktop Entry]
Name=Sway (Hybrid)
Comment=Intel for Desktop, NVIDIA for Power
Exec=/usr/local/bin/sway-hybrid
Type=Application
DesktopNames=sway
Keywords=tiling;wm;windowmanager;window;manager;wayland;
EOF

echo "Hybrid Graphics Setup Complete!"
echo "To use NVIDIA for a specific app, run: nvrun <app-name>"
echo "Example: nvrun steam"
echo ""
echo "Note: Please logout and select 'Sway (Hybrid)' from your login screen."
