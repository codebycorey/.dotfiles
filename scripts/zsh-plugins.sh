#!/usr/bin/env bash

if [[ ! -s "$HOME/.config/zsh-autocomplete" ]]; then
    git clone https://github.com/marlonrichert/zsh-autocomplete.git --depth 1 "$HOME/.config/zsh-autocomplete"
fi

if [[ ! -s "$HOME/.config/zsh-autosuggestions" ]]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions.git "$HOME/.config/zsh-autosuggestions"
fi
