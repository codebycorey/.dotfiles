#!/usr/bin/env bash

# Setup required folders
mkdir -pv $HOME/personal
mkdir -pv $HOME/work

source ./install-dots

source ./scripts/starship.sh
source ./scripts/nvm.sh
source ./scripts/zsh-plugins.sh

# MACOS
if [[ $OSTYPE == "darwin"* ]]; then
    # Install fonts
    cp -Rf $HOME/.fonts/* $HOME/Library/Fonts
fi
