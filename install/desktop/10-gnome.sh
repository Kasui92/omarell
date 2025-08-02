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
Description=Enable GDM3 on next boot
After=multi-user.target
Before=graphical.target

[Service]
Type=oneshot
ExecStart=/bin/bash -c '
  echo "[Omarell] Enabling GDM3 on next reboot..."
  if ! systemctl is-enabled gdm3 >/dev/null 2>&1; then
    systemctl enable gdm3
    echo "[Omarell] GDM3 enabled successfully"
  else
    echo "[Omarell] GDM3 is already enabled"
  fi
'
ExecStartPost=/bin/bash -c '
  systemctl disable omarell-enable-gdm.service
  rm -f /etc/systemd/system/omarell-enable-gdm.service
  systemctl daemon-reload
'
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
fi

sudo systemctl enable omarell-enable-gdm.service
sudo systemctl daemon-reload

# Disable getty@tty1.service only if not already disabled
if ! systemctl is-enabled getty@tty1.service | grep -q disabled; then
  sudo systemctl disable getty@tty1.service
fi


# Remove X11 packages if not needed
sudo apt remove -y xserver-xorg* xserver-xorg* x11-* xinit xinput x11-common || true
sudo apt autoremove -y