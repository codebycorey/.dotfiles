#!/bin/zsh

local ZSH_CACHE=$ZDOTDIR/cache
local ZSH_OVERRIDE=$HOME/.zshrc

eval "$(starship init zsh)"         # Set prompt using starship

# Load config files and tools
source $ZDOTDIR/aliases.zsh        # Add aliases and remaps with prefered settings
source $ZDOTDIR/functions.zsh      # Add tools and functions

# Default Programs
export EDITOR="vim"
export TERMINAL="kitty"
export BROWSER="brave-browser"
export PAGER="less"
export LESS="-FSRXc"

# ZSH Options
setopt ZLE                          # Enable the ZLE line editor
setopt NO_BEEP                      # Disabled beeps
setopt AUTO_CD                      # Automatically cd into typed directory.
setopt INTERACTIVE_COMMENTS         # Allows comments in shell
unsetopt FLOW_CONTROL               # Disable ctrl-s to freeze terminal.
#setopt vi                          # Enables vi in shell with escape

# ZSH History
HISTFILE=$ZSH_CACHE/history         # Move history from home directory
SAVEHIST=10000                      # Lots of history
HISTSIZE=10000                      # Lots of history
setopt EXTENDED_HISTORY             # Add more information to comand history
setopt APPEND_HISTORY               # Multiple terminals sessions append to same history
setopt INC_APPEND_HISTORY           # Append to history immediately
setopt SHARE_HISTORY                # Share history across multiple terminal sessions
setopt HIST_FIND_NO_DUPS            # Dont cycle through multiples of same command
setopt HIST_EXPIRE_DUPS_FIRST       # Remove duplicates from history first if history full
setopt HIST_IGNORE_DUPS             # Prevent duplicates from history
setopt HIST_IGNORE_SPACE            # Prevent empty commands from history
setopt HIST_REDUCE_BLANKS           # Remove extra blanks from command before adding to history

# ZSH Auto Complete
autoload -U compinit                                    # Autoload auto completion
_comp_options+=(globdots)		                        # Include hidden files
zstyle ':completion:*' menu select                      # Have the menu highlight
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'     # Case-insensitive (uppercase from lowercase) completion
setopt COMPLETE_IN_WORD                                 # Allow completion from within a word/phrase
setopt ALWAYS_TO_END                                    # When completing from the middle of a word, move cursor to end of word
setopt MENU_COMPLETE                                    # When using auto-complete, put the first option on the line immediately
setopt COMPLETE_ALIASES                                 # Turn on completion for aliases as well
setopt LIST_ROWS_FIRST                                  # Cycle through menus horizontally instead of vertically

# Override config
[ -f "$ZSH_OVERRIDE" ] && source "$ZSH_OVERRIDE"
