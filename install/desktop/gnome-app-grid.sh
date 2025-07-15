# Remove Btop entry for one that runs in alacritty
sudo rm -rf /usr/share/applications/btop.desktop

# App doesn't do anything when started from the app grid
sudo rm -rf /usr/share/applications/org.flameshot.Flameshot.desktop

# Remove the ImageMagick icon
sudo rm -rf /usr/share/applications/display-im6.q16.desktop

# Replacing this with btop
sudo rm -rf /usr/share/applications/org.gnome.SystemMonitor.desktop

# We added our own meant for Alacritty
sudo rm -rf /usr/local/share/applications/nvim.desktop
sudo rm -rf /usr/local/share/applications/vim.desktop

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

# Add LibreOffice apps to a dedicated folder if it was selected during installation
if grep -q "libreoffice" <<< "$OMARELL_FIRST_RUN_OPTIONAL_APPS"; then
  # Create a LibreOffice folder and add all LibreOffice apps to it
  if [[ ! " ${folders[*]} " =~ " LibreOffice " ]]; then
    folders+=("LibreOffice")
    folder_string=$(printf "'%s'," "${folders[@]}" | sed 's/,$//g')
    gsettings set org.gnome.desktop.app-folders folder-children "[$folder_string]"
  fi

  # Set the LibreOffice folder properties
  gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/LibreOffice/ name 'LibreOffice'
  gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/LibreOffice/ apps "['libreoffice-base.desktop', 'libreoffice-calc.desktop', 'libreoffice-draw.desktop', 'libreoffice-impress.desktop', 'libreoffice-math.desktop', 'libreoffice-startcenter.desktop', 'libreoffice-writer.desktop', 'libreoffice-xsltfilter.desktop']"
fi