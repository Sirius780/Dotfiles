#!/usr/bin/env bash

# Stops the scripts if it fails
set -e

echo ""
echo "Enabling asteriks in sudo"

# Starts a subshell with root to create a file with the desired rule
sudo sh -c "echo 'Defaults:$(whoami) pwfeedback' > /etc/sudoers.d/90-sudo-asterisks"

# Applies the requires permissions to the file
sudo chmod 0440 /etc/sudoers.d/90-sudo-asterisks

# Deletes the sudo cache
sudo -K
echo ""
echo "Asterisk are now enabled in sudo"
