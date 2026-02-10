#!/usr/bin/env bash
set -e

echo "==> Dotfiles Bootstrap"
echo "This script sets up a fresh macOS machine from scratch."
echo ""

# --- 1. Xcode Command Line Tools ---
if ! xcode-select -p &>/dev/null; then
    echo "==> Installing Xcode Command Line Tools..."
    xcode-select --install
    echo ""
    echo "Xcode CLI tools are installing. Please re-run this script when done."
    exit 0
fi
echo "==> Xcode CLI tools: OK"

# --- 2. Homebrew ---
if ! command -v brew &>/dev/null; then
    echo "==> Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Set up brew in current shell (architecture-aware)
    if [ "$(uname -m)" = "arm64" ]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        eval "$(/usr/local/bin/brew shellenv)"
    fi
fi
echo "==> Homebrew: OK"

# --- 3. Brew Bundle ---
REPO_DIR=${DOTFILES:-"$HOME/.dotfiles"}
BREWFILE="$REPO_DIR/macos/Brewfile"

if [ -f "$BREWFILE" ]; then
    echo "==> Installing packages from Brewfile..."
    brew bundle install --file="$BREWFILE"
else
    echo "[WARNING] Brewfile not found at $BREWFILE, skipping..." >&2
fi

# --- 4. Rust ---
if ! command -v rustup &>/dev/null; then
    echo "==> Installing Rust toolchain..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source "$HOME/.cargo/env"
fi
echo "==> Rust: OK"

# --- 5. Setup ---
echo "==> Running setup.sh..."
"$REPO_DIR/setup.sh"

echo ""
echo "==> Bootstrap complete! Open a new terminal to start."
