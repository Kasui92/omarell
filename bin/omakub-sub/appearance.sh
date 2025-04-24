CHOICES=(
	"Theme         Change the theme of your system"
	"Font          Change the font family and size of the terminal"
	"<< Back       "
)

CHOICE=$(gum choose "${CHOICES[@]}" --height 5 --header "Change system appearance")

if [[ "$CHOICE" == "<< Back"* ]] || [[ -z "$CHOICE" ]]; then
	# Don't update anything
	echo ""
else
	APPEARANCE=$(echo "$CHOICE" | awk -F ' {2,}' '{print $1}' | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

	case "$APPEARANCE" in
	"theme") APPEARANCE_FILE="$OMAKUB_PATH/bin/omakub-sub/appearance/theme.sh" ;;
	"font") APPEARANCE_FILE="$OMAKUB_PATH/bin/omakub-sub/appearance/font.sh" ;;
	esac

	source $APPEARANCE_FILE && gum spin --spinner globe --title "Change completed!" -- sleep 3
fi

clear
source $OMAKUB_PATH/bin/omakub
