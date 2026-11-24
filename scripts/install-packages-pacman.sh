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
    "yazi"
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
    "xdg-terminal-exec"

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
    "qtcurve"
    "stow"
    "ttf-jetbrains-mono-nerd"
    "vimix-cursors"


)

# Synchronizes repositories and installs packages
sudo pacman -Sy "${PACKAGES[@]}"
echo""
