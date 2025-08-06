#!/bin/bash

# Base Packages
packages=(
  acpi
  acpid
  alsa-utils
  apt-transport-https
  autoconf
  automake
  bat
  bluez
  bluez-tools
  brightnessctl
  btop
  build-essential
  ca-certificates
  cmake
  curl
  dkms
  eza
  fd-find
  ffmpeg
  fzf
  git
  gnupg
  imagemagick
  jq
  libayatana-appindicator3-1
  libmagickwand-dev
  libnotify-bin
  libnotify-dev
  libspa-0.2-bluetooth
  libvips
  lsb-release
  mupdf
  mupdf-tools
  network-manager
  pipewire
  pkg-config
  playerctl
  plocate
  policykit-1-gnome
  rfkill
  ripgrep
  software-properties-common
  tar
  tldr
  tlp
  unzip
  wget
  wireplumber
  wl-clipboard
  zoxide
)

# Install packages
sudo apt install -y "${packages[@]}"

# Install Fastfetch
sudo add-apt-repository -y ppa:zhangsongcui3371/fastfetch
sudo apt update -y
sudo apt install -y fastfetch
