#!/usr/bin/env bash
# set -e  # Disabled to allow script to continue on errors

echo "Starting setup..."
echo "OS Type: $OSTYPE"

REPO_DIR=${DOTFILES:-"$HOME/.dotfiles"}

echo "Setting up required folders..."
# Create main project directories
mkdir -pv "$HOME/projects"

# Optionally create personal and experiments directories
mkdir -pv "$HOME/projects/personal"
mkdir -pv "$HOME/projects/experiments"

# Create archives and docs directories
mkdir -pv "$HOME/archives"
mkdir -pv "$HOME/docs"

# Clone nvim config if not present
if [ ! -d "$HOME/.config/nvim" ]; then
    echo "Cloning vinevim to ~/.config/nvim..."
    git clone git@github.com:codebycorey/vinevim.git "$HOME/.config/nvim" || \
        echo "[WARNING] Failed to clone vinevim, skipping..." >&2
fi

# Clone private overlays into local/ (silently skip if not accessible)
mkdir -p "$REPO_DIR/local"

if [ ! -d "$REPO_DIR/local/personal" ]; then
    git clone git@github.com:codebycorey/.dotfiles-personal.git "$REPO_DIR/local/personal" 2>/dev/null || true
fi

if [ ! -d "$REPO_DIR/local/alt" ]; then
    git clone git@github.com:codebycorey/.dotfiles-alt.git "$REPO_DIR/local/alt" 2>/dev/null || true
fi

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

# Apply personal dotfiles if local/personal/home exists and is non-empty
if [ -d "$REPO_DIR/local/personal/home" ] && [ "$(ls -A "$REPO_DIR/local/personal/home" 2>/dev/null)" ]; then
    echo "Applying personal dotfiles..."
    if ! ./dotfiles.sh local/personal "$@"; then
        echo "[WARNING] Personal dotfiles setup failed, continuing..." >&2
    fi
fi

# Apply alt dotfiles if local/alt/home exists and is non-empty
if [ -d "$REPO_DIR/local/alt/home" ] && [ "$(ls -A "$REPO_DIR/local/alt/home" 2>/dev/null)" ]; then
    echo "Applying alt dotfiles..."
    if ! ./dotfiles.sh local/alt "$@"; then
        echo "[WARNING] Alt dotfiles setup failed, continuing..." >&2
    fi
fi

# Ensure Claude Code hook scripts are executable
if [ -d "$HOME/.claude/hooks" ]; then
    chmod +x "$HOME/.claude/hooks/"*.sh 2>/dev/null || true
fi
