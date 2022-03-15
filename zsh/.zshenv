#!/bin/zsh

# Removes % from top of prompt
unsetopt PROMPT_SP

export ZDOTDIR="$HOME/.config/zsh"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.volta/bin"
export PATH="$PATH:$HOME/.brew/bin"
export PATH="$PATH:$HOME/.poetry/bin"
export PATH="$PATH:$HOME/.rvm/bin"

export GIT_EDITOR='nvim'

export GPG_TTY=$(tty)
