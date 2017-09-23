#!/usr/bin/env bash
# TODO: cleanup and Remove this file
# Install NVM for node management
function install_nvm () {
    source ./scripts/installs/nvm.sh
}

#Install Git Completion and Git Prompt
function install_git_scripts () {
    source ./scripts//installs/git.sh
}

function install_third_parties () {
    install_nvm
    install_git_scripts
}
