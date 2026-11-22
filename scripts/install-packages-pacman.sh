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
    "mpv"
    "proton-vpn-gtk-app"
    "qbittorrent"
    "qpwgraph"
    "qview"
    "steam"
    "zen-browser-bin"

    # Explorer
    "ffmpegthumbnailer"
    "file-roller"
    "gvfs"
    "poppler-glib"
    "thunar"
    "thunar-archive-plugin"
    "thunar-volman"
    "tumbler"

    # Gaming
    "faugus-launcher"
    "mangojuice"
    "proton-cachyos-slr"
    "umu-launcher"

    # Desktop
    "adw-gtk-theme"
    "cliphist"
    "fuzzel"
    "matugen"
    "niri"
    "papirus-icon-theme"
    "qtcurve"
    "stow"
    "ttf-jetbrains-mono-nerd"


)

# Synchronizes repositories and installs packages
sudo pacman -Sy "${PACKAGES[@]}"
echo""
