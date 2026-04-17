# System Keybindings

This document provides a comprehensive list of all keyboard shortcuts configured in the system.

## Window Manager (Sway)

The main modifier key (Mod4) is the Super/Windows key.

### Basic System Operations
* Super + Return : Open Kitty Terminal
* Super + d : Open Application Launcher
* Super + p : Open Power Menu
* Super + Shift + q : Close focused window
* Super + f1 : Lock Screen
* Super + Shift + c : Reload Sway Configuration
* Super + Shift + e : Exit Sway

### Applications & Utilities
* Super + n : Open Thunar File Manager
* Super + o : Open Brave Browser
* Super + Shift + p : Open Window Switcher
* Super + Shift + b : Toggle Waybar Visibility
* Super + Shift + m : Toggle Notification Center
* Super + Shift + n : Open WiFi Menu
* Super + Shift + f : Open File Finder
* Super + Shift + v : Open Clipboard History
* Super + Shift + t : Toggle Night Light

### Screenshots
* Print Screen : Take a full screenshot
* Super + Print Screen : Select an area to screenshot and save to file
* Super + Shift + Print Screen : Select an area to screenshot and copy to clipboard

### Window Focus & Movement
* Super + Left, Right, Up, Down : Change focus to the adjacent window
* Super + h, j, k, l : Change focus to the adjacent window (Vim style)
* Super + Shift + Left, Right, Up, Down : Move the focused window
* Super + Shift + h, j, k, l : Move the focused window (Vim style)

### Layout & Sizing
* Super + b : Split horizontally
* Super + v : Split vertically
* Super + s : Switch to stacking layout
* Super + w : Switch to tabbed layout
* Super + e : Toggle split layout
* Super + f : Toggle fullscreen mode
* Super + Shift + Space : Toggle window floating mode
* Super + Space : Swap focus between tiling and floating windows
* Super + a : Focus parent container
* Super + r : Enter resize mode (Use arrow keys to resize, Escape or Return to exit)

### Workspaces
* Super + 1 through 0 : Switch to workspace 1 through 10
* Super + Shift + 1 through 0 : Move focused window to workspace 1 through 10

### Scratchpad
* Super + Shift + Minus : Move focused window to scratchpad
* Super + Minus : Show or cycle through scratchpad windows

### Hardware Controls
* Volume Up : Increase Volume
* Volume Down : Decrease Volume
* Mute : Mute Audio
* Mic Mute : Mute Microphone
* Brightness Up : Increase Screen Brightness
* Brightness Down : Decrease Screen Brightness
* Super + F9 : Reset screen rotation
* Super + Ctrl + F9 : Rotate screen 90 degrees
* Super + Shift + F9 : Rotate screen 180 degrees

## Terminal Multiplexer (Tmux)

The prefix key for Tmux commands is Ctrl + Space.

### Sessions and Windows
* Ctrl + Space, then r : Reload Tmux Configuration
* Ctrl + Space, then c : Create a new window
* Shift + Left or Right Arrow : Switch to previous or next window (No prefix required)
* Alt + Shift + H or L : Switch to previous or next window (No prefix required)

### Panes
* Ctrl + Space, then " : Split window vertically
* Ctrl + Space, then % : Split window horizontally
* Ctrl + Space, then h, j, k, l : Select pane based on direction

### Copy Mode
* Ctrl + Space, then [ : Enter Copy Mode
* v : Begin selection in Copy Mode
* Ctrl + v : Toggle rectangle selection in Copy Mode
* y : Copy selection and exit Copy Mode

## Terminal (Kitty)

These commands manage the Kitty terminal emulator directly.

* Ctrl + Shift + c : Copy to clipboard
* Ctrl + Shift + v : Paste from clipboard
* Ctrl + Shift + n : Open a new Kitty OS window
* Ctrl + Shift + Enter : Open a new Kitty pane
* Ctrl + Shift + w : Close the current Kitty window or pane
* Ctrl + Shift + ] : Switch to next Kitty pane
* Ctrl + Shift + [ : Switch to previous Kitty pane
