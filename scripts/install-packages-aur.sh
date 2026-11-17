#!/usr/bin/env bash

# Stops the script if any of the downloads fail
set -e

echo "Installing AUR packages via paru..."

# AUR packages list
AUR_PACKAGES=(
    "ludusavi-bin"
    "sonora-bin"
    "vencord-installer"
    "vencord-hook"
)

# Install missing AUR packages automatically
paru -S --noconfirm --needed "${AUR_PACKAGES[@]}"
echo ""
