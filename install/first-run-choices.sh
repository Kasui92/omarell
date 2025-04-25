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
echo -e "\033[1;35mThe theme will be set to \033[1;34m$OMAKUB_FIRST_RUN_THEME\033[1;35m.\033[0m"

# Only ask for default desktop app choices when running Gnome
if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
  # Snap
  gum confirm "Do you want to remove snap and all its packages?" && echo -e "\033[1;35mGreat! Snap and all its packages will be removed.\033[0m" || echo -e "\033[1;35mWrong answer! Snap and all its packages will be removed anyway.\033[0m"

  # Apps
  OPTIONAL_APPS=(
    "Audacity"
    "Discord"
    "FlameShot"
    "LocalSend"
    "Obsidian"
    "OnlyOffice"
    "Pinta"
    "Spotify"
    "Thunderbird"
    "Vlc"
    "Xournalpp"
  )
  DEFAULT_OPTIONAL_APPS='FlameShot','LocalSend','Pinta','Spotify'
  export OMAKUB_FIRST_RUN_OPTIONAL_APPS=$(gum choose "${OPTIONAL_APPS[@]}" --no-limit --selected $DEFAULT_OPTIONAL_APPS --height 13 --header "Select optional apps" | tr ' ' '-')
  if [[ "$OMAKUB_FIRST_RUN_OPTIONAL_APPS" != "" ]]; then
    echo -e "\033[1;35mThe following apps will be installed:"
    for app in $OMAKUB_FIRST_RUN_OPTIONAL_APPS; do
      app_name=$(echo "$app" | tr '-' ' ')
      echo -e "\033[1;35m- \033[1;34m$app_name\033[1;35m\033[0m"
    done
  else
    echo -e "\033[1;35mNo apps will be installed.\033[0m"
  fi

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
    export OMAKUB_FIRST_RUN_SYSTEM_DEFAULT_BROWSER=$(gum choose "${SYSTEM_DEFAUL_BROWSER[@]}" --limit 1 --height 6 --header "Select default browser" | tr ' ' '-')
    echo -e "\033[1;35mThe following browsers will be installed:"
    for browser in $OMAKUB_FIRST_RUN_OPTIONAL_BROWSER; do
      browser_name=$(echo "$browser" | tr '-' ' ')
      echo -e "\033[1;35m- \033[1;34m$browser_name\033[1;35m\033[0m"
    done
  else
    echo -e "\033[1;35mNo browser? You're a brave one! No problem, you can always install it later.\033[0m"
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
  export OMAKUB_FIRST_RUN_OPTIONAL_DEV_APPS=$(gum choose "${OPTIONAL_DEV_APPS[@]}" --no-limit --selected "$DEFAULT_OPTIONAL_DEV_APPS" --height 9 --header "Select optional dev tools" | tr ' ' '-')
  echo $OMAKUB_FIRST_RUN_OPTIONAL_DEV_APPS
  if [[ "$OMAKUB_FIRST_RUN_OPTIONAL_DEV_APPS" != "" ]]; then
    echo -e "\033[1;35mThe following dev tools will be installed:"
    for dev_app in $OMAKUB_FIRST_RUN_OPTIONAL_DEV_APPS; do
      dev_app_name=$(echo "$dev_app" | tr '-' ' ')
      echo -e "\033[1;35m- \033[1;34m$dev_app_name\033[1;35m\033[0m"
    done
  else
    echo -e "\033[1;35mNo dev tools will be installed.\033[0m"
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
export OMAKUB_FIRST_RUN_LANGUAGES=$(gum choose "${AVAILABLE_LANGUAGES[@]}" --no-limit --selected "$SELECTED_LANGUAGES" --height 10 --header "Select programming languages")
if [[ "$OMAKUB_FIRST_RUN_LANGUAGES" != "" ]]; then
  echo -e "\033[1;35mThe following programming languages will be installed:"
  for language in $OMAKUB_FIRST_RUN_LANGUAGES; do
    language_name=$(echo "$language" | tr '-' ' ')
    echo -e "\033[1;35m- \033[1;34m$language_name\033[1;35m\033[0m"
  done
else
  echo -e "\033[1;35mNo programming languages will be installed.\033[0m"
fi

# Databases
AVAILABLE_DBS=(
  "MySQL"
  "Redis"
  "PostgreSQL"
)
SELECTED_DBS=""
export OMAKUB_FIRST_RUN_DBS=$(gum choose "${AVAILABLE_DBS[@]}" --no-limit --selected "$SELECTED_DBS" --height 5 --header "Select databases (runs in Docker)")
if [[ "$OMAKUB_FIRST_RUN_DBS" != "" ]]; then
  echo -e "\033[1;35mThe following databases will be installed:"
  for db in $OMAKUB_FIRST_RUN_DBS; do
    db_name=$(echo "$db" | tr '-' ' ')
    echo -e "\033[1;35m- \033[1;34m$db_name\033[1;35m\033[0m"
  done
else
  echo -e "\033[1;35mNo databases will be installed.\033[0m"
fi
