#!/bin/bash

echo -e "\n\e[31mEnter identification for git and autocomplete...\e[0m"
SYSTEM_NAME=$(getent passwd "$USER" | cut -d ':' -f 5 | cut -d ',' -f 1)
export OMARELL_USER_NAME=$(gum input --placeholder "Enter full name" --value "$SYSTEM_NAME" --prompt "Name> ")
export OMARELL_USER_EMAIL=$(gum input --placeholder "Enter email address" --prompt "Email> ")