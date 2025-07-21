#!/bin/bash

# This script sets the GDM background to the theme wallpaper
# source: https://github.com/mendhak/ubuntu-change-login-background

# blur the image
blurredpath=/tmp/blurred.jpg
current_background="$(readlink -f "$HOME/.config/omarell/current/background")"
convert $current_background -channel RGBA -blur 0x26 $blurredpath

# copy it to /usr/share/backgrounds
sudo mkdir -p /usr/share/backgrounds/gdm
sudo cp $blurredpath /usr/share/backgrounds/gdm/gdm-wallpaper
# Tell GDM to use it as a wallpaper
sudo machinectl shell gdm@ /bin/bash -c "gsettings set com.ubuntu.login-screen background-picture-uri 'file:///usr/share/backgrounds/gdm/gdm-wallpaper'; gsettings set com.ubuntu.login-screen background-size 'cover'"
# Display it back, just for troubleshooting
sudo machinectl shell gdm@ /bin/bash -c "gsettings get com.ubuntu.login-screen background-picture-uri; gsettings get com.ubuntu.login-screen background-size"