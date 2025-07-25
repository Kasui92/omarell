#!/bin/bash

# Theme
THEMES_DIR="$HOME/.local/share/omarell/themes"
# Build themes list with pretty display names
mapfile -t AVAILABLE_THEMES < <(
  find "$THEMES_DIR" -mindepth 1 -maxdepth 1 \( -type d -o -type l \) | while read -r path; do
    filename=$(basename "$path")
    display_name=$(echo "$filename" | sed -E 's/(^|-)([a-z])/\1\u\2/g; s/-/ /g')
    echo "$display_name"
  done | sort
)

DEFAULT_THEME="${AVAILABLE_THEMES[0]}"
OMARELL_FIRST_RUN_THEME=$(gum choose "${AVAILABLE_THEMES[@]}" --limit 1 --selected "$DEFAULT_THEME" --height 10 --header "Select your theme" | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')
if [[ -z "$OMARELL_FIRST_RUN_THEME" ]]; then
  OMARELL_FIRST_RUN_THEME="tokyo-night"
fi
export OMARELL_FIRST_RUN_THEME

# Only ask for default desktop app choices when running Gnome
if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
  # Apps
  OPTIONAL_APPS=(
    "Discord"
    "FlameShot"
    "Libreoffice"
    "LocalSend"
    "Pinta"
    "Spotify"
    "Visual Studio Code"
    "Vlc"
    "Xournalpp"
  )
  DEFAULT_OPTIONAL_APPS='FlameShot','LocalSend','Pinta','Spotify'
  export OMARELL_FIRST_RUN_OPTIONAL_APPS=$(gum choose "${OPTIONAL_APPS[@]}" --no-limit --selected $DEFAULT_OPTIONAL_APPS --height 11 --header "Select optional apps" | tr ' ' '-')
fi