#!/usr/bin/env bash
set -e

REPO_DIR="${DOTFILES:-$HOME/.dotfiles}"

setup_homebrew() {
  if ! command -v brew &>/dev/null; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    if [[ -d /opt/homebrew/bin ]]; then
      eval "$('/opt/homebrew/bin/brew' shellenv)"
    elif [[ -d /usr/local/bin ]]; then
      eval "$('/usr/local/bin/brew' shellenv)"
    fi
  else
    echo "Homebrew is already installed."
  fi
}

install_brewfile() {
  local BREWFILE_PATH="$REPO_DIR/macos/Brewfile"
  if [ -f "$BREWFILE_PATH" ]; then
    echo "Installing Homebrew packages from $BREWFILE_PATH..."
    brew bundle --file="$BREWFILE_PATH"
  else
    echo "No Brewfile found at $BREWFILE_PATH. Skipping Homebrew package installation."
  fi
}

setup_finder() {
  echo "Configuring Finder..."
  defaults write com.apple.finder AppleShowAllFiles -bool true
  defaults write com.apple.finder ShowPathbar -bool true
  defaults write com.apple.finder ShowStatusBar -bool true
  defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
}

setup_dock() {
  echo "Configuring Dock..."
  defaults write com.apple.dock autohide -bool true
  defaults write com.apple.dock minimize-to-application -bool true
  defaults write com.apple.dock autohide-delay -float 0
  defaults write com.apple.dock autohide-time-modifier -float 0.5
  defaults write com.apple.dock orientation -string "left"
}

setup_keyboard() {
  echo "Configuring keyboard..."
  defaults write -g ApplePressAndHoldEnabled -bool false
  defaults write -g KeyRepeat -int 2
  defaults write -g InitialKeyRepeat -int 15
}

restart_affected_apps() {
  echo "Restarting affected applications..."
  for app in "Dock" "Finder" "SystemUIServer"; do
    killall "${app}" &> /dev/null || true
  done
}

setup_xcode() {
  echo "Setting up Xcode command line tools..."

  if ! xcode-select -p &>/dev/null; then
    echo "Installing Xcode command line tools..."
    xcode-select --install
    echo "Please complete the installation in the dialog, then re-run this script."
    exit 1
  else
    echo "Xcode command line tools already installed."
  fi

  if command -v xcodebuild &>/dev/null; then
    echo "Accepting Xcode license..."
    sudo xcodebuild -license accept
  fi
}

setup_1password_agent() {
  echo "Setting up 1Password agent socket..."
  mkdir -p ~/.1password
  ln -sf ~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock ~/.1password/agent.sock
}

main() {
  setup_xcode
  setup_homebrew
  install_brewfile
  setup_finder
  setup_dock
  setup_keyboard
  restart_affected_apps
  setup_1password_agent
}

main "$@"
