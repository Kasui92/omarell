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

# Apps
source ~/.local/share/omarell/bin/scripts/omarell-refresh-applications || true