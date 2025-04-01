#!/usr/bin/env bash

rm -rf $HOME/.brew

if [[ ! -s "$HOME/.brew/bin/brew" ]]; then
    mkdir -p "$HOME/.brew"
    git clone https://github.com/Homebrew/brew --depth 1 "$HOME/.brew"

    eval "$($HOME/.brew/bin/brew shellenv)"
    brew update --force --quiet
fi
