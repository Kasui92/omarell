sudo apt-get remove --purge -y "libreoffice*"
sudo apt-get -y clean
sudo apt-get -y autoremove

# Remove LibreOffice folder from app-grid
if gsettings get org.gnome.desktop.app-folders folder-children | grep -q "LibreOffice"; then
  # Get current folders list
  current_folders=$(gsettings get org.gnome.desktop.app-folders folder-children)

  # Remove LibreOffice from the list
  updated_folders=$(echo "$current_folders" | sed "s/'LibreOffice', //g" | sed "s/, 'LibreOffice'//g" | sed "s/'LibreOffice'//g")
  gsettings set org.gnome.desktop.app-folders folder-children "$updated_folders"
  gsettings reset-recursively org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/LibreOffice/
fi
