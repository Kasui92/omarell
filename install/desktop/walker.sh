#!/bin/bash

sudo apt install -y meson ninja-build libwayland-dev wayland-protocols libgtk-4-dev gobject-introspection libgirepository1.0-dev gtk-doc-tools python3 valac

# GTK4 Layer Shell
# Check if GTK4 Layer Shell is already installed
if ! pkg-config --exists gtk4-layer-shell-0; then
  git clone https://github.com/wmww/gtk4-layer-shell.git /tmp/gtk4-layer-shell
  cd /tmp/gtk4-layer-shell
  meson setup -Dexamples=true -Ddocs=true -Dtests=true build
  ninja -C build
  sudo ninja -C build install
  sudo ldconfig
  cd -
fi

sudo apt install -y golang-go libvips libvips-dev

# Walker - Application launcher
git clone https://github.com/abenz1267/walker /tmp/walker
cd /tmp/walker/cmd
go build -x -o walker
sudo cp walker /usr/bin/
cd -

mkdir -p $HOME/.config/walker