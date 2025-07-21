#!/bin/bash

# omarell-theme-set: Set a theme, specified by its name.
# Usage: omarell-theme-set <theme-name>

if [[ -z "$1" ]]; then
  echo "Usage: omarell-theme-set <theme-name>" >&2
  exit 1
fi

THEMES_DIR="$HOME/.config/omarell/themes/"
CURRENT_THEME_DIR="$HOME/.config/omarell/current/theme"

THEME_NAME="$1"
THEME_PATH="$THEMES_DIR/$THEME_NAME"
BACKGROUND_PATH="$HOME/.config/omarell/themes/$THEME_NAME/backgrounds"

# Check if the theme entered exists
if [[ ! -d "$THEME_PATH" ]]; then
  echo "Theme '$THEME_NAME' does not exist in $THEMES_DIR" >&2
  exit 2
fi

# Update theme symlinks
ln -nsf "$THEME_PATH" "$CURRENT_THEME_DIR"

# Set desktop theme
if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
  ln -snf $(find "$HOME/.config/omarell/current/theme/backgrounds/" -type f | head -n 1) "$HOME/.config/omarell/current/background"

  # Apply GNOME themes
  source $HOME/.local/share/omarell/themes/$THEME_NAME/gnome.sh

  # Set GNOME background
  CURRENT_THEME_BACKGROUND="$(readlink -f "$HOME/.config/omarell/current/background")"
  gsettings set org.gnome.desktop.background picture-uri $CURRENT_THEME_BACKGROUND
  gsettings set org.gnome.desktop.background picture-uri-dark $CURRENT_THEME_BACKGROUND
  gsettings set org.gnome.desktop.background picture-options 'zoom'

  # Set GDM background
  gum confirm "Do you want to set the theme wallpaper as login background?" && source ~/.local/share/omarell/scripts/omarell-refresh-gdm.sh > /dev/null 2>&1

  # Touch alacritty config to pickup the changed theme
  touch "$HOME/.config/alacritty/alacritty.toml"

  # Restart components to apply new theme
  gext disable forge@jmmaranan.com > /dev/null 2>&1
  gext enable forge@jmmaranan.com > /dev/null 2>&1
fi

# Trigger btop config reload
pkill -SIGUSR2 btop