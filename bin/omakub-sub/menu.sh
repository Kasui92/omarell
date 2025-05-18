CHOICES=(
	"Appearance       "
	"Update           "
	"Install          "
	"Uninstall        "
	"Manual           "
	"Quit             "
)

CHOICE=$(gum choose "${CHOICES[@]}" --height 10 --header "")

if [[ "$CHOICE" == "Quit"* ]] || [[ -z "$CHOICE" ]]; then
	clear
	exit 0
else
	MENU=$(echo "$CHOICE" | awk -F ' {2,}' '{print $1}' | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')
	source $OMAKUB_PATH/bin/omakub-sub/$MENU.sh
fi