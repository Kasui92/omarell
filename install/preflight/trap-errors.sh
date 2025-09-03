#!/bin/bash

# Give people a chance to retry running the installation
catch_errors() {
  echo -e "\n\e[31mOmakub installation failed!\e[0m"
  echo
  echo "This command halted with exit code $?:"
  echo "$BASH_COMMAND"
  echo

  if command -v gum >/dev/null && gum confirm "Retry installation?"; then
    bash ~/.local/share/omakub/install.sh
  else
    echo "You can retry later by running: bash ~/.local/share/omakub/install.sh"
  fi
}

trap catch_errors ERR
