CHOICES=(
  "Dev Language   Install programming language environment"
  "Figma          Collaborative interface design tool"
  "Filezilla      FTP application"
  "Firefox        Free and open source Web browser"
  "Google Chrome  Most popular web browser"
  "Microsoft Edge Chrome-based browser built by Microsoft"
  "Obsidian       Multi-platform note taking application"
  "OnlyOffice     Free collaborative online office suite"
  "Postman        API platform for building and using APIs"
  "Spotify        Stream music from the world's most popular service"
  "Thunderbird    Free email application that's easy to set up and customize"
  "Vlc            Free and open source cross-platform multimedia player"
  "> All          Re-run any of the default installers"
  "<< Back        "
)

CHOICE=$(gum choose "${CHOICES[@]}" --height 19 --header "Install application")

if [[ "$CHOICE" == "<< Back"* ]] || [[ -z "$CHOICE" ]]; then
  # Don't install anything
  echo ""
elif [[ "$CHOICE" == "> All"* ]]; then
  INSTALLER_FILE=$(gum file $OMAKUB_PATH/install)

  [[ -n "$INSTALLER_FILE" ]] &&
    gum confirm "Run installer?" &&
    source $INSTALLER_FILE &&
    gum spin --spinner globe --title "Install completed!" -- sleep 3
else
  INSTALLER=$(echo "$CHOICE" | awk -F ' {2,}' '{print $1}' | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

  case "$INSTALLER" in
  "dev-language") INSTALLER_FILE="$OMAKUB_PATH/install/terminal/select-dev-language.sh" ;;
  *) INSTALLER_FILE="$OMAKUB_PATH/install/desktop/optional/app-$INSTALLER.sh" ;;
  esac

  source $INSTALLER_FILE && gum spin --spinner globe --title "Install completed!" -- sleep 3
fi

clear
source $OMAKUB_PATH/bin/omakub
