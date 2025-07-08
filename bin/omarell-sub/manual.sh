if ! xdg-open "https://github.com/Kasui92/omarell/wiki" &>/dev/null; then
  echo -e "\nUnable to open the manual in your browser."
fi
source $OMARELL_PATH/bin/omarell-sub/menu.sh
