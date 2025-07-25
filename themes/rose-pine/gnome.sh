#!/bin/bash

OMARELL_THEME_COLOR="red"

# Set GNOME theme
gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
gsettings set org.gnome.desktop.interface cursor-theme 'Yaru'
gsettings set org.gnome.desktop.interface gtk-theme "Yaru-$OMARELL_THEME_COLOR-dark"
gsettings set org.gnome.desktop.interface icon-theme "Yaru-$OMARELL_THEME_COLOR"
gsettings set org.gnome.desktop.interface accent-color "$OMARELL_THEME_COLOR" 2>/dev/null || true

# Set GNOME extensions theme
gsettings set org.gnome.shell.extensions.tophat meter-fg-color "#e92020"
