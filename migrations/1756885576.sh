#!/bin/bash

# Install Zellij
echo -e "\n\e[31mInstalling Zellij...\e[0m"
echo

# Install Zellij
if ! command -v zellij &>/dev/null; then
  cd /tmp
  wget -O zellij.tar.gz "https://github.com/zellij-org/zellij/releases/latest/download/zellij-x86_64-unknown-linux-musl.tar.gz"
  tar -xf zellij.tar.gz zellij
  sudo install zellij /usr/local/bin
  rm zellij.tar.gz zellij
cd -

# Apply Zellij theme
mkdir -p ~/.config/zellij/themes
ln -snf ~/.config/omakub/current/theme/zellij.kdl ~/.config/zellij/themes/current.kdl

omakub-refresh-config zellij/config.kdl
omakub-refresh-config alacritty/alacritty.toml
