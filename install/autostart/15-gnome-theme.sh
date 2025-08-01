#!/bin/bash

# Apply GNOME theme
source ~/.config/omarell/current/theme/gnome.sh

# Set GNOME background
CURRENT_THEME_BACKGROUND="$(readlink -f "$HOME/.config/omarell/current/background")"
gsettings set org.gnome.desktop.background picture-uri $CURRENT_THEME_BACKGROUND
gsettings set org.gnome.desktop.background picture-uri-dark $CURRENT_THEME_BACKGROUND
gsettings set org.gnome.desktop.background picture-options 'zoom'

# Set GDM background
source ~/.local/share/omarell/bin/scripts/omarell-refresh-gdm
