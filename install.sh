#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -eE

show_logo() {
  clear
  echo -e "\n\e[1;36m$(cat ~/.local/share/omakub/logo.txt)\e[0m"
  echo
}

show_subtext() {
  echo "$1" | tte --frame-rate ${3:-640} ${2:-wipe}
  echo
}

export PATH="$HOME/.local/share/omakub/bin:$PATH"
OMAKUB_INSTALL=~/.local/share/omakub/install

# Install prerequisites
for installer in $OMAKUB_INSTALL/preflight/*.sh; do
  source "$installer"
done

# Packages
show_logo
show_subtext "Installing packages [1/3]"
for installer in $OMAKUB_INSTALL/packages/*.sh; do
  source "$installer"
done

# Configuration
show_logo
show_subtext "Apply Omakub configuration! [2/3]"
for installer in $OMAKUB_INSTALL/config/*.sh; do
  source "$installer"
done


# Final cleanup
show_logo
show_subtext "Preparing system and cleaning up [3/3]"
for installer in $OMAKUB_INSTALL/landing/*.sh; do
  source "$installer"
done

# Reboot
show_logo
show_subtext "You're done! So we'll be rebooting now..."

sleep 2
reboot