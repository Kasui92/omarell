CHOICES=(
  "Dev Languages    "
  "Mainline Kernels "
  "Audacity         "
  "DBeaver          "
  "Discord          "
  "FastFetch        "
  "Figma            "
  "Filezilla        "
  "Firefox          "
  "Flameshot        "
  "Google Chrome    "
  "Microsoft Edge   "
  "NeoVim           "
  "LocalSend        "
  "Obs Studio       "
  "Obsidian         "
  "OnlyOffice       "
  "Pinta            "
  "Postman          "
  "Spotify          "
  "Thunderbird      "
  "Vlc              "
  "Zen              "
  "Xournalpp        "
  "> All            Remove all applications"
  "<< Back          "
)

CHOICE=$(gum choose "${CHOICES[@]}" --height 29 --header "Uninstall application")

if [[ "$CHOICE" == "<< Back"* ]] || [[ -z "$CHOICE" ]]; then
  # Don't install anything
  echo ""
elif [[ "$CHOICE" == "> All"* ]]; then
  UNINSTALLER_FILE=$(gum file $OMAKUB_PATH/uninstall)

  [[ -n "$UNINSTALLER_FILE" ]] &&
    gum confirm "Run uninstaller?" &&
    source $UNINSTALLER_FILE &&
    gum spin --spinner globe --title "Uninstall completed!" -- sleep 3
else
  UNINSTALLER=$(echo "$CHOICE" | awk -F ' {2,}' '{print $1}' | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

  case "$UNINSTALLER" in
  "docker") UNINSTALLER_FILE="$OMAKUB_PATH/uninstall/docker.sh" ;;
  "dev-language") UNINSTALLER_FILE="$OMAKUB_PATH/uninstall/dev-language.sh" ;;
  *) UNINSTALLER_FILE="$OMAKUB_PATH/uninstall/app-$UNINSTALLER.sh" ;;
  esac

  [[ -n "$UNINSTALLER_FILE" ]] &&
    gum confirm "Run uninstaller?" &&
    source $UNINSTALLER_FILE &&
    gum spin --spinner globe --title "Uninstall completed!" -- sleep 3
fi

clear
source $OMAKUB_PATH/bin/omakub
