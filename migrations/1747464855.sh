# Attempt to migrate btop config from omakub to btop if is not already set
if [ ! -f "$HOME/.config/btop/btop.conf" ]; then
  # Use Omakub btop config
  mkdir -p ~/.config/btop/themes
  cp ~/.local/share/omakub/configs/btop.conf ~/.config/btop/btop.conf

  echo -e "\033[1;35mThe btop config file has been copied to ~/.config/btop/btop.conf, now you can change Activity theme using Omarell.\033[0m"
fi

# Update app in app grid
gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/Xtra/ apps "['gnome-language-selector.desktop', 'org.gnome.PowerStats.desktop', 'yelp.desktop', 'org.gnome.eog.desktop']"

# Update btop with theme_background = False
if grep -q "theme_background" ~/.config/btop/btop.conf; then
  sed -i 's/theme_background = true/theme_background = false/g' ~/.config/btop/btop.conf
else
  echo "theme_background = false" >> ~/.config/btop/btop.conf
fi