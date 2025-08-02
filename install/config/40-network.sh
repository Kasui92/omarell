#!/bin/bash

# Install and configure NetworkManager
sudo apt install -y network-manager

# Create a service to switch from systemd-networkd to NetworkManager
if [ ! -f /etc/systemd/system/omarell-network-switch.service ]; then
  cat <<EOF | sudo tee /etc/systemd/system/omarell-network-switch.service
[Unit]
Description=Migrate from systemd-networkd to NetworkManager
After=network.target

[Service]
Type=oneshot
ExecStart=/bin/bash -c '
  echo "[Omarell] Switching from systemd-networkd to NetworkManager..."
  cp /etc/netplan/50-cloud-init.yaml /etc/netplan/50-cloud-init.yaml.bak
  echo "network:
  version: 2
  renderer: NetworkManager" > /etc/netplan/50-cloud-init.yaml
  systemctl disable systemd-networkd.service systemd-networkd-wait-online.service
  systemctl enable NetworkManager
  netplan apply
  echo "[Omarell] NetworkManager is now enabled and configured."
  rm -f /etc/systemd/system/omarell-network-switch.service
  systemctl daemon-reexec
'
RemainAfterExit=no

[Install]
WantedBy=multi-user.target
EOF
fi

# Enable the service to run on the next boot
sudo systemctl enable omarell-network-switch.service