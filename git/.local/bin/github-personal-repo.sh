#!/usr/bin/env bash
set -e

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "This script must be run inside a git repository."
  exit 1
fi

echo "Setting up personal Git repository configuration..."

CURRENT_URL=$(git remote get-url origin)

REPO=$(echo "$CURRENT_URL" | sed -E 's#.*(github\.com[:/])(.*)#\2#')

# Update remote to use the git-personal host for ssh key authentication
NEW_URL="git@git-personal:$REPO"
git remote set-url origin "$NEW_URL"

# Set peronal Git configuration
git config user.name "codebycorey"
git config user.email "me@coreyodonnell.com"

# Verify the changes
echo "Remote URL updated to: $(git remote get-url origin)"
echo "Local git configuration:"
git config --local --list | grep user
