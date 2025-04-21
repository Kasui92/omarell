# Theme
AVAILABLE_THEMES=(
  "Tokyo Night"
  "Catppuccin"
  "Nord"
  "Everforest"
  "Gruvbox"
  "Kanagawa"
  "Rose Pine"
)
DEFAULT_THEME="Tokyo Night"
OMAKUB_FIRST_RUN_THEME=$(gum choose "${AVAILABLE_THEMES[@]}" --limit 1 --selected "$DEFAULT_THEME" --height 10 --header "Select your theme" | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')
if [[ -z "$OMAKUB_FIRST_RUN_THEME" ]]; then
  OMAKUB_FIRST_RUN_THEME="tokyo-night"
fi
export OMAKUB_FIRST_RUN_THEME

# Only ask for default desktop app choices when running Gnome
if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
  # Apps
  OPTIONAL_APPS=(
    "Audacity"
    "DBeaver"
    "Discord"
    "Figma"
    "Filezilla"
    "FlameShot"
    "LocalSend"
    "Obsidian"
    "OnlyOffice"
    "Pinta"
    "Postman"
    "Spotify"
    "Thunderbird"
    "Vlc"
    "Xournalpp"
  )
  DEFAULT_OPTIONAL_APPS='FlameShot','LocalSend','Pinta','Spotify'
  export OMAKUB_FIRST_RUN_OPTIONAL_APPS=$(gum choose "${OPTIONAL_APPS[@]}" --no-limit --selected $DEFAULT_OPTIONAL_APPS --height 17 --header "Select optional apps" | tr ' ' '-')

  # Browser
  OPTIONAL_BROWSER=(
    "Firefox"
    "Microsoft Edge"
    "Google Chrome"
    "Zen"
  )
  DEFAULT_OPTIONAL_BROWSER='Firefox'
  export OMAKUB_FIRST_RUN_OPTIONAL_BROWSER=$(gum choose "${OPTIONAL_BROWSER[@]}" --no-limit --selected $DEFAULT_OPTIONAL_BROWSER --height 6 --header "Select browsers" | tr ' ' '-')

  # If the users selects at least one browser, ask for the default browser
  if [[ "$OMAKUB_FIRST_RUN_OPTIONAL_BROWSER" != "" ]]; then
    # Default browser
    SYSTEM_DEFAUL_BROWSER=()
    for i in "${OPTIONAL_BROWSER[@]}"; do
      browser=$(echo $i | tr ' ' '-')
      if [[ " ${OMAKUB_FIRST_RUN_OPTIONAL_BROWSER} " =~ "$browser" ]]; then
        SYSTEM_DEFAUL_BROWSER+=("$i")
      fi
    done
    DEFAULT_SYSTEM_DEFAULT_BROWSER='Firefox'
    export OMAKUB_FIRST_RUN_SYSTEM_DEFAULT_BROWSER=$(gum choose "${SYSTEM_DEFAUL_BROWSER[@]}" --limit 1 --selected $DEFAULT_SYSTEM_DEFAULT_BROWSER --height 6 --header "Select default browser" | tr ' ' '-')
  else
    echo -e "\033[1;35mNo browser? You're a brave one! No problem, you can always install it later.\033[0m"
  fi

  # Snap
  gum confirm "Do you want to remove snap and all its packages?" && echo -e "\033[1;35mGreat! Snap and all its packages will be removed.\033[0m" || echo -e "\033[1;35mWrong answer! Snap and all its packages will be removed anyway.\033[0m"
fi

# Programming languages
AVAILABLE_LANGUAGES=(
  "Ruby on Rails"
  "Node.js"
  "Go"
  "PHP"
  "Python"
  "Elixir"
  "Rust"
  "Java"
)
SELECTED_LANGUAGES="Node.js"
export OMAKUB_FIRST_RUN_LANGUAGES=$(gum choose "${AVAILABLE_LANGUAGES[@]}" --no-limit --selected "$SELECTED_LANGUAGES" --height 10 --header "Select programming languages")

# Databases
AVAILABLE_DBS=(
  "MySQL"
  "Redis"
  "PostgreSQL"
)
SELECTED_DBS=""
export OMAKUB_FIRST_RUN_DBS=$(gum choose "${AVAILABLE_DBS[@]}" --no-limit --selected "$SELECTED_DBS" --height 5 --header "Select databases (runs in Docker)")
