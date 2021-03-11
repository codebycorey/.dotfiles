#!/usr/bin/env bash

if [[ ! -s "$HOME/.nvm/nvm.sh" ]]; then
    echo "Installing NVM..."
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.35.3/install.sh | bash
else
    echo "NVM already installed"
fi
