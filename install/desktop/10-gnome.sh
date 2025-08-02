#!/bin/bash

# List of packages to install for GNOME desktop environment
gnome_packages=(
  gnome-shell
  gnome-session
  gdm3
  mutter
  gnome-settings-daemon
  gnome-control-center
  gnome-keyring
  gsettings-desktop-schemas
  adwaita-icon-theme
  yaru-theme-gtk
  yaru-theme-icon
  yaru-theme-gnome-shell
  xdg-user-dirs
  dbus-x11
  ibus
  fonts-dejavu-core
)

# Install GNOME desktop environment
sudo apt install -y --no-install-recommends "${gnome_packages[@]}"

# Mark essential GNOME packages as manually installed to prevent autoremoval
sudo apt-mark manual "${gnome_packages[@]}"

# Use Wayland by default
sudo sed -i 's/^#WaylandEnable=false/WaylandEnable=true/' /etc/gdm3/custom.conf

# Enable GDM3 service
sudo systemctl enable gdm3

# Remove X11 packages if not needed
sudo apt remove -y snapd apport popularity-contest whoopsie || true
# Clean up unnecessary packages
sudo apt autoremove -y