#!/usr/bin/env bash

# Stops the script if it fails
set -e

# Checks if the line is already there and if not puts it in place
echo "Checking gnome-keyring..."
if ! grep -q "pam_gnome_keyring" /etc/pam.d/greetd; then
    sudo sed -i \
        -e '/^auth.*system-local-login/a auth       optional     pam_gnome_keyring.so' \
        -e '/^session.*system-local-login/a session    optional     pam_gnome_keyring.so auto_start' \
        /etc/pam.d/greetd
    echo "gnome-keyring auto login is now enabled"
    echo ""
fi
