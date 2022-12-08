#!/usr/bin/env bash

xcode-select --install
sudo xcodebuild -license accept

if [[ ! -s "$HOME/.brew/bin/brew" ]]; then
    mkdir -p "$HOME/.brew"
    git clone https://github.com/Homebrew/brew --depth 1 "$HOME/.brew"

    eval "$($HOME/.brew/bin/brew shellenv)"
    brew update --force --quiet
    chmod -R go-w "$(brew --prefix)/share/zsh"
fi

brew install stow git fzf bash golang tmux neovim lazygit ripgrep fd lua-language-server koekeishiya/formulae/skhd jq
brew install alfred iterm2 karabiner-elements keycastr rectangle --cask

brew services start skhd

# Setup required folders
mkdir -pv $HOME/personal
mkdir -pv $HOME/work

source ./clean-dots.sh
source ./install-dots.sh

source ${BASH_SOURCE%/*}/scripts/zsh-bootstrap.sh
source ${BASH_SOURCE%/*}/scripts/starship.sh
source ${BASH_SOURCE%/*}/scripts/nvm.sh
source ${BASH_SOURCE%/*}/scripts/zsh-plugins.sh
source ${BASH_SOURCE%/*}/scripts/rust.sh

# After rust install install stylua to format lua
# cargo install stylua

# MACOS
# if [[ $OSTYPE == "darwin"* ]]; then
#     # Install fonts
cp -Rf $HOME/.fonts/* $HOME/Library/Fonts
# fi
