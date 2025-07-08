CHOICES=(
  "Brave Browser     Privacy-focused web browser"
  "Firefox           Free and open source Web browser"
  "Zen               Lightweight web browser based on Firefox"
  "Google Chrome     Most popular web browser"
  "<< Back           "
)

CHOICE=$(gum choose "${CHOICES[@]}" --height 8 --header "Install editor")

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
