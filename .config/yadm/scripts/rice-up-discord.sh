#!/usr/bin/env bash

# Stops the script if it fails
set -e

# instruction for the user
echo "Installing Vencord and Openasar"
echo "Please select your discord client location when prompted"

#installs verncord and Openasar
vencordinstallercli -install install-openasar -branch Stable

# just text
echo "Discord is now ready to use"
echo""
