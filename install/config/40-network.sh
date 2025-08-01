#!/bin/bash

sudo apt install -y network-manager dbus

# Ensure netplan is installed
if ! command -v netplan &>/dev/null; then
  sudo apt install -y netplan.io
fi

# Disable systemd-networkd and systemd-resolved if they are running
sudo systemctl disable --now systemd-networkd
sudo systemctl disable --now systemd-resolved

# Ensure NetworkManager is enabled and running
sudo systemctl enable --now NetworkManager

# Create a basic netplan configuration
# This will be used by NetworkManager to manage the network
# and will be overridden by the user later if needed
sudo cat <<EOF > /etc/netplan/01-network-manager-all.yaml
network:
  version: 2
  renderer: NetworkManager
EOF

# Apply the netplan configuration
sudo netplan generate
sudo netplan apply