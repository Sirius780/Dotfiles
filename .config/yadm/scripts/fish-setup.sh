#!/usr/bin/env bash

# Stops the script if it fails
set -e

# instruction for the user
echo "Configuring Fish"
echo "Please select the options you most like when prompted"

#installs various fish plugins
fish -c "fisher install PatrickF1/fzf.fish"
fish -c "fisher install IlanCosman/tide@v6"

# just text
echo "fish is now fully configured"
echo""
