if [[ -v OMAKUB_FIRST_RUN_OPTIONAL_BROWSER ]]; then
  browsers=$OMAKUB_FIRST_RUN_OPTIONAL_BROWSER

  if [[ -n "$browsers" ]]; then
    for browser in $browsers; do
      BROWSER_INSTALLER=$(echo "$browser" | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')
      source "$OMAKUB_PATH/install/desktop/optional/app-$BROWSER_INSTALLER.sh"
    done
  fi
fi
