#!/usr/bin/env bash
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config"
ICONS_DIR="$HOME/.icons"

echo "Initializing System Symlinks"
mkdir -p "$CONFIG_DIR"
mkdir -p "$ICONS_DIR"

link_file() {
    local src="$1"
    local dst="$2"
    
    if [ -e "$dst" ] && [ ! -L "$dst" ]; then
        echo "[Backup] Moving $(basename "$dst") to $(basename "$dst").bak"
        mv "$dst" "$dst.bak"
    fi
    
    mkdir -p "$(dirname "$dst")"
    ln -sfn "$src" "$dst"
    echo "[Linked] $dst"
}

echo "Cleaning broken symlinks..."
find "$CONFIG_DIR" -maxdepth 1 -xtype l -delete 2>/dev/null || true

echo "Deploying .config..."
for item in "$DOTFILES_DIR"/.config/*; do
    [ -e "$item" ] || continue
    link_file "$item" "$CONFIG_DIR/$(basename "$item")"
done


echo "Deploying .local/bin..."
mkdir -p "$HOME/.local/bin"
if [ -d "$DOTFILES_DIR/.local/bin" ]; then
    for file in "$DOTFILES_DIR"/.local/bin/*; do
        [ -e "$file" ] || continue
        link_file "$file" "$HOME/.local/bin/$(basename "$file")"
    done
fi

echo "Deploying scripts..."
if [ -d "$DOTFILES_DIR/scripts" ]; then
    for file in "$DOTFILES_DIR/scripts"/*; do
        [ -f "$file" ] || continue
        link_file "$file" "$HOME/.local/bin/$(basename "$file")"
    done
fi

echo "Deploying shell config..."
link_file "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
[ -f "$DOTFILES_DIR/.p10k.zsh" ] && link_file "$DOTFILES_DIR/.p10k.zsh" "$HOME/.p10k.zsh"

echo "Done"