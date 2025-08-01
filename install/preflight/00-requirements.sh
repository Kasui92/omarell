#!/bin/bash

if [ ! -f /etc/os-release ]; then
  echo "$(tput setaf 1)Error: Unable to determine OS. /etc/os-release file not found."
  echo "Installation stopped."
  exit 1
fi

. /etc/os-release

# Check if running on Ubuntu 24.04 (Only LTS version supported)
if [ "$ID" != "ubuntu" ] || [ $(echo "$VERSION_ID = 24.04" | bc) != 1 ]; then
  echo "$(tput setaf 1)Error: OS requirement not met"
  echo "You are currently running: $ID $VERSION_ID"
  echo "OS required: Ubuntu 24.04"
  echo "Installation stopped."
  exit 1
fi

# Check if running on x86
ARCH=$(uname -m)
if [ "$ARCH" != "x86_64" ] && [ "$ARCH" != "i686" ]; then
  echo "$(tput setaf 1)Error: Unsupported architecture detected"
  echo "Current architecture: $ARCH"
  echo "This installation is only supported on x86 architectures (x86_64 or i686)."
  echo "Installation stopped."
  exit 1
fi

# Check if there is a DE installed, if yes then exit
if [ -n "$XDG_CURRENT_DESKTOP" ]; then
  echo "$(tput setaf 1)Error: A desktop environment is already installed."
  echo "Current desktop environment: $XDG_CURRENT_DESKTOP"
  echo "Omarell is designed to be installed on a fresh system without a desktop environment."
  echo "Installation stopped."
  exit 1
fi