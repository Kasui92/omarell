readonly ADDONS_DIR="$HOME/.config/omarell/addons"

INSTALLED=$(find "$ADDONS_DIR" -maxdepth 1 -type d -name "*" ! -name ".*" -printf "%f\n" 2>/dev/null | sort)

if [[ -z "$INSTALLED" ]]; then
	echo "No addons installed"
else
	CHOICES=()
	while IFS= read -r addon; do
		CHOICES+=("$addon")
	done <<< "$INSTALLED"
	CHOICES+=("<< Back")

	CHOICE=$(gum choose "${CHOICES[@]}" --height 15 --header "Uninstall addon")

	if [[ "$CHOICE" == "<< Back" ]] || [[ -z "$CHOICE" ]]; then
		echo ""
	else
		addon_dir="$ADDONS_DIR/$CHOICE"

		# Run uninstall script if exists
		if [[ -f "$addon_dir/uninstall.sh" ]]; then
			chmod +x "$addon_dir/uninstall.sh"
			(cd "$addon_dir" && bash ./uninstall.sh) 2>/dev/null
		fi

		rm -rf "$addon_dir" && \
		gum spin --spinner globe --title "Uninstall completed!" -- sleep 3
	fi
fi

clear
source $HOME/.local/share/omarell/bin/omarell
