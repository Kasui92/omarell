#!/bin/bash

echo -e "\e[32m\nUpdate Gnome Settings ...\e[0m"

# Turn off auto brightness
gsettings set org.gnome.settings-daemon.plugins.power ambient-enabled false

# Turn on night light
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
gsettings set org.gnome.settings-daemon.plugins.color night-light-temperature 2500

# Use 6 fixed workspaces instead of dynamic mode
gsettings set org.gnome.shell.app-switcher current-workspace-only true

# Apply Application Refresh
source "$HOME/.local/share/omarell/bin/scripts/omarell-refresh-applications" || true