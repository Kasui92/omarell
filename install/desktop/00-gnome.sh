#!/bin/bash

# List of packages to install for GNOME desktop environment
packages=(
  gnome-shell
  gnome-session
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
  dbus
  dbus-x11
  ibus
  fonts-dejavu-core
)

# Install GNOME desktop environment
sudo apt install -y --no-install-recommends "${packages[@]}"

# Mark essential GNOME packages as manually installed to prevent autoremoval
sudo apt-mark manual "${packages[@]}"

# Remove X11 packages if not needed
sudo apt remove -y snapd apport popularity-contest whoopsie || true
# Clean up unnecessary packages
sudo apt autoremove -y