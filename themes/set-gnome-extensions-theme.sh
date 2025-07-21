#!/bin/bash

# Gnome Extensions Theme
gsettings set org.gnome.shell.extensions.tophat meter-fg-color $EXTENSIONS_TOPHAT_COLOR

# Refresh Forge
gext disable forge@jmmaranan.com && gext enable forge@jmmaranan.com