CHOICES=(
	"Install       Install addon by name or URL"
	"Uninstall     Remove installed addon"
	"List          Show installed addons"
	"<< Back       "
)

CHOICE=$(gum choose "${CHOICES[@]}" --height $((${#CHOICES[@]} + 2)) --header "Manage addons")

if [[ "$CHOICE" == "<< Back"* ]] || [[ -z "$CHOICE" ]]; then
	# Don't update anything
	echo ""
else
	ACTION=$(echo "$CHOICE" | awk -F ' {2,}' '{print $1}' | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

	case "$ACTION" in
	"install") ACTION_FILE="$HOME/.local/share/omarell/bin/omarell-sub/addons/install.sh" ;;
	"uninstall") ACTION_FILE="$HOME/.local/share/omarell/bin/omarell-sub/addons/uninstall.sh" ;;
	"list") ACTION_FILE="$HOME/.local/share/omarell/bin/omarell-sub/addons/list.sh" ;;
	esac

	source $ACTION_FILE && gum spin --spinner globe --title "Action completed!" -- sleep 2
fi

clear
source $HOME/.local/share/omarell/bin/omarell
