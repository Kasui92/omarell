#!/bin/bash

INSTALL_DIR="$HOME/.local/share/omarell/install/desktop/optional/"

# Initialize defaults apps
apps=(
  "Docker"
  "NeoVim"
)

# Add to the list optional apps
while IFS= read -r display_name; do
  apps+=("$display_name")
done < <(
  find "$INSTALL_DIR" -mindepth 1 -maxdepth 1 -type f -name "*.sh" | while read -r path; do
    filename=$(basename "$path" .sh)
    display_name=$(echo "$filename" | sed -E 's/(^|-)([a-z])/\1\u\2/g; s/-/ /g')

    echo "$display_name"
  done | sort
)
apps+=("Back")

# Get user choice
choice=$(printf "%s\n" "${apps[@]}" | gum choose --header="Install Apps" --height "$(( ${#apps[@]} + 2 ))") || {
  if command -v main_menu &> /dev/null; then
    main_menu
  else
    exit 0
  fi
}

# Check if user chose an app
if [[ -n "$choice" ]] && [[ "$choice" != "Back" ]]; then
  # Convert choice to lowercase and replace spaces with dashes
  selected_app=$(echo "$choice" | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

  # Set the selected app
  if [[ -n "$selected_app" ]]; then
    source "$HOME/.local/share/omarell/scripts/omarell-apps-install.sh" "$selected_app"
  fi
fi
