#!/bin/bash

# List of packages to install for GNOME desktop environment
packages=(
  gdm3
  systemd-container
)

# Install GNOME desktop environment
sudo apt install -y --no-install-recommends "${packages[@]}"

# Mark essential GNOME packages as manually installed to prevent autoremoval
sudo apt-mark manual "${packages[@]}"

# Use Wayland by default
sudo sed -i 's/^#WaylandEnable=false/WaylandEnable=true/' /etc/gdm3/custom.conf

# Enable GDM3 service
sudo systemctl enable gdm3

# ==============================================================================
# GDM OMARELL LOGO SETUP
# ==============================================================================

# Get the directory where this script is located
OMARELL_GDM_LOGO="$HOME/.local/share/omarell/default/gdm/logo.png"
OMARELL_GDM_BACKGROUND="$HOME/.local/share/omarell/default/gdm/background.png"

# Copy Omarell logo and background to system directory
sudo mkdir -p /usr/share/pixmaps/omarell/
if [ -f "$OMARELL_GDM_LOGO" ]; then
  sudo cp "$OMARELL_GDM_LOGO" /usr/share/pixmaps/omarell/gdm-logo.png
fi
if [ -f "$OMARELL_GDM_BACKGROUND" ]; then
  sudo cp "$OMARELL_GDM_BACKGROUND" /usr/share/pixmaps/omarell/gdm-background.png
fi

# Add logo and background settings to GDM configuration
sudo tee -a /etc/gdm3/greeter.dconf-defaults > /dev/null <<'EOF'

# Omarell GDM Configuration
[org/gnome/login-screen]
logo='/usr/share/pixmaps/omarell/gdm-logo.png'

[com/ubuntu/login-screen]
background-picture-uri='/usr/share/pixmaps/omarell/gdm-background.png'
background-picture-uri-dark='/usr/share/pixmaps/omarell/gdm-background.png'
background-size='zoom'
EOF

# Update dconf database
sudo dconf update
sudo glib-compile-schemas /usr/share/glib-2.0/schemas/
