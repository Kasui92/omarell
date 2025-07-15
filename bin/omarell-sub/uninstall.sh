CHOICES=(
  "Docker            "
  "Mainline Kernels  "
  "Discord           "
  "Firefox           "
  "Flameshot         "
  "Libreoffice       "
  "LocalSend         "
  "NeoVim            "
  "Pinta             "
  "Spotify           "
  "Visual Studio Code"
  "Vlc               "
  "Xournalpp         "
  "> All             Remove all applications"
  "<< Back           "
)

CHOICE=$(gum choose "${CHOICES[@]}" --height 29 --header "Uninstall application")

if [[ "$CHOICE" == "<< Back"* ]] || [[ -z "$CHOICE" ]]; then
  # Don't install anything
  echo ""
elif [[ "$CHOICE" == "> All"* ]]; then
  UNINSTALLER_FILE=$(gum file $HOME/.local/share/omarell/uninstall)

  [[ -n "$UNINSTALLER_FILE" ]] &&
    gum confirm "Run uninstaller?" &&
    source $UNINSTALLER_FILE &&
    gum spin --spinner globe --title "Uninstall completed!" -- sleep 3
else
  UNINSTALLER=$(echo "$CHOICE" | awk -F ' {2,}' '{print $1}' | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

  case "$UNINSTALLER" in
  *) UNINSTALLER_FILE="$HOME/.local/share/omarell/uninstall/$UNINSTALLER.sh" ;;
  esac

  [[ -n "$UNINSTALLER_FILE" ]] &&
    gum confirm "Run uninstaller?" &&
    source $UNINSTALLER_FILE &&
    gum spin --spinner globe --title "Uninstall completed!" -- sleep 3
fi

clear
source $HOME/.local/share/omarell/bin/omarell
