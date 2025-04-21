
# Controlla se è presente una nuova versione di Omarell dalle release di GitHub confrontando con version locale
last_release=$(curl -s https://api.github.com/repos/Kasui92/omarell/releases/latest | grep tag_name | cut -d '"' -f 4 | sed 's/^v//' | tr -d '.')
local_version=$(cat $OMAKUB_PATH/version | sed 's/^v//' | tr -d '.')

# Se la versione online è maggiore di quella locale, mostra un messaggio di avviso
if [ "$last_release" -gt "$local_version" ]; then
	echo -e "\033[1;35mA new version of Omarell is available! \033[1m\033[32m($last_release)\033[0m"
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