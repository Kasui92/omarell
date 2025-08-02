#!/bin/bash

# Optional Apps
if [ -z "$OMARELL_BARE" ]; then
	source "~/.local/share/omarell/applications/install/firefox.sh"
	source "~/.local/share/omarell/applications/install/chromium.sh"
	source "~/.local/share/omarell/applications/install/flameshot.sh"
	source "~/.local/share/omarell/applications/install/pinta.sh"
	source "~/.local/share/omarell/applications/install/localsend.sh"
fi

# Remove Btop entry for one that runs in alacritty
sudo rm -rf /usr/share/applications/btop.desktop

# App doesn't do anything when started from the app grid
sudo rm -rf /usr/share/applications/org.flameshot.Flameshot.desktop

# Remove the ImageMagick icon
sudo rm -rf /usr/share/applications/display-im6.q16.desktop

# Replacing this with btop
sudo rm -rf /usr/share/applications/org.gnome.SystemMonitor.desktop

# We added our own meant for Alacritty
sudo rm -rf /usr/local/share/applications/nvim.desktop
sudo rm -rf /usr/local/share/applications/vim.desktop

# Apps
source "~/.local/share/omarell/bin/scripts/omarell-refresh-applications" || true