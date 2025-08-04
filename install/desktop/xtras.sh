#!/bin/bash

# Optional Apps
if [[ -v OMARELL_FIRST_RUN_OPTIONAL_APPS ]]; then
	apps=$OMARELL_FIRST_RUN_OPTIONAL_APPS

	if [[ -n "$apps" ]]; then
		for app in $apps; do
			source "$HOME/.local/share/omarell/install/desktop/optional/${app,,}.sh"
		done
	fi
fi

# Refresh applications .desktop files
source "$HOME/.local/share/omarell/bin/scripts/omarell-refresh-applications" || true