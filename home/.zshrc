#!/usr/bin/env zsh

# ZSH CONFIGURATION
source "$HOME/.config/shell/aliases"

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

autoload -Uz compinit && compinit

zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'

# Use the correct homebrew path based on architecture
if [ "$(arch)" = "arm64" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    eval "$(/usr/local/bin/brew shellenv)"
fi

eval "$(starship init zsh)"

eval "$(fnm env --use-on-cd)"

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
_brew_prefix=$(brew --prefix)
source "$_brew_prefix/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$_brew_prefix/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
unset _brew_prefix

