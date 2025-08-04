#!/bin/bash

echo -e "\e[32m\nUpdate Gnome Settings ...\e[0m"

# Turn off auto brightness
gsettings set org.gnome.settings-daemon.plugins.power ambient-enabled false

# Turn on night light
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
gsettings set org.gnome.settings-daemon.plugins.color night-light-temperature 2500

# Use 6 fixed workspaces instead of dynamic mode
gsettings set org.gnome.shell.app-switcher current-workspace-only true

echo -e "\e[32m\nRefresh .desktop applications ...\e[0m"

# Apply Application Refresh
source "$HOME/.local/share/omarell/bin/scripts/omarell-refresh-applications" || true

echo -e "\e[32m\nUpdate GUM version ...\e[0m"

cd /tmp
GUM_VERSION="0.16.2"
wget -qO gum.deb "https://github.com/charmbracelet/gum/releases/download/v${GUM_VERSION}/gum_${GUM_VERSION}_amd64.deb"
sudo apt-get install -y --allow-downgrades ./gum.deb
rm gum.deb
cd -