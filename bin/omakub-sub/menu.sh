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