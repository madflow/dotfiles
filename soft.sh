#!/usr/bin/env bash

# apk add git curl wget bat mcfly zsh vim openssh-client go httpie tmux

set -e

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "Linux host detected"
    apt-get update
    apt-get install -y bat curl bat fd-find git golang httpie openssh-client ripgrep tmux vim wget tmux zsh
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
elif [[ "$OSTYPE" == "linux-musl"* ]]; then
    echo "Alpine host detected"
    echo "Installing dependencies..."
    apk update
    apk add git bat curl bat git go mcfly httpie openssh-client ripgrep tmux vim wget tmux zsh
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Macos host detected"
    brew install bat curl bat fd httpie mcfly ripgrep tmux vim wget tmux zsh
    brew tap homebrew/cask-fonts
    brew install --cask font-fira-code
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "Unknown host detected"
fi
