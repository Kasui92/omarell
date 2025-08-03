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
gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/Utilities/ name 'Utilities'
gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/Updates/ apps "['org.gnome.DiskUtility.desktop', 'org.gnome.tweaks.desktop', 'org.gnome.Evince.desktop']"
gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/Updates/ name 'Install & Update'
gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/Updates/ apps "['org.gnome.Software.desktop', 'software-properties-drivers.desktop', 'software-properties-gtk.desktop', 'update-manager.desktop', 'firmware-updater_firmware-updater.desktop', 'snap-store_snap-store.desktop']"
gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/Xtra/ name 'Xtra'
gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/Xtra/ apps "['gnome-language-selector.desktop', 'org.gnome.font-viewer.desktop', 'org.gnome.PowerStats.desktop', 'org.gnome.eog.desktop']"

# Check if the LibreOffice folder already exists
if gsettings get org.gnome.desktop.app-folders folder-children | grep -q "LibreOffice"; then
  # If it exists, remove the LibreOffice folder
  gsettings set org.gnome.desktop.app-folders folder-children "$(gsettings get org.gnome.desktop.app-folders folder-children | sed 's/LibreOffice//g')"
  gsettings reset-recursively org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/LibreOffice/
fi

# Get current folders and add LibreOffice to the list
current_folders=$(gsettings get org.gnome.desktop.app-folders folder-children)
if [[ ! "$current_folders" =~ "LibreOffice" ]]; then
  # Remove brackets from current folders string
  current_folders=$(echo "$current_folders" | sed 's/^\[//;s/\]$//')
  # Add LibreOffice to the list of folders with proper formatting
  gsettings set org.gnome.desktop.app-folders folder-children "[$current_folders, 'LibreOffice']"
fi

gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/LibreOffice/ name 'LibreOffice'
gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/LibreOffice/ apps "['libreoffice-base.desktop', 'libreoffice-calc.desktop', 'libreoffice-draw.desktop', 'libreoffice-impress.desktop', 'libreoffice-math.desktop', 'libreoffice-startcenter.desktop', 'libreoffice-writer.desktop', 'libreoffice-xsltfilter.desktop']"