#!/usr/bin/env bash

# Stops the scripts if it fails
set -e

# Creates the necessary directory if it doesnt already exist
echo "Making sure the necessary directories exist..."
sudo mkdir -p /boot/EFI/Linux
sudo mkdir -p /etc/kernel

# Writes the system info into /etc/kernel/cmdline
if [ ! -s /etc/kernel/cmdline ]; then
    echo "Creating /etc/kernel/cmdline..."
    ROOT_UUID=$(findmnt -n -o UUID /)
    echo "root=UUID=${ROOT_UUID} rw rootflags=subvol=@ loglevel=3 quiet" > /etc/kernel/cmdline
fi

# Injects the config in the necessary file
echo "Configuring mkinitcpio for the new kernel..."
sudo tee /etc/mkinitcpio.d/linux-cachyos.preset > /dev/null << 'EOF'
ALL_kver="/boot/vmlinuz-linux-cachyos"
PRESETS=('default')
default_uki="/boot/EFI/Linux/arch-linux-cachyos.efi"
EOF

# Installs the new kernel
echo "Installing the cachyos kernel..."
sudo pacman -S --noconfirm linux-cachyos linux-cachyos-headers
echo "Kernel installed succesfully"

#2 Deletes the old kernel)
echo "Cleaning old kernel..."
sudo pacman -Rns --noconfirm linux 2>/dev/null || true
sudo pacman -Rns --noconfirm linux-headers 2>/dev/null || true
sudo rm -f /etc/mkinitcpio.d/linux.preset
sudo rm -f /boot/EFI/Linux/arch-linux.efi
echo "Old kernel cleaned"
echo ""
