#!/usr/bin/env bash

dots() {

    local DOTS_INSTALL_DIR="${HOME}/.dotfiles"

    dots_install_git_bash() {
        local GIT_COMPLETION_URL="https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash"
        local GIT_COMPLETION_FILE_NAME=".bash_git_completion"
        local GIT_PROMPT_URL="https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh"
        local GIT_PROMPT_FILE_NAME=".bash_git_prompt'"
        echo "=> Installing Git Completion..."
        curl "${GIT_COMPLETION_URL}" > "${HOME}/${GIT_COMPLETION_FILE_NAME}"

        echo "=> Installing Git Prompt"
        curl "${GIT_PROMPT_URL}" > "${HOME}/${GIT_PROMPT_FILE_NAME}"
    }

    dots_symlink_home() {
        local FILE_DIR="${1}"
        local FILE_NAME="${2}"
        if [[ -e "${HOME}/${FILE_NAME}" ]]; then
            echo "=> rm -rf ${HOME}/${FILE_NAME}"
            rm -rf "${HOME}/${FILE_NAME}"
        fi
        echo "=> ln -s ${FILE_DIR}/${FILE_NAME} ${HOME}/${FILE_NAME}"
        ln -s "${FILE_DIR}/${FILE_NAME}" "${HOME}/${FILE_NAME}"
    }

    dots_bash_exit_message() {
        echo "=========================================="
        echo "="
        echo "=Open new terminal for file to take effect"
        echo "="
        echo "=========================================="
    }

    dots_install_bash() {
        local BASH_FILE_DIR="${DOTS_INSTALL_DIR}/bash"
        for FILE in $(ls -A "${BASH_FILE_DIR}"); do
            dots_symlink_home "${BASH_FILE_DIR}" "${FILE}"
        done
        dots_install_git_bash
        dots_bash_exit_message
    }

    dots_confirm_bash() {
        echo "===================================="
        echo "=>"
        echo "=>WARNING! \nYOU WILL OVERWRITE CURRENT DOT FILES!"
        echo "=>"
        echo -e "=> Continue (yes/no)? \c"
        read INPUT
        if [[ "${INPUT}" = "yes" ]] || [[ "${INPUT}" = "Yes" ]] || [[ "${INPUT}" = "y" ]]; then
            echo "yes"
        else
            exit
        fi
    }
    echo "${1}"
    if [[ "${1}" = "bash" ]]; then
        dots_confirm_bash
        dots_install_bash
    fi
}
