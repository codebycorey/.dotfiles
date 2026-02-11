#!/usr/bin/env bash

if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "Error: not a git repository"
    exit 1
fi

if ! command -v fzf &> /dev/null; then
    echo "Error: fzf not installed"
    exit 1
fi

selected=$(git branch |
    grep --invert-match '\*' |
    cut -c 3- |
    fzf --multi --preview="git log {} --")

if [[ -z "$selected" ]]; then
    exit 0
fi

echo "Branches to delete:"
echo "$selected" | sed 's/^/  /'
echo ""
printf "Force delete these branches? [y/N] "
read -r confirm < /dev/tty

if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
    echo "$selected" | xargs git branch --delete --force
else
    echo "Cancelled"
fi

