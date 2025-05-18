if ! xdg-open "https://manual.omakub.org" &>/dev/null; then
  echo -e "\033[1;35mUnable to open the manual in your browser.\033[0m"
fi
source $OMAKUB_PATH/bin/omakub-sub/menu.sh
