#!/usr/bin/env zsh

# Removes % from top of prompt
unsetopt PROMPT_SP

export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.volta/bin"
export PATH="$PATH:$HOME/.poetry/bin"
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/Library/Python/3.9/bin"
export PATH="$PATH:/opt/homebrew/bin"

# Default Programs
export EDITOR="nvim"
export BROWSER="firefox"
export PAGER="less"
export GIT_EDITOR='nvim'

export GPG_TTY=$(tty)

alias vim=nvim
. "$HOME/.cargo/env"
