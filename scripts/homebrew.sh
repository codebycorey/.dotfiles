#!/usr/bin/env bash

if [[ ! -s "$HOME/.brew/bin/brew" ]]; then
    mkdir -p "$HOME/.brew"
    git clone https://github.com/Homebrew/brew --depth 1 "$HOME/.brew"
fi
