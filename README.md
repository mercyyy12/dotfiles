# Tokyo Night Desktop Environment
An optimized Sway environment.

This repository contains a curated, aesthetic-first configuration for Fedora, featuring a seamless Tokyo Night color scheme, hardware-accelerated terminal workflows, and unified system-wide styling.

---

## Quick Start (Clean Install)

### 1. Acquire the Repository
```bash
sudo dnf install git -y
git clone https://github.com/mercyyy12/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 2. Execute Installation
```bash
chmod +x install.sh setup_links.sh scripts/*.sh
./install.sh
./setup_links.sh
```

### 3. Finalize Assets
```bash
./scripts/install_fonts.sh
./scripts/install_cursors.sh
./scripts/install_icons.sh
sudo ./scripts/setup-sddm-theme.sh
```

---

## Core Stack
*   **Window Manager**: [Sway](https://swaywm.org/) (Wayland Native Tiling)
*   **Terminal**: [Kitty](https://sw.kovidgoyal.net/kitty/) (GPU Accelerated)
*   **Bar**: [Waybar](https://github.com/Alexays/Waybar) (Translucent Tokyo Night)
*   **Shell**: [ZSH](https://www.zsh.org/) + Powerlevel10k
*   **File Management**: [Thunar](https://docs.xfce.org/xfce/thunar/start) (GUI) & [Yazi](https://yazi-rs.github.io/) (Terminal)
*   **Navigation**: [Rofi-Wayland](https://github.com/lbonn/rofi-wayland)
*   **OSD**: [SwayOSD](https://github.com/ErikReider/SwayOSD) (Hardware Indicators)

---

## Essential Keybindings
Full documentation available in [KEYBINDINGS.md](KEYBINDINGS.md).

- **`Super + Return`**: Terminal
- **`Super + d`**: Application Launcher
- **`Super + n`**: File Manager
- **`Super + p`**: Power Menu
- **`Super + Shift + w`**: Cycle Wallpaper
- **`Super + f`**: Toggle Fullscreen
- **`Super + Shift + q`**: Close Window

---

## NVIDIA & Hybrid Graphics
This environment is optimized for NVIDIA/Hybrid hardware (Intel + NVIDIA).

### Option 1: Performance Mode (Always NVIDIA)
Use this if you are always plugged in or using an external monitor.
```bash
./scripts/fix-sway-nvidia.sh
```
*Select **Sway (NVIDIA)** at login.*

### Option 2: Hybrid Mode (Intel + NVIDIA Offload)
Recommended for laptops. Uses Intel for the desktop and NVIDIA only for specific apps.
```bash
./scripts/setup-hybrid-graphics.sh
```
*Select **Sway (Hybrid)** at login.*

**To run an app on NVIDIA in Hybrid Mode:**
```bash
nvrun <app-name>
```

---

## Wallpapers & Aesthetics
This repository uses high-quality compressed JPG previews for GitHub compatibility. 
**For the ultra-high-res 4K/8K PNG versions, feel free to open an issue or reach out!**


---

## Credits
This configuration is based on the excellent work by **[CodeOps HQ](https://github.com/CodeOpsHQ/dotfiles)**. 
Modified and customized to fit my specific hardware and aesthetic preferences.

---
*Maintained with a "maximize-to-core" philosophy.*
