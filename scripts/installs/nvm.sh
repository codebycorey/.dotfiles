#!/usr/bin/env bash

if [[ ! -s "$HOME/.nvm/nvm.sh" ]]; then
    echo "Installing NVM..."
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.4/install.sh | bash
else
    echo "NVM already installed"
fi
