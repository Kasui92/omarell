CHOICES=(
  "Browser           Install alternative web browsers"
  "Dev Tools         Install development tools"
  "Dev Language      Install programming language environment"
  "Dev Database      Install development database in Docker"
  "Mainline Kernels  Install newer Linux kernels than Ubuntu defaults"
  "Audacity          Record and edit audio"
  "Discord           Voice, video and text chat for gamers"
  "FlameShot         Screenshot tool with annotation"
  "LocalSend         Send files to nearby devices"
  "Obsidian          Multi-platform note taking application"
  "OnlyOffice        Free collaborative online office suite"
  "Pinta             Simple and easy to use drawing program"
  "Spotify           Stream music from the world's most popular service"
  "Thunderbird       Free email application that's easy to set up and customize"
  "Vlc               Free and open source cross-platform multimedia player"
  "Xournalpp         Note taking and PDF annotation application"
  "> All             Re-run any of the default installers"
  "<< Back           "
)

CHOICE=$(gum choose "${CHOICES[@]}" --height 23 --header "Install application")

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
  "browser") INSTALLER_FILE="$OMAKUB_PATH/bin/omakub-sub/install/install-browser.sh" ;;
  "dev-tools") INSTALLER_FILE="$OMAKUB_PATH/bin/omakub-sub/install/install-dev-apps.sh" ;;
  "dev-language") INSTALLER_FILE="$OMAKUB_PATH/install/terminal/select-dev-language.sh" ;;
  "dev-database") INSTALLER_FILE="$OMAKUB_PATH/install/terminal/select-dev-storage.sh" ;;
  *) INSTALLER_FILE="$OMAKUB_PATH/install/desktop/optional/app-$INSTALLER.sh" ;;
  esac

  source $INSTALLER_FILE && gum spin --spinner globe --title "Install completed!" -- sleep 3
fi

clear
source $OMAKUB_PATH/bin/omakub
