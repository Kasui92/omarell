#!/bin/bash

# Copy over Omarell configs
mkdir -p ~/.config
cp -R ~/.local/share/omarell/config/* ~/.config/

# Configure the bash shell using Omarell defaults
[ -f ~/.bashrc ] && mv ~/.bashrc ~/.bashrc.bak
cp ~/.local/share/omarell/default/bashrc ~/.bashrc

# Ensure application directory exists for update-desktop-database
mkdir -p ~/.local/share/applications

# If bare install, allow a way for its exclusions to not get added in updates
if [ -n "$OMARELL_BARE" ]; then
  mkdir -p ~/.local/state/omarell
  touch ~/.local/state/omarell/bare.mode
fi

# Load the PATH for use later in the installers
source ~/.local/share/omarell/default/bash/shell

# Set common git aliases
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global pull.rebase true

# Set identification from install inputs
if [[ -n "${OMARELL_USER_NAME//[[:space:]]/}" ]]; then
  git config --global user.name "$OMARELL_USER_NAME"
fi

if [[ -n "${OMARELL_USER_EMAIL//[[:space:]]/}" ]]; then
  git config --global user.email "$OMARELL_USER_EMAIL"
fi

# Set XCompose
if [ -f ~/.XCompose ]; then
  rm ~/.XCompose
fi

tee ~/.XCompose >/dev/null <<EOF
include "%H/.local/share/omarell/default/xcompose"

# Identification
<Multi_key> <space> <n> : "$OMARELL_USER_NAME"
<Multi_key> <space> <e> : "$OMARELL_USER_EMAIL"
EOF
