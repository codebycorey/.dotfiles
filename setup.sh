#!/usr/bin/env bash

source ./scripts/dots_install_third_parties.sh
source ./scripts/dots_move_files_home.sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Install thied parties
install_third_parties

if [ $# -eq 1 ] && [ $1 = "full" ]; then
    full_dots_link_files_home $DIR
else
    basic_dots_link_files_home $DIR
fi
