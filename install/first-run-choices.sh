# Theme
AVAILABLE_THEMES=(
  "Tokyo Night"
  "Catppuccin"
  "Nord"
  "Everforest"
  "Gruvbox"
  "Kanagawa"
)
DEFAULT_THEME="Tokyo Night"
OMARELL_FIRST_RUN_THEME=$(gum choose "${AVAILABLE_THEMES[@]}" --limit 1 --selected "$DEFAULT_THEME" --height 10 --header "Select your theme" | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')
if [[ -z "$OMARELL_FIRST_RUN_THEME" ]]; then
  OMARELL_FIRST_RUN_THEME="tokyo-night"
fi
export OMARELL_FIRST_RUN_THEME

# Only ask for default desktop app choices when running Gnome
if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
  # Apps
  OPTIONAL_APPS=(
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
  export OMARELL_FIRST_RUN_OPTIONAL_APPS=$(gum choose "${OPTIONAL_APPS[@]}" --no-limit --selected $DEFAULT_OPTIONAL_APPS --height 10 --header "Select optional apps" | tr ' ' '-')
fi