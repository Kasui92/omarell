#!/bin/bash

# List of packages to install for GNOME desktop environment
packages=(
  adwaita-icon-theme
  dbus
  dbus-x11
  gir1.2-gtop-2.0
  gir1.2-clutter-1.0
  gnome-control-center
  gnome-keyring
  gnome-session
  gnome-settings-daemon
  gnome-shell
  gsettings-desktop-schemas
  ibus
  mutter
  xdg-user-dirs
  yaru-theme-gnome-shell
  yaru-theme-gtk
  yaru-theme-icon
)

# Install GNOME desktop environment
sudo apt install -y --no-install-recommends "${packages[@]}"

# Mark essential GNOME packages as manually installed to prevent autoremoval
sudo apt-mark manual "${packages[@]}"

# Remove X11 packages if not needed
sudo apt remove -y snapd apport popularity-contest whoopsie || true
# Clean up unnecessary packages
sudo apt autoremove -y