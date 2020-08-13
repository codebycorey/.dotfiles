#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset
# set -o xtrace

main() {

    local DOTS_GIT_SOURCE="git@github.com:CodeByCorey/dotfiles.git"
    local DOTS_GIT_RELEASE_BRANCH="master"
    local DOTS_DOWNLOAD_DIR="${HOME}/.dotfiles"

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
                echo >&2 '=> Make sure you have ssh keys setuo for github'
                exit 1
            }
        fi
    }

    dots_purge() {
        echo "=> Purging Previous downloaded version"
        echo "=> rm -rf "${DOTS_DOWNLOAD_DIR}""
        rm -rf "${DOTS_DOWNLOAD_DIR}"
    }

    dots_download() {
        if dots_has git; then
            dots_download_from_git
        else
            echo >&2 '=> You need git to install dots'
            exit 1
        fi
    }

    dots_purge
    dots_download
}

main
