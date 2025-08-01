#!/bin/bash

# Install and configure NetworkManager
sudo apt install -y network-manager

# Backup existing config
sudo mkdir -p /etc/netplan/backup
sudo cp /etc/netplan/*.yaml /etc/netplan/backup/ 2>/dev/null

# Disable conflicting services
sudo systemctl disable --now systemd-networkd 2>/dev/null

# Configure netplan for NetworkManager
sudo tee /etc/netplan/01-network-manager-all.yaml >/dev/null <<EOF
network:
  version: 2
  renderer: NetworkManager
  ethernets:
    all-eth:
      match:
        name: "e*"
      dhcp4: true
  wifis:
    all-wifi:
      match:
        name: "w*"
      dhcp4: true
      access-points: {}
EOF

sudo chmod 600 /etc/netplan/01-network-manager-all.yaml
sudo netplan apply
sudo systemctl enable --now NetworkManager