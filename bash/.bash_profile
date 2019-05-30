#!/usr/bin/env bash
echo "Sourcing .bash_profile..."

#   Set Paths
#   ------------------------------------------------------------
# export PATH="$PATH:/usr/local/bin/"
# export PATH="$PATH:/usr/local/git/bin"
# export PATH="$PATH:/sw/bin/"
# export PATH="$PATH:/usr/local/"
# export PATH="$PATH:/usr/local/sbin"
# export PATH="$PATH:/usr/local/mysql/bin"
# export PATH="$PATH:~/.local/bin"

#   Set Defaults
#   ------------------------------------------------------------
export EDITOR="vim"
export TERMINAL="st"
export BROWSER="firefox"

#   Bash scripts
#   -----------------------------------------------
echo "${0}" | grep "bash$" > /dev/null && [[ -s "${HOME}/.bashrc" ]] && source "${$HOME}/.bashrc"

clear