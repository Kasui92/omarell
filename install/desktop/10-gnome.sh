#!/bin/bash

# Install GNOME desktop environment
sudo apt install -y --no-install-recommends \
  gnome-session \
  gnome-shell \
  gnome-control-center \
  gnome-settings-daemon \
  gnome-keyring \
  adwaita-icon-theme \
  gsettings-desktop-schemas \
  gdm3 \
  mutter \
  xwayland \
  libglib2.0-bin \
  xdg-user-dirs \
  dbus-x11

# Use Wayland by default
sudo sed -i 's/^#WaylandEnable=false/WaylandEnable=true/' /etc/gdm3/custom.conf

# Disable GDM3 if not needed
sudo systemctl disable gdm3

# Enable GDM3 on the next boot
if [ ! -f /etc/systemd/system/omarell-enable-gdm.service ]; then
  cat << 'EOF' | sudo tee /etc/systemd/system/omarell-enable-gdm.service
[Unit]
Description=Abilita GDM al primo boot post installazione
After=multi-user.target

[Service]
Type=oneshot
ExecStart=/bin/bash -c '
  echo "[omarell] Abilitazione GDM post reboot..."
  systemctl enable gdm3
  rm -f /etc/systemd/system/omarell-enable-gdm.service
  systemctl daemon-reexec
'
RemainAfterExit=no

[Install]
WantedBy=multi-user.target
EOF
fi

sudo systemctl enable omarell-enable-gdm.service

# Remove X11 packages if not needed
sudo apt remove -y xserver-xorg* xserver-xorg* x11-* xinit xinput x11-common || true
sudo apt autoremove -y