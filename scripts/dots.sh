#!/usr/bin/env bash

# Setup dotfiles

STOW_DIR=${DOTS_HOME:-"$HOME/.dotfiles"}
TARGET_DIR=$HOME
STOW_FOLDERS=("zsh" "tmux" "bin" "fonts" "cheatsheet" "starship")
for folder in ${STOW_FOLDERS[@]}
do
    echo $folder
    stow -D $folder -d $STOW_DIR -t $TARGET_DIR
    stow $folder -d $STOW_DIR -t $TARGET_DIR
done

unset STOW_DIR
unset TARGET_DIR
unset STOW_FOLDERS
