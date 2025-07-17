# Optional Apps
if [[ -v OMARELL_FIRST_RUN_OPTIONAL_APPS ]]; then
	apps=$OMARELL_FIRST_RUN_OPTIONAL_APPS

	if [[ -n "$apps" ]]; then
		for app in $apps; do
			source "$HOME/.local/share/omarell/install/desktop/optional/app-${app,,}.sh"
		done
	fi
fi

# Apps
# Copy and sync icon files
mkdir -p ~/.local/share/icons/hicolor/48x48/apps/
cp ~/.local/share/omarell/applications/icons/*.png ~/.local/share/icons/hicolor/48x48/apps/
gtk-update-icon-cache

# Copy .desktop declarations
mkdir -p ~/.local/share/applications
cp ~/.local/share/omarell/applications/*.desktop ~/.local/share/applications/

update-desktop-database ~/.local/share/applications