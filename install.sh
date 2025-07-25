#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Give people a chance to retry running the installation
catch_errors() {
  echo -e "\n\e[31mOmarell installation failed!\e[0m"
  echo "You can retry by running: bash ~/.local/share/omarell/install.sh"
}

trap catch_errors ERR

# Check the distribution name and version and abort if incompatible
source ~/.local/share/omarell/install/check-version.sh

# Ask for app choices
echo -e "\e[32m\nGet ready to make a few choices...\e[0m"
source ~/.local/share/omarell/install/terminal/required/gum.sh >/dev/null
source ~/.local/share/omarell/install/first-run-choices.sh
source ~/.local/share/omarell/install/identification.sh

# Desktop software and tweaks will only be installed if we're running Gnome
if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
  # Ensure computer doesn't go to sleep or lock while installing
  gsettings set org.gnome.desktop.screensaver lock-enabled false
  gsettings set org.gnome.desktop.session idle-delay 0

  echo -e "\e[32m\nInstalling terminal and desktop tools...\e[0m"

  # Install terminal tools
  source ~/.local/share/omarell/install/terminal.sh

  # Install desktop tools and tweaks
  source ~/.local/share/omarell/install/desktop.sh

  # Revert to normal idle and lock settings
  gsettings set org.gnome.desktop.screensaver lock-enabled true
  gsettings set org.gnome.desktop.session idle-delay 300

  # Ensure locate is up to date now that everything has been installed
  sudo updatedb

  # Reboot to pickup changes
  gum confirm "Now everything is built as it should be. Reboot and let's see!" && sudo reboot
else
  echo -e "\n\e[32mOnly installing terminal tools...\e[0m"
  source ~/.local/share/omarell/install/terminal.sh
fi