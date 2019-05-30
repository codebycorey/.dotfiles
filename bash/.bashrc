#!/bin/bash
# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

function dots_source_from_array() {
    FILES=("${@}")
    for file in "${FILES[@]}"; do
        if [[ -s "${HOME}/${file}" ]]; then
            echo "Sourcing ${file}..."
            source "${HOME}/${file}"
        fi
    done
}

DOT_BASH_FILES=(".bash_aliases" ".bash_scripts" ".bash_system" ".bash_work" ".bash_sensitive")
DOT_GIT_ADDONS=('.bash_git_prompt' ".bash_git_completion")

#   Bash scripts
#   -----------------------------------------------
dots_source_from_array "${DOT_BASH_FILES[@]}"

#   Git scripts
#   -----------------------------------------------
dots_source_from_array "${DOT_GIT_ADDONS[@]}"

#   Load NVM to switch node versions quicker
if [[ -s "${HOME}/.nvm/nvm.sh" ]]; then
    echo "Sourcing .nvm..."
    source "${HOME}/.nvm/nvm.sh"
fi

clear 