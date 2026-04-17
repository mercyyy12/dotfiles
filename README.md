# 🌌 Vivid Glass: The Premium Sway Experience

Welcome to **Vivid Glass**, a state-of-the-art, pixel-perfect tiling environment built from the ground up for **Fedora 43+**. 

This environment is designed for power users who want a beautiful, "Vivid Glass" aesthetic combined with the high-performance dynamic tiling of Sway. It features a custom Tokyo Night color scheme, a translucent Waybar, and a highly polished Rofi launcher.

---

## 🚀 Complete Beginner Installation (Step-by-Step)

Follow these exact steps to transform your fresh Fedora system into the Vivid Glass environment.

### 1. Prepare and Clone
Open your terminal and run these commands to download the configuration files:
```bash
sudo dnf install git -y
git clone https://github.com/your-username/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 2. Run the Installation Wizard
This will install all core applications (Sway, Waybar, Rofi), dependencies (Python, Polkit), and the Kitty terminal.
```bash
chmod +x install.sh
./install.sh
```

### 3. Deploy Configurations
Now, link the files into your system configuration folders:
```bash
chmod +x setup_links.sh
./setup_links.sh
```

### 4. Install Fonts & Icons
Run this to ensure all your status bar icons and menu symbols render correctly:
```bash
chmod +x scripts/install_fonts.sh
./scripts/install_fonts.sh
```

### 5. Finalize & Log In
1.  **NVIDIA Users**: If you have an NVIDIA GPU, run `./scripts/fix-sway-nvidia.sh`.
2.  **Reboot**: Restart your computer.
3.  **Select Sway**: At the login screen, click the **Gear Icon** (usually bottom right) and select **Sway** before entering your password.

---

## ⌨️ How to Use (Essential Shortcuts)
For a full list of commands, see the [KEYBINDINGS.md](KEYBINDINGS.md) file.
- **`Super + Enter`**: Open Kitty Terminal
- **`Super + d`**: Open App Launcher (Rofi)
- **`Super + b`**: Open Web Browser (Brave)
- **`Super + p`**: Open Power/Session Menu
- **`Super + Shift + q`**: Close focused window
- **`Super + f`**: Toggle Fullscreen

---

## 🛠️ Included Master Tools
*   **Terminal**: [Kitty](https://kitty.org/) (High-performance, GPU-accelerated)
*   **File Manager**: [Thunar](https://docs.xfce.org/xfce/thunar/start) (GUI) and [Yazi](https://yazi-rs.github.io/) (Terminal)
*   **Launcher**: [Rofi-Wayland](https://github.com/lbonn/rofi-wayland)
*   **Bar**: [Waybar](https://github.com/Alexays/Waybar)
*   **OSD**: [SwayOSD](https://github.com/ErikReider/SwayOSD) (Visual volume/brightness indicators)
*   **Shell**: [ZSH](https://www.zsh.org/) with Powerlevel10k

---
*Built with focus and precision for the Fedora ecosystem.*
