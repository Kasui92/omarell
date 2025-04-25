# This script check if there is a new version of Omarell available
if timeout 3 curl -s --head "https://api.github.com/repos/Kasui92/omarell/releases/latest" &>/dev/null; then
    last_release_tag=$(curl -s "https://api.github.com/repos/Kasui92/omarell/releases/latest" | grep -o '"tag_name": "[^"]*' | cut -d'"' -f4)
    if [ -n "$last_release_tag" ] && [ -f "$OMAKUB_PATH/version" ]; then
        last_release_number=${last_release_tag#v}
        last_release_number=${last_release_number//./}

        local_version_tag=$(cat "$OMAKUB_PATH/version")
        local_version_number=${local_version_tag#v}
        local_version_number=${local_version_number//./}

        if [ "$last_release_number" -gt "$local_version_number" ]; then
            echo -e "\033[1;35mA new version of Omarell is available! \033[1m\033[32m($last_release_tag)\033[0m"
            echo "" # Add spacing
        fi
    fi
fi

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