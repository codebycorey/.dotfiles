#!/usr/bin/env bash

if [[ ! -s "$HOME/.nvm/nvm.sh" ]]; then
    mkdir -p "$HOME/.nvm"
    git clone https://github.com/nvm-sh/nvm.git --depth 1 "$HOME/.nvm"
fi
