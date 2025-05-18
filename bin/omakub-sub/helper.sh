# This script checks if there is a new version of Omarell available

# Check if current git branch is main
current_branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
if [ "$current_branch" != "main" ]; then
  # Exit silently if not on main branch
  exit 0
fi

# Check if the script is running in a git repository
if ! git rev-parse --is-inside-work-tree &>/dev/null; then
  # Exit silently if not in a git repository
  exit 0
fi

# Try to fetch the latest release tag from GitHub API (with a timeout of 3 seconds)
if timeout 3 curl -s --head "https://api.github.com/repos/Kasui92/omarell/releases/latest" &>/dev/null; then
  # Check if the last release tag is available
  last_release_tag=$(curl -s "https://api.github.com/repos/Kasui92/omarell/releases/latest" | grep -o '"tag_name": "[^"]*' | cut -d'"' -f4)

  # Check if the last release tag is not empty and if the version file exists
  if [ -n "$last_release_tag" ] && [ -f "$OMAKUB_PATH/version" ]; then
    last_release_number=${last_release_tag#v}
    last_release_number=${last_release_number//./}

    local_version_tag=$(cat "$OMAKUB_PATH/version")
    local_version_number=${local_version_tag#v}
    local_version_number=${local_version_number//./}

    # Compare the last release number with the local version number
    if [ "$last_release_number" -gt "$local_version_number" ]; then
      echo -e "\033[1;35mA new version of Omarell is available! \033[1m\033[32m($last_release_tag)\033[0m"
      echo "" # Add spacing
    fi
  fi
fi