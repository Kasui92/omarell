#!/bin/bash

mkdir -p ~/.local/share/fonts

sudo apt install -y --no-install-recommends \
  fonts-ubuntu fonts-dejavu-core fonts-noto-color-emoji fonts-liberation2

cd /tmp
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaMono.zip
unzip CascadiaMono.zip -d CascadiaFont
cp CascadiaFont/*.ttf ~/.local/share/fonts
rm -rf CascadiaMono.zip CascadiaFont

if [ -z "$OMARELL_BARE" ]; then
  echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
  sudo apt install ttf-mscorefonts-installer -y
fi

fc-cache
cd -
