#!/usr/bin/env bash
echo "Sourcing .bash_profile..."

DOT_BASH_FILES=(".bashrc" ".bash_aliases" ".bash_scripts" ".bash_system" ".bash_work")
DOT_GIT_ADDONS=('.git-prompt.sh' ".git-completion.bash")

dots_source_from_array() {
    FILES=("${@}")
    for file in "${FILES[@]}"; do
        if [[ -s "${HOME}/${file}" ]]; then
            echo "Sourcing ${file}..."
            source "${HOME}/${file}"
        fi
    done
}

#   Bash scripts
#   -----------------------------------------------
dots_source_from_array "${DOT_BASH_FILES[@]}"

#   Git scripts
#   -----------------------------------------------
dots_source_from_array "${DOT_GIT_ADDONS[@]}"

#   3rd Party Packages
#   -----------------------------------------------
#   Load Personal dots manager
if [[ -s "${HOME}/.dotfiles/dots.sh" ]]; then
    echo "Sourcing dotfile manager..."
    source "${HOME}/.dotfiles/dots.sh"
fi

#   Load NVM to switch node versions quicker
if [[ -s "${HOME}/.nvm/nvm.sh" ]]; then
    echo "Sourcing .nvm..."
    source "${HOME}/.nvm/nvm.sh"
fi
