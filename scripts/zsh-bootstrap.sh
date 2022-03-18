#!/usr/bin/env bash

curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh -s -- --keep-zshrc

# Oh-my-zsh Themes
curl -L https://raw.githubusercontent.com/sbugzu/gruvbox-zsh/master/gruvbox.zsh-theme > $HOME/.oh-my-zsh/custom/themes/gruvbox.zsh-theme

# Oh-my-zsh Plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
