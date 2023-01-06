#!/usr/bin/env bash

# Setup dotfiles
STOW_DIR=${DOTFILES:-"$HOME/.dotfiles"}
TARGET_DIR=$HOME

DEFAULT_STOW_FOLDERS=("alt" "bin" "cht-sh" "fonts" "kitty" "neovim" "starship" "tmux" "vim" "zsh" "yabai")
STOW_FOLDERS=("${STOW_FOLDERS[@]:-${DEFAULT_STOW_FOLDERS[@]}}")

pushd $STOW_DIR
for folder in ${STOW_FOLDERS[@]}
do
    echo "Symlinking $folder"
    stow -D $folder -t $TARGET_DIR
    stow $folder -t $TARGET_DIR
done
popd
