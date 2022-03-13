#!/usr/bin/env bash

DOTS_INSTALL_DIR="$HOME/.dotfiles"

dots_symlink_home() {
    local FILE_DIR="${1}"
    local FILE_NAME="${2}"
    if [[ -e "$HOME/$FILE_NAME" ]]; then
        echo "=> rm -rf $HOME/$FILE_NAME"
        rm -rf "$HOME/$FILE_NAME"
    fi
    echo "=> ln -s ${FILE_DIR}/$FILE_NAME $HOME/$FILE_NAME"
    ln -sf "${FILE_DIR}/$FILE_NAME" "$HOME/$FILE_NAME"
}

dots_clone_essential_repos() {
    git clone "git@github.com:CodeByCorey/notes.git" "$HOME/workspace/notes"
}

dots_install_fonts() {
    dots_symlink_home $DOTS_INSTALL_DIR ".fonts"
    fc-cache -f -v
}

dots_install_fonts_mac() {
    cp -Rf $DOTS_INSTALL_DIR/.fonts/* $HOME/Library/Fonts
}

dots_install_kitty() {
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh
    dots_symlink_home $DOTS_INSTALL_DIR ".config/kitty"
}

dots_install_volta() {
    curl https://get.volta.sh | bash -s -- --skip-setup
}

dots_install_bash() {
    local BASH_FILE_DIR="$DOTS_INSTALL_DIR/.config/shell"
    for FILE in $(ls -A "$BASH_FILE_DIR"); do
        dots_symlink_home "$BASH_FILE_DIR" "$FILE"
    done
    dots_install_git_bash
}

dots_install_zsh() {
    dots_symlink_home $DOTS_INSTALL_DIR ".config/zsh"
    dots_symlink_home "$DOTS_INSTALL_DIR/home" ".zshenv"
}


if [[ "${1}" = "full" ]]; then
    dots_install_fonts
    dots_install_kitty
    dots_install_volta
fi

if [[ "${1}" = "mac" ]]; then
    dots_install_zsh
    dots_install_fonts_mac
fi

if [[ "${1}" = "i3" ]]; then
    dots_i3_config
fi
