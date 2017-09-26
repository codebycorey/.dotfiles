#!/usr/bin/env bash

# Install git completion
if [[ ! -s "$HOME/.git-completion.bash" ]]; then
    echo "Installing Git Completion..."
    curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > ~/.git-completion.bash
else
    echo "Git completion already installed"
fi

# Install git prompt
if [[ ! -s "$HOME/.git-prompt.sh" ]]; then
    echo "Installing Git Prompt"
    curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > ~/.git-prompt.sh
else
    echo "Git Prompt already installed"
fi
