#!/usr/bin/env bash

GIT_COMPLETION_URL="https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash"
GIT_PROMPT_URL="https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh"

curl "$GIT_COMPLETION_URL" > "$HOME/.bash_git_completion"
curl "$GIT_PROMPT_URL" > "$HOME/.bash_git_prompt"
