#!/usr/bin/env bash
set -e

# move windows by holding ctrl + cmd and dragging any part of the window
defaults write -g NSWindowShouldDragOnGesture -bool true

# Finder improvements
# Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true
# Show path bar
defaults write com.apple.finder ShowPathbar -bool true
# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true
# Use list view by default
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"


# Keyboard settings
# Enable key repeat (disable press-and-hold for special characters)
defaults write -g ApplePressAndHoldEnabled -bool false
# Fast key repeat rate
defaults write -g KeyRepeat -int 2
defaults write -g InitialKeyRepeat -int 15


# Dock settings
# Auto-hide the dock
defaults write com.apple.dock autohide -bool true
# Minimize windows into their application's icon
defaults write com.apple.dock minimize-to-application -bool true
# Speed up dock show/hide animation
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.5

# Restart affected applications
for app in "Dock" "Finder" "SystemUIServer"; do
    killall "${app}" &> /dev/null
done

xcode-select --install
sudo xcodebuild -license accept


