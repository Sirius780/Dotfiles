#!/usr/bin/env bash

# Stops the scripts if it fails
set -e

# Gets the directory name
DIR="$(dirname "$(readlink -f "$0")")"

# Asks the user
echo ""
echo "This will install various packages and dotfiles replacing yours."
read -p "Are you sure you want to contiue? (Y/N): " ANSWER
echo ""

# The ! symbol makes the if work in reverse
if [[ ! "$ANSWER" =~ ^[yY]$ ]]; then

    # Exits the script without changing anything
    echo "The user has cancelled the installation..."
else
    # Executes all the scripts
    bash "$DIR/cachyos-repo-installer.sh"
    bash "$DIR/cachyos-kernel-installer.sh"
    bash "$DIR/ntsync.sh"
    bash "$DIR/install-packages-pacman.sh"
    bash "$DIR/install-packages-aur.sh"
    bash "$DIR/papirus-folders-setup.sh"
    bash "$DIR/rice-up-discord.sh"
    bash "$DIR/keyring-setup.sh"
    bash "$DIR/fish-setup.sh"
    bash "$DIR/sudo-feedback.sh"
    echo "If you are reading this, the installer worked"
    echo "Remember to run "tide configure" to configure fish to your likings"
fi
