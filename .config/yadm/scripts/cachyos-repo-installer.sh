#!/usr/bin/env bash

# Stops the script if it fails
set -e

# Imports and signs the keys
sudo pacman-key --recv-keys F3B607488DB35A47 --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key F3B607488DB35A47

# Downloads and installs the packages that contains the repos
sudo pacman -U 'https://mirror.cachyos.org/repo/x86_64/cachyos/cachyos-keyring-20240331-1-any.pkg.tar.zst' \
'https://mirror.cachyos.org/repo/x86_64/cachyos/cachyos-mirrorlist-27-1-any.pkg.tar.zst' \
'https://mirror.cachyos.org/repo/x86_64/cachyos/cachyos-v3-mirrorlist-27-1-any.pkg.tar.zst' \
'https://mirror.cachyos.org/repo/x86_64/cachyos/cachyos-v4-mirrorlist-27-1-any.pkg.tar.zst' \

# Checks if the cachyos repos are already in /etc/pacman.conf
if grep -qF "[cachyos]" /etc/pacman.conf; then
    echo "The cachyos repos are already installed"
    exit 0
fi

# This adds the repos just above #[core-testing]
sudo sed -i '/^#\[core-testing\]/i \
[cachyos-v3]\
Include = /etc/pacman.d/cachyos-v3-mirrorlist\
\
[cachyos-core-v3]\
Include = /etc/pacman.d/cachyos-v3-mirrorlist\
\
[cachyos-extra-v3]\
Include = /etc/pacman.d/cachyos-v3-mirrorlist\
\
[cachyos]\
Include = /etc/pacman.d/cachyos-mirrorlist\
' /etc/pacman.conf

# Install all the new package versions
sudo pacman -Syu

echo "Cachyos repos are now installed and enabled"
