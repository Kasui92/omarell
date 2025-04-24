set_font_size() {
	local font_size=$1
	sed -i "s/^size = .*$/size = $font_size/g" ~/.config/alacritty/font-size.toml

	gum spin --spinner globe --title "Font changed!" -- sleep 3
}

CHOICE=$(gum choose {7..14} "<< Back" --height 11 --header "Choose your terminal font size")

if [[ "$CHOICE" == "<< Back"* ]] || [[ -z "$CHOICE" ]]; then
	# Don't update anything
	echo ""
elif [[ $choice =~ ^[0-9]+$ ]]; then
	set_font_size $CHOICE
else
	# Don't update anything
	echo ""
fi

clear
source $OMAKUB_PATH/bin/omakub-sub/header.sh
source $OMAKUB_PATH/bin/omakub-sub/font.sh