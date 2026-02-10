#!/usr/bin/env bash
# set -e  # Disabled to allow script to continue on errors

echo "Starting setup..."
echo "OS Type: $OSTYPE"

# Create main project directories
echo "Setting up required folders..."
mkdir -pv "$HOME/projects"
mkdir -pv "$HOME/projects/personal"
mkdir -pv "$HOME/projects/experiments"
mkdir -pv "$HOME/archives"
mkdir -pv "$HOME/docs"

# Clone nvim config if not present
if [ ! -d "$HOME/.config/nvim" ]; then
    echo "Cloning vinevim to ~/.config/nvim..."
    git clone git@github.com:codebycorey/vinevim.git "$HOME/.config/nvim" || \
        echo "[WARNING] Failed to clone vinevim, skipping..." >&2
fi

# Run OS-specific setup
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Setting up macOS-specific configurations..."
    if ! source ./macos/macos.sh; then
        echo "[WARNING] macOS-specific setup failed, continuing..." >&2
    fi
fi

# Apply dotfiles
if ! ./dotfiles.sh "$@"; then
    echo "[WARNING] Dotfiles setup failed, continuing..." >&2
fi

# Ensure Claude Code hook scripts are executable
if [ -d "$HOME/.claude/hooks" ]; then
    chmod +x "$HOME/.claude/hooks/"*.sh 2>/dev/null || true
fi
