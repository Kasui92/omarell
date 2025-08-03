#!/bin/bash

# Optional Apps
if [ -z "$OMARELL_BARE" ]; then
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

# Remove Btop entry for one that runs in alacritty
sudo rm -rf /usr/share/applications/btop.desktop

# App doesn't do anything when started from the app grid
sudo rm -rf /usr/share/applications/org.flameshot.Flameshot.desktop

# Remove the ImageMagick icon
sudo rm -rf /usr/share/applications/display-im6.q16.desktop

# We added our own meant for Alacritty
sudo rm -rf /usr/local/share/applications/nvim.desktop
sudo rm -rf /usr/local/share/applications/vim.desktop

# Apps
source ~/.local/share/omarell/bin/scripts/omarell-refresh-applications || true