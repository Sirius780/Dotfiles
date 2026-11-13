#!/usr/bin/env bash

# Stops the script if any of the downloads fail
set -e

echo "Installing system packages..."

# The list of packages including the ones in the cachyos repos
PACKAGES=(

    # System packages
    "base-devel"
    "git"
    "paru"
    "vim"

    # Terminal apps
    "eza"
    "fd"
    "fish"
    "fisher"
    "fzf"
    "ttf-0xproto-nerd"
    "zoxide"

    # User apps
    "discord"
    "faugus-launcher"
    "mpv"
    "proton-vpn-gtk-app"
    "qbittorrent"
    "qview"
    "steam"
    "thunar"
    "zen-browser-bin"

    # Miscellaneous
    "matugen"
    "proton-cachyos-slr"
    "qpwgraph"
)

# Synchronizes repositories and installs packages
sudo pacman -Sy "${PACKAGES[@]}"
echo""
