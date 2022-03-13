#!/usr/bin/env bash

# Setup required folders
mkdir -pv $HOME/personal
mkdir -pv $HOME/work

# Setup dotfiles
STOW_FOLDERS=("zsh" "tmux" "starship" "bin" "fonts")
for folder in ${STOW_FOLDERS[@]}
do
    echo $folder
    stow -D $folder
    stow $folder
done

source ./scripts/starship.sh
source ./scripts/nvm.sh
source ./scripts/zsh-plugins.sh

# MAC(fonts): cp -Rf $DOTS_INSTALL_DIR/.fonts/* $HOME/Library/Fonts

unset STOW_FOLDERS
