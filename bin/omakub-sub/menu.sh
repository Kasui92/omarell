# This script check if there is a new version of Omarell available
last_release_tag=$(curl -s https://api.github.com/repos/Kasui92/omarell/releases/latest | grep tag_name | cut -d '"' -f 4)
last_release_number=$(echo $last_release_tag | sed 's/^v//' | tr -d '.')
local_version_tag=$(cat $OMAKUB_PATH/version)
local_version_number=$(echo $local_version_tag | sed 's/^v//' | tr -d '.')

if [ "$last_release_number" -gt "$local_version_number" ]; then
	echo -e "\033[1;35mA new version of Omarell is available! \033[1m\033[32m($last_release_tag)\033[0m"
	echo "" # Add spacing
fi

if [ $# -eq 0 ]; then
	SUB=$(gum choose "Theme" "Font" "Update" "Install" "Uninstall" "Manual" "Quit" --height 10 --header "" | tr '[:upper:]' '[:lower:]')
else
	SUB=$1
fi

if [ -n "$SUB" ]; then
	if [ "$SUB" = "quit" ]; then
		clear
	else
		source $OMAKUB_PATH/bin/omakub-sub/$SUB.sh
	fi
fi