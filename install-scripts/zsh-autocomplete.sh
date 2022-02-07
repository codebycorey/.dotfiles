#!/usr/bin/env bash

if [[ ! -s "$HOME/.config/zsh-autocomplete" ]]; then
    mkdir -p "$HOME/.config/zsh-autocomplete"
    git clone https://github.com/marlonrichert/zsh-autocomplete.git --depth 1 "$HOME/.config/zsh-autocomplete"
fi
