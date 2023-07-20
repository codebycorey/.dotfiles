#!/usr/bin/env zsh
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(fnm env --use-on-cd)"

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
