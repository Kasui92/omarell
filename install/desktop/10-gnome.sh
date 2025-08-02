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

# Mark essential GNOME packages as manually installed to prevent autoremoval
sudo apt-mark manual gnome-session gnome-shell gnome-control-center gnome-settings-daemon gnome-keyring gdm3 mutter

# Use Wayland by default
sudo sed -i 's/^#WaylandEnable=false/WaylandEnable=true/' /etc/gdm3/custom.conf

# Disable GDM3 temporarily during installation
sudo systemctl disable gdm3

# Create a one-time service to enable GDM3 on next boot
if [ ! -f /etc/systemd/system/omarell-enable-gdm.service ]; then
  cat << 'EOF' | sudo tee /etc/systemd/system/omarell-enable-gdm.service
[Unit]
Description=Enable GDM3 on first boot after Omarell installation
After=multi-user.target
Before=gdm.service

[Service]
Type=oneshot
ExecStart=/bin/bash -c '
  echo "[Omarell] Enabling GDM3 for graphical login..."
  systemctl enable gdm3
  echo "[Omarell] GDM3 enabled successfully"
  echo "[Omarell] Cleaning up one-time service..."
  systemctl disable omarell-enable-gdm.service
  rm -f /etc/systemd/system/omarell-enable-gdm.service
  systemctl daemon-reload
  echo "[Omarell] Setup complete. GDM3 will start on next reboot."
'
RemainAfterExit=yes

[Install]
WantedBy=graphical.target
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