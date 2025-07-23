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

# Apps
# Copy over Omarell applications
source "$HOME/.local/share/omarell/bin/omarell-refresh-applications.sh" || true