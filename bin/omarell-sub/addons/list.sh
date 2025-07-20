readonly ADDONS_DIR="$HOME/.config/omarell/addons"

INSTALLED=$(find "$ADDONS_DIR" -maxdepth 1 -type d -name "*" ! -name ".*" -printf "%f\n" 2>/dev/null | sort)

if [[ -z "$INSTALLED" ]]; then
	echo "No addons installed"
else
	echo "Installed addons:"
	echo "$INSTALLED" | while read -r addon; do
		repo=""
		if [[ -f "$ADDONS_DIR/$addon/.repository" ]]; then
			repo=" ($(basename "$(cat "$ADDONS_DIR/$addon/.repository")"))"
		fi
		echo "  ✅ $addon$repo"
	done
fi

echo
gum input --placeholder "Press Enter to continue..."

clear
source $HOME/.local/share/omarell/bin/omarell
