# Remove unused libraries
sudo apt remove -y ppa-purge

# Rename omakub to omarell
if [ -d "$HOME/.local/share/omakub" ]; then
  mv "$HOME/.local/share/omakub" "$HOME/.local/share/omarell"
fi

#
source "~/.local/share/omarell/install/terminal/0-config.sh"
source "~/.local/share/omarell/install/desktop/app-chromium.sh"
source "~/.local/share/omarell/install/desktop/backgrounds.sh"

source "~/.local/share/omarell/default/bash/shell"

# Install ffmpeg for video support
sudo apt install -y ffmpeg

# Changes in Tactile
gsettings set org.gnome.shell.extensions.tactile col-0 1
gsettings set org.gnome.shell.extensions.tactile col-1 1
gsettings set org.gnome.shell.extensions.tactile col-2 1
gsettings set org.gnome.shell.extensions.tactile col-3 1
gsettings set org.gnome.shell.extensions.tactile row-0 1
gsettings set org.gnome.shell.extensions.tactile row-1 1
gsettings set org.gnome.shell.extensions.tactile gap-size 10

# Remove ulauncher
if command -v ulauncher &> /dev/null; then
  sudo apt remove --purge -y ulauncher
  rm -rf ~/.config/ulauncher
  rm -rf ~/.local/share/ulauncher
fi

# Install wofi
sudo apt install -y wofi

# Set wofi as the launcher
gsettings set org.gnome.desktop.wm.keybindings switch-input-source "@as []"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'Wofi'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'wofi-launcher'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Super>space'

# Select current theme
THEME_NAMES=("Tokyo Night" "Catppuccin" "Nord" "Everforest" "Gruvbox" "Kanagawa")
OMARELL_FIRST_RUN_THEME=$(gum choose "${THEME_NAMES[@]}" ">> Skip" --header "Choose your current theme" --height 10 | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

source "~/.local/share/omarell/install/desktop/set-theme.sh"

# Change desktop applications
sudo rm -rf .local/share/applications/About.desktop
sudo rm -rf .local/share/applications/Activity.desktop
sudo rm -rf .local/share/applications/Neovim.desktop
sudo rm -rf .local/share/applications/Docker.desktop
sudo rm -rf .local/share/applications/Omarell.desktop
source ~/.local/share/omarell/applications/About.sh
source ~/.local/share/omarell/applications/Activity.sh
source ~/.local/share/omarell/applications/Neovim.sh
source ~/.local/share/omarell/applications/Docker.sh
source ~/.local/share/omarell/applications/Omarell.sh

# Autoremove unused packages
sudo apt autoremove -y