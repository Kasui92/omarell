#!/bin/bash

# Install GNOME desktop environment
sudo apt install -y --no-install-recommends \
  gnome-session \
  gnome-shell \
  gnome-control-center \
  gnome-settings-daemon \
  gnome-keyring \
  adwaita-icon-theme \
  gsettings-desktop-schemas \
  gdm3 \
  mutter \
  xwayland \
  libglib2.0-bin \
  xdg-user-dirs \
  dbus-x11

# Use Wayland by default
sudo sed -i 's/^#WaylandEnable=false/WaylandEnable=true/' /etc/gdm3/custom.conf

# Enable GDM3
sudo systemctl enable gdm3

# Remove X11 packages if not needed
sudo apt remove -y xserver-xorg* xserver-xorg* x11-* xinit xinput x11-common || true
sudo apt autoremove -y