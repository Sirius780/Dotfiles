#!/usr/bin/env bash

# Stops the scripts if it fails
set -e

# Replaces the default shell in ghostty with Fish
if ! grep -q "^command\s*=" "$HOME/.config/ghostty/config"; then
    echo "command = /usr/bin/fish" >> "$HOME/.config/ghostty/config"
else
    sed -i 's|^command\s*=.*|command = /usr/bin/fish|' "$HOME/.config/ghostty/config"
fi

echo "Enabling fish in ghostty..."
echo ""
