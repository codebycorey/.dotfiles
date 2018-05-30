#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset
# set -o xtrace

main() {

    local DOTS_GIT_SOURCE="https://github.com/rcodonnell/dotfiles.git"
    local DOTS_GIT_RELEASE_BRANCH="master"
    local DOTS_INSTALL_DIR="${HOME}/apps/dotfiles"
    local DOTS_APP_FILENAME="dots.sh"

    dots_has() {
        type "$1" > /dev/null 2>&1
    }

    dots_download_from_git() {
        echo "... Downloading dotfiles from git"
        if [[ -d "${DOTS_INSTALL_DIR}/.git" ]]; then
            echo "... Dots already installed in ${DOTS_INSTALL_DIR}"
        else
            mkdir -p "${DOTS_INSTALL_DIR}"
            command git clone "${DOTS_GIT_SOURCE}" -b "${DOTS_GIT_RELEASE_BRANCH}" --depth=1 "${DOTS_INSTALL_DIR}" || {
                echo >&2 'Failed to clone dotfile repo.'
                exit 1
            }
            command git --git-dir="${DOTS_INSTALL_DIR}"/.git --work-tree="${DOTS_INSTALL_DIR}" checkout -f --quiet "${DOTS_GIT_RELEASE_BRANCH}"
        fi
    }

    dots_purge() {
        rm -rf "${DOTS_INSTALL_DIR}"
    }

    dots_install() {
        if dots_has git; then
            dots_download_from_git
        else
            echo >&2 'You need git to install dots'
            exit 1
        fi
    }

    dots_purge
    dots_install
}

main
