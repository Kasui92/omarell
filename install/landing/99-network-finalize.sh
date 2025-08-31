#!/bin/bash

# Disable systemd-networkd services
sudo systemctl disable systemd-networkd.service systemd-networkd-wait-online.service

# Add NetworkManager configuration to netplan
NETPLAN_FILE="/etc/netplan/50-cloud-init.yaml"
if [ -f "$NETPLAN_FILE" ]; then
  # Update existing file to use NetworkManager as renderer
  if sudo grep -q "renderer:" "$NETPLAN_FILE"; then
    sudo sed -i 's/renderer: .*/renderer: NetworkManager/' "$NETPLAN_FILE"
  else
    sudo sed -i '/version: 2/a \  renderer: NetworkManager' "$NETPLAN_FILE"
  fi
else
  # Create a minimal netplan config if none exists
  cat <<EOF | sudo tee "$NETPLAN_FILE"
network:
  version: 2
  renderer: NetworkManager
EOF
fi

# Enable NetworkManager service
sudo systemctl enable NetworkManager

# Apply netplan configuration
sudo netplan apply