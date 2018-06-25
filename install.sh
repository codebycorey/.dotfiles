#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset
# set -o xtrace

main() {

    local DOTS_GIT_SOURCE="https://gitlab.com/Reyco/dotfiles.git"
    local DOTS_GIT_RELEASE_BRANCH="master"
    local DOTS_DOWNLOAD_DIR="${HOME}/apps/dotfiles"
    local DOTS_APP_FILENAME="dotfiles"
    local DOTS_INSTALL_DIR="/usr/bin"

    dots_has() {
        type "$1" > /dev/null 2>&1
    }

    dots_download_from_git() {
        echo "=> Downloading dotfiles from git"
        if [[ -d "${DOTS_DOWNLOAD_DIR}/.git" ]]; then
            echo "=> Dots already installed in ${DOTS_DOWNLOAD_DIR}"
        else
            mkdir -p "${DOTS_DOWNLOAD_DIR}"
            command git clone "${DOTS_GIT_SOURCE}" -b "${DOTS_GIT_RELEASE_BRANCH}" --depth=1 "${DOTS_DOWNLOAD_DIR}" || {
                echo >&2 '=> Failed to clone dotfile repo.'
                exit 1
            }
            command git --git-dir="${DOTS_DOWNLOAD_DIR}"/.git --work-tree="${DOTS_DOWNLOAD_DIR}" checkout -f --quiet "${DOTS_GIT_RELEASE_BRANCH}"
        fi
    }

    dots_purge() {
        echo "=> Purging Previous downloaded version"
        echo "=> rm -rf "${DOTS_DOWNLOAD_DIR}""
        rm -rf "${DOTS_DOWNLOAD_DIR}"
        if [[ -e "${DOTS_INSTALL_DIR}/${DOTS_APP_FILENAME}" ]]; then
            echo "=> rm "${DOTS_INSTALL_DIR}/${DOTS_APP_FILENAME}""
            sudo rm "${DOTS_INSTALL_DIR}/${DOTS_APP_FILENAME}"
        fi
    }

    dots_download() {
        if dots_has git; then
            dots_download_from_git
        else
            echo >&2 '=> You need git to install dots'
            exit 1
        fi
    }

    dots_install() {
        echo "=> Installing dotfile app into /usr/bin"
        local DOTS_INSTALL_APP="${DOTS_INSTALL_DIR}/${DOTS_APP_FILENAME}"
        echo "=> ln -sf "${DOTS_DOWNLOAD_DIR}/${DOTS_APP_FILENAME}" "${DOTS_INSTALL_APP}""
        sudo ln -sf "${DOTS_DOWNLOAD_DIR}/${DOTS_APP_FILENAME}" "${DOTS_INSTALL_APP}"
    }

    dots_purge
    dots_download
    dots_install
}

main
