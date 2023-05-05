#!/usr/bin/env zsh

# OH MY ZSH SETUP
# TODO: Move this to a separate file
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="gruvbox"
SOLARIZED_THEME="dark"

plugins=(
    git
    zsh-autosuggestions
)

ZSH_AUTOSUGGEST_STRATEGY=(history completion)

source $ZSH/oh-my-zsh.sh
## END OH MY ZSH SETUP

# ZSH CONFIGURATION
ZSH_CONFIGS=$HOME/.config/shell
for i in `find -L $ZSH_CONFIGS`; do
    source $i
done

bindkey -s '^f' "tmux-manager\n"
bindkey -s '^n' "nvim\n"

# ZSH Options
setopt NO_BEEP                      # Disabled beeps
setopt AUTO_CD                      # Automatically cd into typed directory.
setopt INTERACTIVE_COMMENTS         # Allows comments in shell
unsetopt FLOW_CONTROL               # Disable ctrl-s to freeze terminal.
#setopt vi                          # Enables vi in shell with escape

# ZSH History
SAVEHIST=10000                      # Lots of history
HISTSIZE=10000                      # Lots of history
setopt INC_APPEND_HISTORY           # Append to history immediately
setopt SHARE_HISTORY                # Share history across multiple terminal sessions
setopt EXTENDED_HISTORY             # Add more information to comand history
setopt HIST_SAVE_NO_DUPS            # Don't save duplicate entries
setopt HIST_IGNORE_DUPS             # Prevent duplicates from history
setopt HIST_IGNORE_SPACE            # Prevent empty commands from history
setopt HIST_REDUCE_BLANKS           # Remove extra blanks from command before adding to history

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(starship init zsh)"         # Set prompt using starship
eval "$(fnm env --use-on-cd)"
