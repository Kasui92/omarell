CHOICES=(
	"Theme         Change the theme of your system"
	"<< Back       "
)

CHOICE=$(gum choose "${CHOICES[@]}" --height 5 --header "Change system appearance")

if [[ "$CHOICE" == "<< Back"* ]] || [[ -z "$CHOICE" ]]; then
	# Don't update anything
	echo ""
else
	APPEARANCE=$(echo "$CHOICE" | awk -F ' {2,}' '{print $1}' | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

	case "$APPEARANCE" in
	"theme") APPEARANCE_FILE="$OMARELL_PATH/bin/omarell-sub/appearance/theme.sh" ;;
	esac

	source $APPEARANCE_FILE && gum spin --spinner globe --title "Change completed!" -- sleep 3
fi

clear
source $OMARELL_PATH/bin/omarell
