#!/bin/bash

# Center new windows in the middle of the screen
gsettings set org.gnome.mutter center-new-windows true

# Set Cascadia Mono as the default monospace font
gsettings set org.gnome.desktop.interface monospace-font-name 'CaskaydiaMono Nerd Font 10'

# Reveal week numbers in the Gnome calendar
gsettings set org.gnome.desktop.calendar show-weekdate true

# Turn off auto brightness
gsettings set org.gnome.settings-daemon.plugins.power ambient-enabled false

# Turn on night light
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
gsettings set org.gnome.settings-daemon.plugins.color night-light-temperature 2500

# Use 6 fixed workspaces instead of dynamic mode
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.mutter workspaces-only-on-primary true
gsettings set org.gnome.desktop.wm.preferences num-workspaces 6
gsettings set org.gnome.shell.app-switcher current-workspace-only true

# Make alacritty default terminal emulator
gsettings set org.gnome.desktop.default-applications.terminal exec 'alacritty'
gsettings set org.gnome.desktop.default-applications.terminal exec-arg ''

# Install sudoers rule for GDM background management
sudo cp "$HOME/.local/share/omarell/default/gdm/sudoers" /etc/sudoers.d/gdm-wrapper 2>/dev/null
sudo chmod 440 /etc/sudoers.d/gdm-wrapper 2>/dev/null

# Set GDM background (default)
source ~/.local/share/omarell/bin/scripts/omarell-refresh-gdm