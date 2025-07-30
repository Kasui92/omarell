#!/bin/bash

folders=(
  "Utilities"
  "Sundry"
  "YaST"
  "Updates"
  "Xtra"
)

# Default folders
folder_string=$(printf "'%s'," "${folders[@]}" | sed 's/,$//g')
gsettings set org.gnome.desktop.app-folders folder-children "[$folder_string]"
gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/Updates/ name 'Install & Update'
gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/Updates/ apps "['org.gnome.Software.desktop', 'software-properties-drivers.desktop', 'software-properties-gtk.desktop', 'update-manager.desktop', 'firmware-updater_firmware-updater.desktop', 'snap-store_snap-store.desktop']"
gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/Xtra/ name 'Xtra'
gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/Xtra/ apps "['gnome-language-selector.desktop', 'org.gnome.PowerStats.desktop', 'yelp.desktop', 'org.gnome.eog.desktop']"