#!/bin/bash

THEMES_DIR="$HOME/.config/omarell/themes/"
CURRENT_THEME_DIR="$HOME/.config/omarell/current/theme"
CURRENT_THEME_NAME=$(basename "$(realpath "$CURRENT_THEME_DIR")")

# Build themes list with pretty display names
mapfile -t themes < <(
  find "$THEMES_DIR" -mindepth 1 -maxdepth 1 \( -type d -o -type l \) | while read -r path; do
    filename=$(basename "$path")
    display_name=$(echo "$filename" | sed -E 's/(^|-)([a-z])/\1\u\2/g; s/-/ /g')

    if [[ "$filename" == "$CURRENT_THEME_NAME" ]]; then
      echo -e "\033[1;32m$display_name\033[0m"
    else
      echo "$display_name"
    fi
  done | sort
)

# Get user choice
choice=$(printf "%s\n" "${themes[@]}" | gum choose --header="Themes") || main_menu

# Check if user chose a theme
if [[ -n "$choice" ]]; then
  # Convert choice to lowercase and replace spaces with dashes
  selected_theme=$(echo "$choice" | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

  # Set the selected theme
  if [[ -n "$selected_theme" ]]; then
    source "$HOME/.local/share/omarell/scripts/omarell-theme-set.sh" "$selected_theme"
  fi
fi
