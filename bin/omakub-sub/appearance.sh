CHOICES=(
	"Theme         Change the theme of your system"
	"Font          Change the font of your terminal and editor"
	"<< Back       "
)

CHOICE=$(gum choose "${CHOICES[@]}" --height 4 --header "Choose your appearance")

if [[ "$CHOICE" == "<< Back"* ]] || [[ -z "$CHOICE" ]]; then
	# Don't update anything
	echo ""
else
	APPEARANCE=$(echo "$CHOICE" | awk -F ' {2,}' '{print $1}' | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

	case "$APPEARANCE" in
	"theme") APPEARANCE_FILE="$OMAKUB_PATH/bin/omakub-sub/theme/theme.sh" ;;
	"font") APPEARANCE_FILE="$OMAKUB_PATH/bin/omakub-sub/theme/font.sh" ;;
	esac
fi

clear
source $OMAKUB_PATH/bin/omakub
