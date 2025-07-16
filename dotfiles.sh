#!/usr/bin/env bash
set -e

REPO_DIR=${DOTFILES:-"$HOME/.dotfiles"}
STOW_DIR="$REPO_DIR/home"
TARGET_DIR="$HOME"

# Parse arguments
DRY_RUN=""
MODE="install"

if [[ "$1" == "--dry-run" || "$1" == "-n" ]]; then
    DRY_RUN="--no"
    echo "DRY RUN MODE - No changes will be made"
    shift
fi

if [[ "$1" == "--clean" || "$1" == "-c" ]]; then
    MODE="clean"
    echo "CLEAN MODE - Removing dotfile symlinks"
fi

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

cd "$STOW_DIR"

echo "Working with dotfiles from $STOW_DIR to $TARGET_DIR"

if [[ "$MODE" == "clean" ]]; then
    stow -D -v $DRY_RUN -t "$TARGET_DIR" -d "$STOW_DIR" .
    echo "Clean operation complete"
    exit 0
fi

stow -R -v $DRY_RUN -t "$TARGET_DIR" -d "$STOW_DIR" .

echo "Operation complete"
