# Exit immediately if a command exits with a non-zero status
set -e

# Give people a chance to retry running the installation
trap 'echo -e "\033[1;35mOmarell installation failed! You can retry by running: source ~/.local/share/omakub/install.sh\033[0m"' ERR

# Check the distribution name and version and abort if incompatible
source ~/.local/share/omakub/install/check-version.sh

# Ask for app choices
echo -e "\033[1;35mGet ready to make a few choices...\033[0m"
source ~/.local/share/omakub/install/terminal/required/app-gum.sh >/dev/null
source ~/.local/share/omakub/install/first-run-choices.sh
source ~/.local/share/omakub/install/identification.sh

# Desktop software and tweaks will only be installed if we're running Gnome
if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
  # Ensure computer doesn't go to sleep or lock while installing
  gsettings set org.gnome.desktop.screensaver lock-enabled false
  gsettings set org.gnome.desktop.session idle-delay 0

  echo
  echo -e "\033[1;35mInstalling terminal and desktop tools...\033[0m"

  # Install terminal tools
  source ~/.local/share/omakub/install/terminal.sh

  # Install desktop tools and tweaks
  source ~/.local/share/omakub/install/desktop.sh

  # Revert to normal idle and lock settings
  gsettings set org.gnome.desktop.screensaver lock-enabled true
  gsettings set org.gnome.desktop.session idle-delay 300
else
  echo
  echo -e "\033[1;35mOnly installing terminal tools...\033[0m"
  source ~/.local/share/omakub/install/terminal.sh
fi