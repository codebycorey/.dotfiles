#!/bin/zsh

local ZSH_OVERRIDE=$HOME/.zshrc

eval "$(starship init zsh)"         # Set prompt using starship

bindkey -s ^f "tmux-session\n"
bindkey -s ^w "work-tmux\n"

# Load config files and tools
source $ZDOTDIR/aliases.zsh        # Add aliases and remaps with prefered settings
source $ZDOTDIR/functions.zsh      # Add tools and functions

# Default Programs
export EDITOR="nvim"
export BROWSER="firefox"
export PAGER="less"
alias vim=nvim

# ZSH Options
setopt NO_BEEP                      # Disabled beeps
setopt AUTO_CD                      # Automatically cd into typed directory.
setopt INTERACTIVE_COMMENTS         # Allows comments in shell
unsetopt FLOW_CONTROL               # Disable ctrl-s to freeze terminal.
#setopt vi                          # Enables vi in shell with escape

# ZSH History
HISTFILE=$ZDOTDIR/history           # Move history from home directory
SAVEHIST=10000                      # Lots of history
HISTSIZE=10000                      # Lots of history
setopt INC_APPEND_HISTORY           # Append to history immediately
setopt SHARE_HISTORY                # Share history across multiple terminal sessions
setopt EXTENDED_HISTORY             # Add more information to comand history
setopt HIST_SAVE_NO_DUPS            # Don't save duplicate entries
setopt HIST_IGNORE_DUPS             # Prevent duplicates from history
setopt HIST_IGNORE_SPACE            # Prevent empty commands from history
setopt HIST_REDUCE_BLANKS           # Remove extra blanks from command before adding to history

# # ZSH Auto Complete
local ZSH_AUTOSUGGESTIONS=$HOME/.config/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -r $ZSH_AUTOSUGGESTIONS ]] && source $ZSH_AUTOSUGGESTIONS
local ZSH_AUTOCOMPLETE=$HOME/.config/zsh-autocomplete/zsh-autocomplete.plugin.zsh
[[ -r $ZSH_AUTOCOMPLETE ]] && source $ZSH_AUTOCOMPLETE

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# # Override config
[[ -r $ZSH_OVERRIDE ]] && source $ZSH_OVERRIDE
