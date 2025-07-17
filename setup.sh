#!/usr/bin/env bash
set -e

# Run OS-specific setup
if [[ "$OSTYPE" == "darwin"* ]]; then
  echo "Setting up macOS-specific configurations..."
  source ./macos/macos.sh
fi

# Apply main dotfiles
./dotfiles.sh "$@"

# Apply personal dotfiles if personal/home exists and is non-empty
if [ -d "personal/home" ] && [ "$(ls -A personal/home 2>/dev/null)" ]; then
  echo "Applying personal dotfiles..."
  ./dotfiles.sh personal "$@"
fi

# Apply alt dotfiles if alt/home exists and is non-empty
if [ -d "alt/home" ] && [ "$(ls -A alt/home 2>/dev/null)" ]; then
  echo "Applying alt dotfiles..."
  ./dotfiles.sh alt "$@"
fi
