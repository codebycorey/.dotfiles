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

# MACOS
if [[ $OSTYPE == "darwin"* ]]; then
    # Install fonts
    cp -Rf $HOME/.fonts/* $HOME/Library/Fonts
fi

unset STOW_FOLDERS
