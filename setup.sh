#!/usr/bin/env bash

# Log failures with line numbers (doesn't abort like set -e)
trap 'echo "[ERROR] Failed at line $LINENO: $BASH_COMMAND" >&2' ERR

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

# Set up git identity if not configured
if [ ! -f "$HOME/.gitconfig.local" ]; then
    echo "No ~/.gitconfig.local found. Setting up git identity..."
    read -p "Git name: " git_name
    read -p "Git email: " git_email
    if [ -n "$git_name" ] && [ -n "$git_email" ]; then
        cat > "$HOME/.gitconfig.local" <<EOF
[user]
    name = $git_name
    email = $git_email
EOF
        echo "Created ~/.gitconfig.local"
    else
        echo "[WARNING] Skipped git identity setup (empty input)" >&2
    fi
fi

# Ensure all custom scripts and hooks are executable
chmod +x "$HOME/.local/bin/"* 2>/dev/null || true
if [ -d "$HOME/.claude/hooks" ]; then
    chmod +x "$HOME/.claude/hooks/"*.sh 2>/dev/null || true
fi

# Install TPM plugins if TPM is available
TPM_INSTALL="/opt/homebrew/opt/tpm/share/tpm/bin/install_plugins"
if [ -x "$TPM_INSTALL" ]; then
    echo "Installing tmux plugins via TPM..."
    "$TPM_INSTALL" || echo "[WARNING] TPM plugin install failed, continuing..." >&2
fi
