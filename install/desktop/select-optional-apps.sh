# Apps
if [[ -v OMARELL_FIRST_RUN_OPTIONAL_APPS ]]; then
	apps=$OMARELL_FIRST_RUN_OPTIONAL_APPS

	if [[ -n "$apps" ]]; then
		for app in $apps; do
			source "$OMARELL_PATH/install/desktop/optional/app-${app,,}.sh"
		done
	fi
fi

# Browsers
if [[ -v OMARELL_FIRST_RUN_OPTIONAL_BROWSER ]]; then
  browsers=$OMARELL_FIRST_RUN_OPTIONAL_BROWSER

  if [[ -n "$browsers" ]]; then
    for browser in $browsers; do
      BROWSER_INSTALLER=$(echo "$browser" | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')
      source "$OMARELL_PATH/install/desktop/optional/app-$BROWSER_INSTALLER.sh"

	  # Set as default-web-browser
	  if [[ -n "$OMARELL_FIRST_RUN_SYSTEM_DEFAULT_BROWSER" ]] && [[ "$OMARELL_FIRST_RUN_SYSTEM_DEFAULT_BROWSER" == "$browser" ]]; then
		xdg-settings set default-web-browser "${BROWSER_INSTALLER}.desktop"
	  fi
    done
  fi
fi

# Dev Apps
if [[ -v OMARELL_FIRST_RUN_OPTIONAL_DEV_APPS ]]; then
  dev_apps=$OMARELL_FIRST_RUN_OPTIONAL_DEV_APPS

  if [[ -n "$dev_apps" ]]; then
	for dev_app in $dev_apps; do
	  DEV_APP_INSTALLER=$(echo "$dev_app" | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')
	  source "$OMARELL_PATH/install/desktop/optional/app-$DEV_APP_INSTALLER.sh"
	done
  fi
fi
