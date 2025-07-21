#!/bin/bash

# Alacritty is a GPU-powered and highly extensible terminal. See https://alacritty.org/
sudo apt install -y alacritty

# Migrate config format if needed
alacritty migrate 2>/dev/null || true

# Make alacritty default terminal emulator
sudo update-alternatives --set x-terminal-emulator /usr/bin/alacritty