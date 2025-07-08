CHOICES=(
  "Cursor              AI Code Editor"
  "DBeaver             Database management tool"
  "Figma               Collaborative interface design tool"
  "Filezilla           FTP client application"
  "Postman             API platform for building and using APIs"
  "Visual Studio Code  Source code editor with support for development operations"
  "Windsurf            Another AI Code Editor"
  "<< Back             "
)

CHOICE=$(gum choose "${CHOICES[@]}" --height 10 --header "Install dev tools")

if [[ "$CHOICE" == "<< Back"* ]] || [[ -z "$CHOICE" ]]; then
  # Don't install anything
  echo ""
else
  INSTALLER=$(echo "$CHOICE" | awk -F ' {2,}' '{print $1}' | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')
  INSTALLER_FILE="$OMARELL_PATH/install/desktop/optional/app-$INSTALLER.sh"

  source $INSTALLER_FILE && gum spin --spinner globe --title "Install completed!" -- sleep 3
fi

clear
source $OMARELL_PATH/bin/omarell-sub/header.sh
source $OMARELL_PATH/bin/omarell-sub/install.sh
