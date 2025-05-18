# Attempt to migrate btop config from omakub to btop if is not already set
if [ ! -f "$HOME/.config/btop/btop.conf" ]; then
  # Use Omakub btop config
  mkdir -p ~/.config/btop
  cp ~/.local/share/omakub/configs/btop.conf ~/.config/btop/btop.conf

  echo -e "\033[1;35mThe btop config file has been copied to ~/.config/btop/btop.conf, now you can change Activity theme using Omarell.\033[0m"
fi

gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/Xtra/ apps "['gnome-language-selector.desktop', 'org.gnome.PowerStats.desktop', 'yelp.desktop', 'org.gnome.eog.desktop']"