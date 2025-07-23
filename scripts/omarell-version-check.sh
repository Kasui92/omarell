#!/bin/bash

# This script checks if there is a new version of Omarell available
check_omarell_version() {
  # Repository URL
  local repo_url="https://api.github.com/repos/Kasui92/omarell"

  # Check if current git branch is main
  local current_branch
  current_branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  [[ "$current_branch" != "main" ]] && return 0

  # Check if the script is running in a git repository
  git rev-parse --is-inside-work-tree &>/dev/null || return 0

  # Try to fetch the latest release tag from GitHub API (with a timeout of 3 seconds)
  timeout 3 curl -s --head "${repo_url}/releases/latest" &>/dev/null || return 0

  # Get the latest release tag
  local last_release_tag
  last_release_tag=$(curl -s "${repo_url}/releases/latest" | grep -o '"tag_name": "[^"]*' | cut -d'"' -f4)

  # Get the latest local git tag
  local local_version_tag
  local_version_tag=$(git describe --tags --abbrev=0 2>/dev/null)

  # Check if we have valid tags
  [[ -z "$last_release_tag" || -z "$local_version_tag" ]] && return 0

  # Extract version numbers for comparison
  local last_release_number="${last_release_tag#v}"
  last_release_number="${last_release_number//./}"

  local local_version_number="${local_version_tag#v}"
  local_version_number="${local_version_number//./}"

  # Compare versions and notify if update available
  if [[ "$last_release_number" -gt "$local_version_number" ]]; then
    echo -e "\nA new version of Omarell is available! \033[1m\033[32m($last_release_tag)\033[0m"
    echo ""
  fi
}

check_omarell_version