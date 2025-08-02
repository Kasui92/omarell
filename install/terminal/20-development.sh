#!/bin/bash

# Install development libraries and tools
sudo apt install -y \
  git bison clang rustc cargo golang-go

# Install mise for managing multiple versions of languages. See https://mise.jdx.dev/
if ! command -v mise &>/dev/null; then
  sudo apt update -y && sudo apt install -y gpg wget curl
  sudo install -dm 755 /etc/apt/keyrings
  wget -qO - https://mise.jdx.dev/gpg-key.pub | gpg --dearmor | sudo tee /etc/apt/keyrings/mise-archive-keyring.gpg 1>/dev/null
  echo "deb [signed-by=/etc/apt/keyrings/mise-archive-keyring.gpg arch=$(dpkg --print-architecture)] https://mise.jdx.dev/deb stable main" | sudo tee /etc/apt/sources.list.d/mise.list
  sudo apt update
  sudo apt install -y mise
fi

