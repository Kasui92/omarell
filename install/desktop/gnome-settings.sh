#!/bin/bash

# Center new windows in the middle of the screen
gsettings set org.gnome.mutter center-new-windows true

# Set Cascadia Mono as the default monospace font
gsettings set org.gnome.desktop.interface monospace-font-name 'CaskaydiaMono Nerd Font 10'

# Reveal week numbers in the Gnome calendar
gsettings set org.gnome.desktop.calendar show-weekdate true

# Use 6 fixed workspaces instead of dynamic mode
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.mutter workspaces-only-on-primary true
gsettings set org.gnome.desktop.wm.preferences num-workspaces 6

# Remove the Ubuntu logo from the Plymouth splash screen
if [[ -f /usr/share/plymouth/ubuntu-logo.png ]]; then
  sudo mv /usr/share/plymouth/ubuntu-logo.png /usr/share/plymouth/ubuntu-logo.png.bak
fi

# Install sudoers rule for GDM background management
sudo cp "$HOME/.local/share/omarell/default/gdm/sudoers" /etc/sudoers.d/gdm-wrapper 2>/dev/null
sudo chmod 440 /etc/sudoers.d/gdm-wrapper 2>/dev/null