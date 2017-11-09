#!/usr/bin/env bash

dots() {

    local DOTS_INSTALL_DIR="${HOME}/.dotfiles"

    dots_symlink_home() {
        local FILE_DIR="${1}"
        local FILE_NAME="${2}"
        local BACKUPS_DIR="{DOTS_INSTALL_DIR}/backups"
        # echo "${HOME}/${FILE_NAME}"
        if [[ -f "${HOME}/${FILE_NAME}" ]]; then
            mkdir -p "{BACKUPS_DIR}"
            echo "${HOME}/${FILE_NAME}"
        fi
    }

    dots_install_bash() {
        local BASH_FILE_DIR="${DOTS_INSTALL_DIR}/bash"
        local BASH_DOTS=(".bash_profile" ".bash_aliases" ".bash_scripts" ".bash_system")
        for FILE in "${BASH_DOTS[@]}"; do
            # echo "FILE: ${FILE}"
            dots_symlink_home "${BASH_FILE_DIR}" "${FILE}"
        done
    }

    dots_main_menu() {
        clear
        echo "==================================="
        echo "Menu ---"
        echo "==================================="
        echo -e "\n\nWARNING!: THIS MIGHT OVERWRITE CURRENT DOT FILES!\n\n"
        echo "1) install bash"
        echo "2) install applications"
        echo "q) exit"
        echo -e "\n"
        echo -e "Enter your selection \c"

        read ANSWER
        if [[ "${ANSWER}" = q ]]; then
                break
        fi
        case "${ANSWER}" in
            "1")
                dots_install_bash
            ;;
            "2")
                echo "You are applications..."
            ;;
        esac
        echo -e "Enter return to continue \c"
        read input
    }

    if [[ "${1}" = "bash" ]]; then
        dots_install_bash
    else
        while true; do
            dots_main_menu
        done
    fi
}

dots "${1}"
