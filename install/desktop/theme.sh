#!/bin/bash

# Setup theme links
if [ -d ~/.config/omarell/themes ]; then
  rm -rf ~/.config/omarell/themes
fi
mkdir -p ~/.config/omarell/themes
for f in ~/.local/share/omarell/themes/*; do ln -s "$f" ~/.config/omarell/themes/; done

# Set initial theme
mkdir -p ~/.config/omarell/current
ln -snf ~/.config/omarell/themes/$OMARELL_FIRST_RUN_THEME ~/.config/omarell/current/theme
ln -snf $(find "$HOME/.config/omarell/current/theme/backgrounds/" -type f | head -n 1) "$HOME/.config/omarell/current/background"

# Set specific app links for current theme
ln -snf ~/.config/omarell/current/theme/neovim.lua ~/.config/nvim/lua/plugins/theme.lua

mkdir -p ~/.config/btop/themes
ln -snf ~/.config/omarell/current/theme/btop.theme ~/.config/btop/themes/current.theme

mkdir -p ~/.config/forge/stylesheet/forge
ln -snf ~/.config/omarell/current/theme/forge.css ~/.config/forge/stylesheet/forge/stylesheet.css

# Apply GNOME theme
source ~/.config/omarell/current/theme/gnome.sh

# Set GNOME background
CURRENT_THEME_BACKGROUND="$(readlink -f "$HOME/.config/omarell/current/background")"
gsettings set org.gnome.desktop.background picture-uri $CURRENT_THEME_BACKGROUND
gsettings set org.gnome.desktop.background picture-uri-dark $CURRENT_THEME_BACKGROUND
gsettings set org.gnome.desktop.background picture-options 'zoom'

# Set GDM background
source ~/.local/share/omarell/scripts/omarell-refresh-gdm.sh



