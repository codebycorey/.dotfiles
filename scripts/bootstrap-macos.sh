#!/usr/bin/env bash

xcode-select --install
sudo xcodebuild -license accept

git clone https://github.com/Homebrew/brew $HOME/.brew

eval "$($HOME/.brew/bin/brew shellenv)"
brew update --force --quiet
chmod -R go-w "$(brew --prefix)/share/zsh"

brew install fzf stow tmux bash