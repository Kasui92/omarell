#!/bin/bash

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

# Optional Apps
if [[ -v OMARELL_FIRST_RUN_OPTIONAL_APPS ]]; then
	apps=$OMARELL_FIRST_RUN_OPTIONAL_APPS

	if [[ -n "$apps" ]]; then
		for app in $apps; do
			source "$HOME/.local/share/omarell/install/desktop/optional/${app,,}.sh"
		done
	fi
fi

# Apps
# Copy over Omarell applications
source "$HOME/.local/share/omarell/bin/scripts/omarell-refresh-applications" || true