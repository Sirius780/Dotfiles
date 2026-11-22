#!/usr/bin/env bash

# Stops the script if it fails
set -e

# makes a sudo rule in sudoers
echo "$USER ALL=(ALL) NOPASSWD: $(which papirus-folders)" | sudo tee /etc/sudoers.d/papirus-folders
sudo chmod 440 /etc/sudoers.d/papirus-folders
