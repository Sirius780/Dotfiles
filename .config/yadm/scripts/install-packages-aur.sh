#!/usr/bin/env bash

# Stops the script if it fails
set -e

echo "Installing AUR packages via paru..."

# AUR packages list
AUR_PACKAGES=(
    "ludusavi-bin"
    "sonora-bin"
)

# Install missing AUR packages automatically
paru -S --noconfirm --needed "${AUR_PACKAGES[@]}"
echo ""
