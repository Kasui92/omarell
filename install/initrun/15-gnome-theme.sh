#!/bin/bash

# Reapply Forge theme (remove old if exists)
mkdir -p ~/.config/forge/stylesheet/forge
if [ -f ~/.config/forge/stylesheet/forge/stylesheet.css ]; then
  rm ~/.config/forge/stylesheet/forge/stylesheet.css
fi
ln -snf ~/.config/omarell/current/theme/forge.css ~/.config/forge/stylesheet/forge/stylesheet.css

# Apply GNOME theme
source ~/.config/omarell/current/theme/gnome.sh

# Set GNOME background
CURRENT_THEME_BACKGROUND="$(readlink -f "$HOME/.config/omarell/current/background")"
gsettings set org.gnome.desktop.background picture-uri $CURRENT_THEME_BACKGROUND
gsettings set org.gnome.desktop.background picture-uri-dark $CURRENT_THEME_BACKGROUND
gsettings set org.gnome.desktop.background picture-options 'zoom'

# Set GDM background
source ~/.local/share/omarell/bin/scripts/omarell-refresh-gdm
