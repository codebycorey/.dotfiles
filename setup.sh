#!/usr/bin/env bash
# set -e  # Disabled to allow script to continue on errors

echo "Starting setup..."
echo "OS Type: $OSTYPE"

echo "Setting up required folders..."
# Create main project directories
mkdir -pv "$HOME/projects"

# Optionally create personal and experiments directories
mkdir -pv "$HOME/projects/personal"
mkdir -pv "$HOME/projects/experiments"

# Create archives and docs directories
mkdir -pv "$HOME/archives"
mkdir -pv "$HOME/docs"

# Run OS-specific setup
if [[ "$OSTYPE" == "darwin"* ]]; then
  echo "Setting up macOS-specific configurations..."
  if ! source ./macos/macos.sh; then
    echo "[WARNING] macOS-specific setup failed, continuing..." >&2
  fi
fi

# Apply main dotfiles
if ! ./dotfiles.sh "$@"; then
  echo "[WARNING] Main dotfiles setup failed, continuing..." >&2
fi

# Apply personal dotfiles if personal/home exists and is non-empty
if [ -d "personal/home" ] && [ "$(ls -A personal/home 2>/dev/null)" ]; then
  echo "Applying personal dotfiles..."
  if ! ./dotfiles.sh personal "$@"; then
    echo "[WARNING] Personal dotfiles setup failed, continuing..." >&2
  fi
fi

# Apply alt dotfiles if alt/home exists and is non-empty
if [ -d "alt/home" ] && [ "$(ls -A alt/home 2>/dev/null)" ]; then
  echo "Applying alt dotfiles..."
  if ! ./dotfiles.sh alt "$@"; then
    echo "[WARNING] Alt dotfiles setup failed, continuing..." >&2
  fi
fi
