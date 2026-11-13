#!/usr/bin/env bash

# Stops the script if any of the downloads fail
set -e

echo "Installing system packages..."

# The list of packages including the ones in the cachyos repos
PACKAGES=(
    "base-devel"
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
    "zoxide"
    "eza"
    "fish"
    "fisher"
    "fzf"
    "fd"
    "qview"
)

# Synchronizes repositories and installs packages
sudo pacman -Sy "${PACKAGES[@]}"
echo""
