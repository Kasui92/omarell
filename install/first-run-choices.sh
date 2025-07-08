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
OMARELL_FIRST_RUN_THEME=$(gum choose "${AVAILABLE_THEMES[@]}" --limit 1 --selected "$DEFAULT_THEME" --height 10 --header "Select your theme" | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')
if [[ -z "$OMARELL_FIRST_RUN_THEME" ]]; then
  OMARELL_FIRST_RUN_THEME="tokyo-night"
fi
export OMARELL_FIRST_RUN_THEME

# Only ask for default desktop app choices when running Gnome
if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
  # Apps
  OPTIONAL_APPS=(
    "Audacity"
    "Discord"
    "FlameShot"
    "Libreoffice"
    "LocalSend"
    "Obsidian"
    "Pinta"
    "Spotify"
    "Thunderbird"
    "Vlc"
    "Xournalpp"
  )
  DEFAULT_OPTIONAL_APPS='FlameShot','LocalSend','Pinta','Spotify'
  export OMARELL_FIRST_RUN_OPTIONAL_APPS=$(gum choose "${OPTIONAL_APPS[@]}" --no-limit --selected $DEFAULT_OPTIONAL_APPS --height 13 --header "Select optional apps" | tr ' ' '-')
  if [[ "$OMARELL_FIRST_RUN_OPTIONAL_APPS" != "" ]]; then
    echo -e "\nThe following apps will be installed:"
    for app in $OMARELL_FIRST_RUN_OPTIONAL_APPS; do
      app_name=$(echo "$app" | tr '-' ' ')
      echo -e "\n- \033[1;34m$app_name\n"
    done
  else
    echo -e "\nNo apps will be installed."
  fi

  # Browser
  OPTIONAL_BROWSER=(
    "Brave Browser"
    "Firefox"
    "Google Chrome"
    "Zen"
  )
  DEFAULT_OPTIONAL_BROWSER='Firefox'
  export OMARELL_FIRST_RUN_OPTIONAL_BROWSER=$(gum choose "${OPTIONAL_BROWSER[@]}" --no-limit --selected $DEFAULT_OPTIONAL_BROWSER --height 6 --header "Select browsers" | tr ' ' '-')


  # If the users selects at least one browser, ask for the default browser
  if [[ "$OMARELL_FIRST_RUN_OPTIONAL_BROWSER" != "" ]]; then
    # Default browser
    SYSTEM_DEFAUL_BROWSER=()
    for i in "${OPTIONAL_BROWSER[@]}"; do
      browser=$(echo $i | tr ' ' '-')
      if [[ " ${OMARELL_FIRST_RUN_OPTIONAL_BROWSER} " =~ "$browser" ]]; then
        SYSTEM_DEFAUL_BROWSER+=("$i")
      fi
    done
    export OMARELL_FIRST_RUN_SYSTEM_DEFAULT_BROWSER=$(gum choose "${SYSTEM_DEFAUL_BROWSER[@]}" --limit 1 --height 6 --header "Select default browser" | tr ' ' '-')
    echo -e "\nThe following browsers will be installed:"
    for browser in $OMARELL_FIRST_RUN_OPTIONAL_BROWSER; do
      browser_name=$(echo "$browser" | tr '-' ' ')
      echo -e "\n- \033[1;34m$browser_name\n"
    done
  else
    echo -e "\nNo browser? You're a brave one! No problem, you can always install it later."
  fi

  # Dev Apps
  OPTIONAL_DEV_APPS=(
    "Cursor"
    "DBeaver"
    "Figma"
    "Filezilla"
    "Postman"
    "Visual Studio Code"
    "Windsurf"
  )
  DEFAULT_OPTIONAL_DEV_APPS='Visual Studio Code'
  export OMARELL_FIRST_RUN_OPTIONAL_DEV_APPS=$(gum choose "${OPTIONAL_DEV_APPS[@]}" --no-limit --selected "$DEFAULT_OPTIONAL_DEV_APPS" --height 9 --header "Select optional dev tools" | tr ' ' '-')
  echo $OMARELL_FIRST_RUN_OPTIONAL_DEV_APPS
  if [[ "$OMARELL_FIRST_RUN_OPTIONAL_DEV_APPS" != "" ]]; then
    echo -e "\nThe following dev tools will be installed:"
    for dev_app in $OMARELL_FIRST_RUN_OPTIONAL_DEV_APPS; do
      dev_app_name=$(echo "$dev_app" | tr '-' ' ')
      echo -e "\n- \033[1;34m$dev_app_name\n"
    done
  else
    echo -e "\nNo dev tools will be installed."
  fi
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
export OMARELL_FIRST_RUN_LANGUAGES=$(gum choose "${AVAILABLE_LANGUAGES[@]}" --no-limit --selected "$SELECTED_LANGUAGES" --height 10 --header "Select programming languages")
if [[ "$OMARELL_FIRST_RUN_LANGUAGES" != "" ]]; then
  echo -e "\nThe following programming languages will be installed:"
  for language in $OMARELL_FIRST_RUN_LANGUAGES; do
    language_name=$(echo "$language" | tr '-' ' ')
    echo -e "\n- \033[1;34m$language_name\n"
  done
else
  echo -e "\nNo programming languages will be installed."
fi

# Databases
AVAILABLE_DBS=(
  "MySQL"
  "Redis"
  "PostgreSQL"
)
SELECTED_DBS=""
export OMARELL_FIRST_RUN_DBS=$(gum choose "${AVAILABLE_DBS[@]}" --no-limit --selected "$SELECTED_DBS" --height 5 --header "Select databases (runs in Docker)")
if [[ "$OMARELL_FIRST_RUN_DBS" != "" ]]; then
  echo -e "\nThe following databases will be installed:"
  for db in $OMARELL_FIRST_RUN_DBS; do
    db_name=$(echo "$db" | tr '-' ' ')
    echo -e "\n- \033[1;34m$db_name\n"
  done
else
  echo -e "\nNo databases will be installed."
fi
