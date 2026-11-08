#!/usr/bin/env bash

# Stops the scripts if it fails
set -e

# Creates the necessary directory if it doesnt already exist
echo "Making sure the necessary directories exist..."
mkdir -p /boot/EFI/Linux
mkdir -p /etc/kernel

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
pacman -S --noconfirm linux-cachyos linux-cachyos-headers
echo "Kernel installed succesfully"

#2 Deletes the old kernel)
echo "Cleaning old kernel..."
pacman -Rns --noconfirm linux linux-headers 2>/dev/null || true
rm -f /etc/mkinitcpio.d/linux.preset
rm -f /boot/EFI/Linux/arch-linux.efi
echo "Old kernel cleaned"
echo ""
