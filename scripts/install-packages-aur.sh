#!/usr/bin/env bash

# Stops the script if any of the downloads fail
set -e

echo "Installing AUR packages via paru..."

# AUR packages list
AUR_PACKAGES=(
    "ludusavi-bin"
    "cmd-polkit-git"
    "sonora-bin"
    "pinapp"
    "appimage-thumbnailer"
    "freesmlauncher-bin"
    "jre21-temurin"
    "sysc-greet"
    "matuwall-bin"
    "vencord-installer"
    "vencord-hook"
)

# Install missing AUR packages automatically
paru -S "${AUR_PACKAGES[@]}"
echo ""
