#!/bin/zsh

# Adds `~/.local/bin` to $PATH
export PATH="$PATH:$HOME/.local/bin"

# Removes % from top of prompt
unsetopt PROMPT_SP

export ZDOTDIR="$HOME/.config/zsh"


