#!/usr/bin/env bash

# Stops the script if it fails
set -e

# Just in case we create the folder again
sudo mkdir -p /usr/share/sysc-greet/themes

# The -p flag is for security reasons
echo "$USER ALL=(ALL) NOPASSWD: $(which cp) -P $HOME/.cache/matugen/sysc-greet.toml /usr/share/sysc-greet/themes/matugen.toml" | sudo tee /etc/sudoers.d/sysc-greeter > /dev/null
sudo chmod 440 /etc/sudoers.d/sysc-greeter
