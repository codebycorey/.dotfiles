#!/usr/bin/env bash

# xcode-select --install
# sudo xcodebuild -license accept

if [[ ! -s "$HOME/.brew/bin/brew" ]]; then
    mkdir -p "$HOME/.brew"
    git clone https://github.com/Homebrew/brew --depth 1 "$HOME/.brew"

    eval "$($HOME/.brew/bin/brew shellenv)"
    brew update --force --quiet
    chmod -R go-w "$(brew --prefix)/share/zsh"
fi

brew install stow git fzf bash golang tmux neovim lazygit ripgrep fd
brew install alfred iterm2 karabiner-elements keycastr --cask

# Setup required folders
mkdir -pv $HOME/personal
mkdir -pv $HOME/work

source ${BASH_SOURCE%/*}/starship.sh
source ${BASH_SOURCE%/*}/nvm.sh
source ${BASH_SOURCE%/*}/zsh-plugins.sh
source ${BASH_SOURCE%/*}/rust.sh

# Notes and TODOS Section
## Streaming
### brew install keycastr --cask (Display keys pressed on screen)
### Cursor Pro (Cursor rings to improve visibility)

## Browsers
### Min Browser
### Firefox
### Brave

## No script
### HTTP Clients (Paw, Postman)
### iStats Menus

# if [[ $OSTYPE == "darwin"* ]]; then
#     # Install fonts
#     cp -Rf $HOME/.fonts/* $HOME/Library/Fonts
# fi
