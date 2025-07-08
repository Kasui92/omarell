CHOICES=(
	"Omarell       Update Omarell itself and run any migrations"
	"System        Update all system packages and remove unused packages"
	"Firmware      Update firmware packages"
	"LazyGit       TUI for Git"
	"LazyDocker    TUI for Docker"
	"Neovim        Text editor that runs in the terminal"
	"Zellij        Adds panes, tabs, and sessions to the terminal"
	"<< Back       "
)

CHOICE=$(gum choose "${CHOICES[@]}" --height 10 --header "Update manually-managed applications")

if [[ "$CHOICE" == "<< Back"* ]] || [[ -z "$CHOICE" ]]; then
	# Don't update anything
	echo ""
else
	INSTALLER=$(echo "$CHOICE" | awk -F ' {2,}' '{print $1}' | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

	case "$INSTALLER" in
	"omarell") INSTALLER_FILE="$OMARELL_PATH/bin/omarell-sub/update/migrate.sh" ;;
	"system") INSTALLER_FILE="$OMARELL_PATH/bin/omarell-sub/update/update-system.sh" ;;
	"firmware") INSTALLER_FILE="$OMARELL_PATH/bin/omarell-sub/update/update-firmware.sh" ;;
	*) INSTALLER_FILE="$OMARELL_PATH/install/terminal/app-$INSTALLER.sh" ;;
	esac

	source $INSTALLER_FILE && gum spin --spinner globe --title "Update completed!" -- sleep 3
fi

clear
source $OMARELL_PATH/bin/omarell
