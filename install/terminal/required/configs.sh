#!/bin/bash

# Copy over Omasway configs
mkdir -p ~/.config
cp -RL ~/.local/share/omarell/config/* ~/.config/

# Ensure application directory exists for update-desktop-database
mkdir -p ~/.local/share/applications

# Configure the bash shell using Omarell defaults
[ -f "~/.bashrc" ] && mv ~/.bashrc ~/.bashrc.bak
echo "source ~/.local/share/omarell/default/bash/rc" >~/.bashrc

# Set common git aliases
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global pull.rebase true

# Set identification from install inputs
if [[ -n "${OMASWAY_USER_NAME//[[:space:]]/}" ]]; then
  git config --global user.name "$OMASWAY_USER_NAME"
fi

if [[ -n "${OMASWAY_USER_EMAIL//[[:space:]]/}" ]]; then
  git config --global user.email "$OMASWAY_USER_EMAIL"
fi