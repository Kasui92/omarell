set_font() {
	local font_name=$1
	local url=$2
	local file_type=$3
	local file_name="${font_name/ Nerd Font/}"

	if ! $(fc-list | grep -i "$font_name" >/dev/null); then
		cd /tmp
		wget -O "$file_name.zip" "$url"
		unzip "$file_name.zip" -d "$file_name"
		cp "$file_name"/*."$file_type" ~/.local/share/fonts
		rm -rf "$file_name.zip" "$file_name"
		fc-cache
		cd -
		clear
		source $OMAKUB_PATH/ascii.sh
	fi

	gsettings set org.gnome.desktop.interface monospace-font-name "$font_name 10"
	cp "$OMAKUB_PATH/configs/alacritty/fonts/$file_name.toml" ~/.config/alacritty/font.toml
	sed -i "s/\"editor.fontFamily\": \".*\"/\"editor.fontFamily\": \"$font_name\"/g" ~/.config/Code/User/settings.json

	gum spin --spinner globe --title "Font changed!" -- sleep 3
}

CHOICES=(
	"Cascadia Mono"
	"Fira Mono"
	"JetBrains Mono"
	"Meslo"
	"> Change size"
	"<< Back"
)

CHOICE=$(gum choose "${CHOICES[@]}" --height 8 --header "Choose your programming font")

if [[ "$CHOICE" == "<< Back"* ]] || [[ -z "$CHOICE" ]]; then
	# Don't update anything
	echo ""
elif [[ "$CHOICE" == "> Change size"* ]]; then
	source $OMAKUB_PATH/bin/omakub-sub/appearance/font-size.sh
else
	case "$CHOICE" in
	"Cascadia Mono") set_font "CaskaydiaMono Nerd Font" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaMono.zip" "ttf" ;;
	"Fira Mono") set_font "FiraMono Nerd Font" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraMono.zip" "otf" ;;
	"JetBrains Mono") set_font "JetBrainsMono Nerd Font" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip" "ttf" ;;
	"Meslo") "MesloLGS Nerd Font" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Meslo.zip" "ttf" ;;
	esac
fi

clear
source $OMAKUB_PATH/bin/omakub-sub/header.sh
source $OMAKUB_PATH/bin/omakub-sub/appearance.sh