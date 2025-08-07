#!/bin/bash

# GNOME desktop and tools
sudo apt install -y --no-install-recommends \
    gnome-screenshot \
    gnome-shell-extension-manager \
    gnome-sushi \
    gnome-tweak-tool

# File management and media
sudo apt install -y --no-install-recommends \
    evince \
    ffmpegthumbnailer \
    imv \
    mpv \
    nautilus

# Application launcher
sudo apt install -y --no-install-recommends \
    wofi

# Install Gnome extensions CLI
pipx install gnome-extensions-cli --system-site-packages

# Install Browsers
source ~/.local/share/omarell/applications/install/firefox.sh
source ~/.local/share/omarell/applications/install/chromium.sh