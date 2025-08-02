#!/bin/bash

# omarell-install: Install an app, specified by its name.
# Usage: omarell-install-app <app-name>

if [[ -z "$1" ]]; then
  echo "Usage: omarell-install-app <app-name>" >&2
  exit 1
fi

REQUIRED_APPS=(
  "neovim"
  "docker"
)

APP_NAME="$1"
APP_OPTIONAL_DIR="$HOME/.local/share/omarell/install/desktop/optional"

# Check if the optional directory exists
if [[ ! -d "$APP_OPTIONAL_DIR" ]]; then
  echo "Error: Optional directory $APP_OPTIONAL_DIR does not exist." >&2
  exit 1
fi

# If APP_OPTIONAL_PATH exists, source it to install the app
if [[ -f "$APP_OPTIONAL_DIR/$APP_NAME.sh" ]]; then
  source "$APP_OPTIONAL_DIR/$APP_NAME.sh"
# If the app is required, then install it using scripts
elif [[ " ${REQUIRED_APPS[@]} " =~ " ${APP_NAME} " ]]; then
  case "$APP_NAME" in
    "neovim") source "$HOME/.local/share/omarell/install/terminal/nvim.sh";;
    *)
      if [[ -f "$HOME/.local/share/omarell/install/terminal/$APP_NAME.sh" ]]; then
        source "$HOME/.local/share/omarell/install/terminal/$APP_NAME.sh"
      else
        echo "Error: No installation script found for $APP_NAME." >&2
        exit 1
      fi
      ;;
  esac
# If the app is not recognized, print an error message
else
  echo "Error: App $APP_NAME is not recognized or not available for installation." >&2
  exit 1
fi
