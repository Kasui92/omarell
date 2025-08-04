#!/bin/bash

# Disable systemd-networkd services
sudo systemctl disable systemd-networkd.service systemd-networkd-wait-online.service
# Enable NetworkManager service
sudo systemctl enable NetworkManager
# Apply netplan configuration
sudo netplan apply