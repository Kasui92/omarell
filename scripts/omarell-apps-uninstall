#!/bin/bash

# omarell-uninstall: Uninstall an app, specified by its name.
# Usage: omarell-uninstall-app <app-name>

if [[ -z "$1" ]]; then
  echo "Usage: omarell-uninstall-app <app-name>" >&2
  exit 1
fi

APP_NAME="$1"
APP_UNINSTALL_DIR="$HOME/.local/share/omarell/uninstall"

# Check if the uninstall directory exists
if [[ ! -d "$APP_UNINSTALL_DIR" ]]; then
  echo "Error: Uninstall directory $APP_UNINSTALL_DIR does not exist." >&2
  exit 1
fi

# If APP_UNINSTALL_PATH exists, source it to uninstall the app
if [[ -f "$APP_UNINSTALL_DIR/$APP_NAME.sh" ]]; then
  source "$APP_UNINSTALL_DIR/$APP_NAME.sh"
else
  echo "Error: App $APP_NAME is not recognized or not available for uninstallation." >&2
  exit 1
fi
