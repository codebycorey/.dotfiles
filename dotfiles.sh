#!/usr/bin/env bash
set -e

REPO_DIR=${DOTFILES:-"$HOME/.dotfiles"}
STOW_SUBFOLDER="home"
STOW_DIR="$REPO_DIR/$STOW_SUBFOLDER"
TARGET_DIR="$HOME"

# Parse arguments
DRY_RUN=""
MODE="install"

# Check for dry-run or clean flags (can be in any order)
while [[ "$1" =~ ^- ]]; do
    if [[ "$1" == "--dry-run" || "$1" == "-n" ]]; then
        DRY_RUN="--no"
        echo "DRY RUN MODE - No changes will be made"
        shift
    elif [[ "$1" == "--clean" || "$1" == "-c" ]]; then
        MODE="clean"
        echo "CLEAN MODE - Removing dotfile symlinks"
        shift
    elif [[ "$1" == "--help" || "$1" == "-h" ]]; then
        echo "Usage: $0 [--dry-run|-n] [--clean|-c] [alt|personal]"
        exit 0
    else
        echo "Unknown option: $1"
        echo "Usage: $0 [--dry-run|-n] [--clean|-c] [alt|personal]"
        exit 1
    fi
done

# If a positional argument remains, use it as the subfolder (e.g., alt or personal)
if [[ -n "$1" ]]; then
    STOW_SUBFOLDER="$1/home"
    STOW_DIR="$REPO_DIR/$STOW_SUBFOLDER"
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
