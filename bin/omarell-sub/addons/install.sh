readonly DEFAULT_REPOSITORY="https://omakasui.lucapattocchio.dev/addons"
readonly ADDONS_DIR="$HOME/.config/omarell/addons"

echo "Default repository: ${DEFAULT_REPOSITORY}"
echo "Custom repository syntax: repository-url/addon-name"
echo

ADDON=$(gum input --placeholder "Addon name or repository/addon")

if [[ -z "$ADDON" ]]; then
	echo ""
else
	ADDON=$(echo "$ADDON" | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

	# Parse repository and addon name
	repository="$DEFAULT_REPOSITORY"
	addon_name="$ADDON"

	if [[ "$ADDON" == *"/"* ]]; then
		repository=$(dirname "$ADDON")
		addon_name=$(basename "$ADDON")
	fi

	addon_dir="$ADDONS_DIR/$addon_name"

	# Check availability
	if ! curl --head --silent --fail "$repository/$addon_name/install.sh" >/dev/null 2>&1; then
		echo "Addon '$addon_name' not found at $(basename "$repository")"
	else
		# Install addon
		mkdir -p "$addon_dir"

		curl -fsSL "$repository/$addon_name/install.sh" -o "$addon_dir/install.sh" && \
		curl -fsSL "$repository/$addon_name/uninstall.sh" -o "$addon_dir/uninstall.sh" && \
		chmod +x "$addon_dir/install.sh" && \
		(cd "$addon_dir" && bash ./install.sh) && \
		echo "$(date -Iseconds)" > "$addon_dir/.installed" && \
		echo "$repository" > "$addon_dir/.repository" && \
		gum spin --spinner globe --title "Install completed!" -- sleep 3
	fi
fi

clear
source $HOME/.local/share/omarell/bin/omarell
