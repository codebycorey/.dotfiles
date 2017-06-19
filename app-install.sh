#!/usr/bin/env bash

function install_app() {
    FILE="./scripts/installs/$1.sh"
    echo $FILE
    if [ -f $FILE ]; then
        source $FILE
    else
        echo "file does not exist"
    fi
}

if [ $# -eq 1 ]; then
    install_app $1
else
    echo "Please specify an app you would like to install"
fi
