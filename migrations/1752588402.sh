# Change desktop applications
sudo rm -rf "$HOME/.local/share/applications/About.desktop"
sudo rm -rf "$HOME/.local/share/applications/Activity.desktop"
sudo rm -rf "$HOME/.local/share/applications/Neovim.desktop"
sudo rm -rf "$HOME/.local/share/applications/Docker.desktop"
sudo rm -rf "$HOME/.local/share/applications/Omarell.desktop"

# Source new application scripts
source "$HOME/.local/share/omarell/install/desktop/xtras.sh"