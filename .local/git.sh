#!/usr/bin/env bash

# Install git completion
if [[ ! -s "$HOME/.bash_git_completion" ]]; then
    echo "Installing Git Completion..."
    curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > ~/.bash_git_completion
else
    echo "Git completion already installed"
fi

# Install git prompt
if [[ ! -s "$HOME/.bash_git_prompt" ]]; then
    echo "Installing Git Prompt"
    curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > ~/.bash_git_prompt
else
    echo "Git Prompt already installed"
fi
