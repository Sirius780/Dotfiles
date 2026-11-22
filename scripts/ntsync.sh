#!/usr/bin/env bash

# Stops the script if it fails
set -e

# Enables NTsync kernel module
echo "Enabling NTsync..."
echo "ntsync" | sudo tee /etc/modules-load.d/ntsync.conf
echo "NTsync is now enabled"
echo ""
