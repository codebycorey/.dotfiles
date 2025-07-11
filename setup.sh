#!/usr/bin/env bash
set -e

# Run OS-specific setup
if [[ "$OSTYPE" == "darwin"* ]]; then
  echo "Setting up macOS-specific configurations..."
  source ./macos.sh
fi


# Create symbolic link for 1Password agent socket
mkdir -p ~/.1password && ln -s ~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock ~/.1password/agent.sock
