#!/bin/bash

# Install and configure NetworkManager
sudo apt install -y network-manager dbus

# Disable systemd-networkd services
sudo systemctl disable systemd-networkd.service systemd-networkd-wait-online.service

# Create a basic netplan configuration file
cp /etc/netplan/50-cloud-init.yaml /etc/netplan/50-cloud-init.yaml.bak
cat <<EOF | sudo tee /etc/netplan/50-cloud-init.yaml
network:
  version: 2
  renderer: NetworkManager
EOF

# Enable NetworkManager service
sudo systemctl enable NetworkManager
