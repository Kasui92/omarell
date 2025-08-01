#!/bin/bash

# Don't exit immediately on error - we want to handle errors gracefully
# set -e

OMARELL_INSTALL=~/.local/share/omarell/install

# Give people a chance to retry running the installation
catch_errors() {
  echo -e "\n\e[Omarell installation failed!\e[0m"
  echo "You can retry by running: bash ~/.local/share/omarell/install.sh"
}

trap catch_errors ERR

show_logo() {
  clear
  echo -e "\n\e[1;36m$(cat ~/Workspace/resources/omakasui/omarell-dev/logo.txt)\e[0m"
  echo
}

show_subtext() {
  echo "$1" | tte --frame-rate ${3:-640} ${2:-wipe}
  echo
}

# Install prerequisites
for installer in $OMARELL_INSTALL/install/preflight/*.sh; do
  source "$installer"
done

# Configuration
show_logo
show_subtext "Let's install Omarell! [1/5]"
for installer in $OMARELL_INSTALL/install/config/*.sh; do
  source "$installer"
done

# Terminal
show_logo
show_subtext "Installing terminal tools [2/5]"
for installer in $OMARELL_INSTALL/install/terminal/*.sh; do
  source "$installer"
done

# Desktop
show_logo
show_subtext "Installing desktop tools [3/5]"
for installer in $OMARELL_INSTALL/install/desktop/*.sh; do
  source "$installer"
done

# Apps
show_logo
show_subtext "Installing default applications [4/5]"
for installer in $OMARELL_INSTALL/install/apps/*.sh; do
  source "$installer"
done

# Updates
show_logo
show_subtext "Updating system packages [5/5]"
sudo updatedb
sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y
sudo apt autoremove -y && sudo apt clean

# Reboot
show_logo
show_subtext "You're done! So we'll be rebooting now..."
sleep 2
reboot