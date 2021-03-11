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

dots_create_base_folders() {
    mkdir -p "$HOME/.local/bin"
    mkdir -p "$HOME/workspace"
}

dots_clone_essential_repos() {
    git clone "git@github.com:CodeByCorey/notes.git" "$HOME/workspace/notes"
}

dots_i3_config() {
    dots_symlink_home $DOTS_INSTALL_DIR ".config/i3"
    dots_symlink_home $DOTS_INSTALL_DIR ".config/i3blocks"
}

dots_install_git_bash() {
    local GIT_COMPLETION_URL="https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash"
    local GIT_PROMPT_URL="https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh"
    echo "=> Installing Git Completion..."
    curl "$GIT_COMPLETION_URL" > "$HOME/.bash_git_completion"

    echo "=> Installing Git Prompt"
    curl "$GIT_PROMPT_URL" > "$HOME/.bash_git_prompt"
}

dots_install_fonts() {
    dots_symlink_home $DOTS_INSTALL_DIR ".fonts"
    fc-cache -f -v
}

dots_install_starship() {
    curl -fsSL https://starship.rs/install.sh | bash -s -- -b "$HOME/.local/bin"
    dots_symlink_home $DOTS_INSTALL_DIR ".config/starship.toml"
}

dots_install_kitty() {
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh
    dots_symlink_home $DOTS_INSTALL_DIR ".config/kitty"
}

dots_install_volta() {
    curl https://get.volta.sh | bash -s -- --skip-setup
}

dots_bash_exit_message() {
    echo "=========================================="
    echo "="
    echo "=Open new terminal for file to take effect"
    echo "="
    echo "=========================================="
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

dots_confirm() {
    echo "===================================="
    echo "=>"
    echo "=> WARNING! \nYOU WILL OVERWRITE CURRENT DOT FILES!"
    echo "=>"
    echo -e "=> Continue (yes/no)? \c"
    read INPUT
    if [[ "$INPUT" = "yes" ]] || [[ "$INPUT" = "Yes" ]] || [[ "$INPUT" = "y" ]]; then
        echo "yes"
    else
        exit
    fi
}

dots_choose_shell_env() {
    echo "===================================="
    echo "=>"
    echo "=> Do you want to install bash or zsh dotfiles?"
    echo "=>"
    echo -e "=> type 'bash' or 'zsh' \c"
    read INPUT
    if [[ "$INPUT" = "bash" ]]; then
        dots_install_bash
    elif [[ "$INPUT" = "zsh" ]]; then
        dots_install_zsh
    else
        exit
    fi
}

dots_apps_install() {
    local APP_PATH="$DOTS_INSTALL_DIR/.local/${1}.sh"
    if [[ -f "${APP_PATH}" ]]; then
        source "${APP_PATH}"
    fi
}

dots_create_base_folders

if [[ "${1}" = "bash" ]]; then
    dots_confirm
    dots_install_bash
    dots_bash_exit_message
fi

if [[ "${1}" = "apps" && -n "${2}" ]]; then
    echo "args ${1} ${2}"
    dots_apps_install "${2}"
fi

if [[ "${1}" = "full" ]]; then
    dots_confirm
    dots_choose_shell_env
    dots_install_fonts
    dots_install_kitty
    dots_install_volta
    dots_install_starship
    dots_bash_exit_message
fi

if [[ "${1}" = "i3" ]]; then
    dots_i3_config
fi
