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

# Copy Omarell logo to system directory
sudo mkdir -p /usr/share/pixmaps/omarell/
if [ -f "$OMARELL_GDM_LOGO" ]; then
  sudo cp "$OMARELL_GDM_LOGO" /usr/share/pixmaps/omarell/gdm-logo.png
fi

# Add logo setting to GDM configuration
sudo tee -a /etc/gdm3/greeter.dconf-defaults > /dev/null <<'EOF'

# Omarell GDM Logo
[org/gnome/login-screen]
logo='/usr/share/pixmaps/omarell/gdm-logo.png'
EOF

# Update dconf database
sudo dconf update
sudo glib-compile-schemas /usr/share/glib-2.0/schemas/
