#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

OMARELL_INSTALL=~/.local/share/omarell/install

# Give people a chance to retry running the installation
catch_errors() {
  echo -e "\n\e[Omarell installation failed!\e[0m"
  echo "You can retry by running: bash ~/.local/share/omarell/install.sh"
}

trap catch_errors ERR

show_logo() {
  clear
  echo -e "\n\e[1;36m$(cat ~/.local/share/omarell/logo.txt)\e[0m"
  echo
}

show_subtext() {
  echo "$1" | tte --frame-rate ${3:-640} ${2:-wipe}
  echo
}

# Install prerequisites
for installer in $OMARELL_INSTALL/preflight/*.sh; do
  source "$installer"
done

# Configuration
show_logo
show_subtext "Let's install Omarell! [1/5]"
for installer in $OMARELL_INSTALL/config/*.sh; do
  source "$installer"
done

# Terminal
show_logo
show_subtext "Installing terminal tools [2/5]"
for installer in $OMARELL_INSTALL/terminal/*.sh; do
  source "$installer"
done

# Desktop
show_logo
show_subtext "Installing desktop tools [3/5]"
for installer in $OMARELL_INSTALL/desktop/*.sh; do
  source "$installer"
done

# Apps
show_logo
show_subtext "Installing default applications [4/5]"
for installer in $OMARELL_INSTALL/apps/*.sh; do
  source "$installer"
done

# Final cleanup
show_logo
show_subtext "Updating system packages & network [5/5]"
for installer in $OMARELL_INSTALL/postflight/*.sh; do
  source "$installer"
done

# Reboot
show_logo
show_subtext "You're done! So we'll be rebooting now..."
sleep 2
reboot