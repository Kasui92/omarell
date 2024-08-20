OPTIONAL_APPS=("Spotify" "Vlc" "Discord" "Thunderbird" "Figma" "Postman" "Filezilla" "OnlyOffice" "Obsidian")
DEFAULT_OPTIONAL_APPS='Spotify'
export OMAKUB_FIRST_RUN_OPTIONAL_APPS=$(gum choose "${OPTIONAL_APPS[@]}" --no-limit --selected $DEFAULT_OPTIONAL_APPS --height 7 --header "Select optional apps" | tr ' ' '-')

OPTIONAL_BROWSER=("Firefox" "Microsoft Edge" "Google Chrome")
DEFAULT_OPTIONAL_BROWSER='Firefox'
OMAKUB_FIRST_RUN_OPTIONAL_BROWSER=$(gum choose "${OPTIONAL_BROWSER[@]}" --no-limit --selected $DEFAULT_OPTIONAL_BROWSER --height 7 --header "Select browser" | tr ' ' '-')

# no firefox? nah!
if [[ ! " ${OMAKUB_FIRST_RUN_OPTIONAL_BROWSER[@]} " =~ " Firefox " ]]; then
  echo "No Firefox? That's not how things should be done! I'll add it, it's good for you!"
  OMAKUB_FIRST_RUN_OPTIONAL_BROWSER+=("Firefox")
fi
export OMAKUB_FIRST_RUN_OPTIONAL_BROWSER

SYSTEM_DEFAUL_BROWSER=$OMAKUB_FIRST_RUN_OPTIONAL_BROWSER
DEFAULT_SYSTEM_DEFAULT_BROWSER="Firefox"
export OMAKUB_FIRST_RUN_SYSTEM_DEFAULT_BROWSER=$(gum choose "${SYSTEM_DEFAUL_BROWSER[@]}" --limit 1 --selected $DEFAULT_SYSTEM_DEFAULT_BROWSER --height 7 --header "Select default browser" | tr ' ' '-')

AVAILABLE_LANGUAGES=("Ruby on Rails" "Node.js" "Go" "PHP" "Python" "Elixir" "Rust" "Java")
SELECTED_LANGUAGES="Node.js"
export OMAKUB_FIRST_RUN_LANGUAGES=$(gum choose "${AVAILABLE_LANGUAGES[@]}" --no-limit --selected "$SELECTED_LANGUAGES" --height 10 --header "Select programming languages")
