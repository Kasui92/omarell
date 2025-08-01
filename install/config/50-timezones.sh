#!/bin/bash

if ! command -v tzupdate &>/dev/null; then
  sudo apt install -y tzupdate
  sudo tee /etc/sudoers.d/omarell-tzupdate >/dev/null <<EOF
%wheel ALL=(root) NOPASSWD: /usr/bin/tzupdate, /usr/bin/timedatectl
EOF
  sudo chmod 0440 /etc/sudoers.d/omarell-tzupdate
fi
