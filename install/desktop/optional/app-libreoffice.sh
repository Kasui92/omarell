# Work with Word, Excel, Powerpoint files
sudo apt install -y libreoffice

# If is not installation, add LibreOffice to the app grid
if ! grep -q "libreoffice" <<< "$OMARELL_FIRST_RUN_OPTIONAL_APPS"; then
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
fi