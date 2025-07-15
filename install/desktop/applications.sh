# Desktop applications setup script for Omarell
for script in ~/.local/share/omarell/applications/*.sh; do source $script; done

# Optional applications setup
if [[ -v OMARELL_FIRST_RUN_OPTIONAL_APPS ]]; then
	apps=$OMARELL_FIRST_RUN_OPTIONAL_APPS

	if [[ -n "$apps" ]]; then
		for app in $apps; do
			source "$HOME/.local/share/omarell/install/desktop/optional/app-${app,,}.sh"
		done
	fi
fi