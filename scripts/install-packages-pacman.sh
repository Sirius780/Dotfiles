#!/usr/bin/env bash

# Stops the script if any of the downloads fail
set -e

echo "Installing system packages..."

# The list of packages including the ones in the cachyos repos
PACKAGES=(

    # System packages
    "base-devel"
    "git"
    "fuzzel"
    "libsecret"
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
    "qpwgraph"
    "qview"
    "steam"
    "thunar"
    "zen-browser-bin"

    # Gaming
    "mangojuice"
    "proton-cachyos-slr"

    # Desktop
    "adw-gtk-theme"
    "cliphist"
    "fuzzel"
    "matugen"
    "niri"
    "qtcurve"
    "stow"
    "ttf-jetbrains-mono-nerd"

)

# Synchronizes repositories and installs packages
sudo pacman -Sy "${PACKAGES[@]}"
echo""
