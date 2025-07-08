# This script installs btop, a resource monitor that shows usage and stats for processor, memory, disks, network and processes.
sudo apt install -y btop

# Use Omarell btop config
mkdir -p ~/.config/btop/themes
cp ~/.local/share/omarell/configs/btop.conf ~/.config/btop/btop.conf

