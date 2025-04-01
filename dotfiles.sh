#!/usr/bin/env bash
set -e

# Setup dotfiles
STOW_DIR=${DOTFILES:-"$HOME/.dotfiles"}
TARGET_DIR=$HOME

# Parse arguments
DRY_RUN=""
MODE="install"

if [[ "$1" == "--dry-run" || "$1" == "-n" ]]; then
    DRY_RUN="--no -v"
    echo "DRY RUN MODE - No changes will be made"
    shift
fi

if [[ "$1" == "--clean" || "$1" == "-c" ]]; then
    MODE="clean"
    echo "CLEAN MODE - Removing dotfile symlinks"
fi

# Define dotfile packages
DOTFILE_PACKAGES=(
    "aerospace"
    "alt"
    "bin"
    "kitty"
    "neovim"
    "starship"
    "tmux"
    "vim"
    "wezterm"
    "yabai"
    "zsh"
)

# Check if stow is installed
if ! command -v stow &> /dev/null; then
    echo "Error: stow is not installed. Please install it first."
    exit 1
fi

# Ensure STOW_DIR exists
if [ ! -d "$STOW_DIR" ]; then
    echo "Error: Dotfiles directory $STOW_DIR does not exist."
    exit 1
fi

# Change to the dotfiles directory
cd "$STOW_DIR" || { echo "Error: Could not change to directory $STOW_DIR"; exit 1; }

echo "Working with dotfiles from $STOW_DIR to $TARGET_DIR"
for package in "${DOTFILE_PACKAGES[@]}"; do
    if [ -d "$STOW_DIR/$package" ]; then
        if [[ "$MODE" == "clean" ]]; then
            echo "Removing symlinks for $package"
            stow -D $DRY_RUN "$package" -t "$TARGET_DIR" || echo "Warning: Failed to unstow $package"
        else
            echo "Symlinking $package"
            stow -D $DRY_RUN "$package" -t "$TARGET_DIR" || echo "Warning: Failed to unstow $package"
            stow $DRY_RUN "$package" -t "$TARGET_DIR" || echo "Error: Failed to stow $package"
        fi
    else
        echo "Warning: Package $package not found, skipping"
    fi
done

echo "Operation complete"

