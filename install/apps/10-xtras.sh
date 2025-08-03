#!/bin/bash

# Apps
if [ -z "$OMARELL_BARE" ]; then
	# Install GNOME utilities
	sudo apt install -y \
		gnome-calculator \
    gnome-disk-utility \
    gnome-font-viewer \
		gnome-software \
		gnome-software-plugin-flatpak

	# Install additional applications
	apps=(
		"Flameshot"
		"Pinta"
		"LocalSend"
	)

	# Install optional apps
	for app in "${apps[@]}"; do
		if [[ -f "$HOME/.local/share/omarell/applications/install/${app,,}.sh" ]]; then
			source "$HOME/.local/share/omarell/applications/install/${app,,}.sh"
		else
			echo "Warning: Installation script for $app not found."
		fi
	done
fi

# Refresh applications .desktop files
source ~/.local/share/omarell/bin/scripts/omarell-refresh-applications || true