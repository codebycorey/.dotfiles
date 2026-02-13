#!/usr/bin/env zsh

# Deduplicate PATH entries (appends are idempotent)
typeset -U PATH

# Removes % from top of prompt
unsetopt PROMPT_SP

export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:/opt/homebrew/bin"

# Default Programs
export EDITOR="nvim"
export BROWSER="firefox"
export PAGER="less"
export GIT_EDITOR='nvim'

[[ -t 0 ]] && export GPG_TTY=$(tty)

# Claude Code auto-memory — persist project patterns across sessions
export CLAUDE_CODE_DISABLE_AUTO_MEMORY=0
