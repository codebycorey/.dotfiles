#!/usr/bin/env zsh

# ZSH CONFIGURATION
source "$HOME/.config/shell/aliases"

bindkey -s '^f' "tmux-sessionizer\n"
bindkey -s '^n' "nvim\n"

# ZSH Options
setopt NO_BEEP                      # Disabled beeps
setopt AUTO_CD                      # Automatically cd into typed directory.
setopt INTERACTIVE_COMMENTS         # Allows comments in shell
setopt AUTO_PUSHD                   # Push dirs onto stack with cd
setopt PUSHD_IGNORE_DUPS            # No duplicate dirs on stack
setopt EXTENDED_GLOB                # Advanced globbing (#, ~, ^)
setopt COMPLETE_IN_WORD             # Complete from cursor position
setopt ALWAYS_TO_END                # Move cursor to end after completion
unsetopt FLOW_CONTROL               # Disable ctrl-s to freeze terminal.

# ZSH History
SAVEHIST=10000                      # Lots of history
HISTSIZE=10000                      # Lots of history
setopt INC_APPEND_HISTORY           # Append to history immediately
setopt SHARE_HISTORY                # Share history across multiple terminal sessions
setopt EXTENDED_HISTORY             # Add more information to comand history
setopt HIST_SAVE_NO_DUPS            # Don't save duplicate entries
setopt HIST_IGNORE_DUPS             # Prevent duplicates from history
setopt HIST_IGNORE_ALL_DUPS         # Remove older duplicates from history
setopt HIST_FIND_NO_DUPS            # Don't show duplicates in history search
setopt HIST_IGNORE_SPACE            # Prevent empty commands from history
setopt HIST_REDUCE_BLANKS           # Remove extra blanks from command before adding to history

autoload -Uz compinit && compinit

zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$HOME/.zcompcache"

# Use the correct homebrew path based on architecture
if [[ "$(arch)" = "arm64" ]]; then
    [[ -x /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"
else
    [[ -x /usr/local/bin/brew ]] && eval "$(/usr/local/bin/brew shellenv)"
fi

eval "$(starship init zsh)"

eval "$(fnm env --use-on-cd)"

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
if [[ "$(arch)" = "arm64" ]]; then
    _brew_prefix="/opt/homebrew"
else
    _brew_prefix="/usr/local"
fi
[[ -f "$_brew_prefix/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] && source "$_brew_prefix/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
[[ -f "$_brew_prefix/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] && source "$_brew_prefix/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
unset _brew_prefix

# FZF integration (keybindings and completion)
source <(fzf --zsh)
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --exclude node_modules --exclude .venv --exclude dist --exclude target --exclude build --exclude .cache'
export FZF_DEFAULT_OPTS="--layout=reverse --border --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8,fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc,marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

