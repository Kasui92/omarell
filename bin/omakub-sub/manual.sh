if ! xdg-open "https://manual.omakub.org" &>/dev/null; then
  echo "Unable to open the manual in your default browser."
fi
source $OMAKUB_PATH/bin/omakub-sub/menu.sh
