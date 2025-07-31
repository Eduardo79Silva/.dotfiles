#!/usr/bin/env bash
set -euo pipefail

# 1. Prerequisites
echo "Installing dependencies..."
sudo apt update
sudo apt install -y git stow zsh tmux i3 pavucontrol xbacklight

# 2. Clone your fork (or this repo)
#    Change URL to your repo if you forked
if [ ! -d "$HOME/.dotfiles" ]; then
  git clone --depth 1 https://github.com/Eduardo79Silva/.dotfiles.git "$HOME/.dotfiles"
fi
cd "$HOME/.dotfiles"

# 3. Stow modules (only these)
stow --target="$HOME" bash
stow --target="$HOME" zsh
stow --target="$HOME" tmux
stow --target="$HOME" i3

# 4. Switch to zsh (optional)
echo "Default shell will be changed to zsh."
chsh -s $(which zsh) || echo "Could not change shell, please run: chsh -s \\$(which zsh)"

# 5. Done
printf "\e[32mBootstrap complete!\e[0m\n"
