#!/usr/bin/env bash

# Stops the script if any of the scripts fails
set -e

echo "Installing system packages..."

# The list of packages including the ones in the cachyos repos
PACKAGES=(
    "steam"
    "discord"
    "faugus-launcher"
    "proton-vpn-gtk-app"
    "vim"
    "ghostty"
    "qbittorrent"
    "mpv"
    "qpwgraph"
    "filelight"
    "zen-browser-bin"
    "paru"
)

# Synchronizes repositories and installs packages
sudo pacman -Sy "${PACKAGES[@]}"
echo""
