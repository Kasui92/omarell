#!/bin/bash

# Install and configure NetworkManager
sudo apt install -y network-manager

# Enable NetworkManager service
sudo systemctl enable NetworkManager.service

# Disable conflicting services
systemctl disable systemd-networkd.service systemd-networkd-wait-online.service

# Configure netplan for NetworkManager
sudo tee /etc/netplan/50-cloud-init.yaml > /dev/null <<EOF
network:
  version: 2
  renderer: NetworkManager
EOF