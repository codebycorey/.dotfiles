#!/bin/bash

echo "Sourcing .bash_profile..."

#   -------------------------------
#   0.  IMPORT FILES
#   -------------------------------

#   Bash scripts
if [[ -s "$HOME/.bashrc" ]]; then
    echo "Sourcing .bashrc..."
    source "$HOME/.bashrc"
fi

#   Imported Packages
#   -----------------------------------------------
#   Load NVM to switch node versions quicker
if [[ -s "$HOME/.nvm/nvm.sh" ]]; then
    echo "Sourcing .nvm..."
    source "$HOME/.nvm/nvm.sh"
fi

#   Git scripts
#   -----------------------------------------------
#   Load git prompt for bash display
if [[ -s "$HOME/.git-prompt.sh" ]]; then
    echo "Sourcing .git-prompt.sh..."
    source "$HOME/.git-prompt.sh"
fi
#   Load git completed for bash
if [[ -s "$HOME/.git-completion.bash" ]]; then
    echo "Sourcing .git-completion.bash..."
    source "$HOME/.git-completion.bash"
fi

#   Aliases and Scripts
#   -----------------------------------------------
#   Aliases that I personally use
if [[ -s "$HOME/.personal_aliases" ]]; then
    echo "Sourcing .personal_aliases..."
    source "$HOME/.personal_aliases"
fi

if [[ -s "$HOME/.personal_scripts" ]]; then
    echo "Sourcing .personal_scripts..."
    source "$HOME/.personal_scripts"
fi

#   Load additional aliases
if [[ -s "$HOME/.bash_work" ]]; then
    echo "Sourcing .bash_work..."
    source "$HOME/.bash_work"
fi
