# Remove snap
sudo systemctl stop snapd
sudo systemctl disable snapd
sudo apt autoremove --purge -y snapd gnome-software-plugin-snap
sudo rm -rf ~/snap /snap /var/snap /var/lib/snapd

# Prevent snapd from being reinstalled
sudo apt-mark hold snapd

# Clean packages
sudo apt autoremove --purge -y
sudo apt clean
