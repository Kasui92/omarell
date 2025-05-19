echo -e "\033[1;35mEnter identification for git and autocomplete...\033[0m"
SYSTEM_NAME=$(getent passwd "$USER" | cut -d ':' -f 5 | cut -d ',' -f 1)
export OMAKUB_USER_NAME=$(gum input --placeholder "Enter full name" --value "$SYSTEM_NAME" --prompt "Name> ")
export OMAKUB_USER_EMAIL=$(gum input --placeholder "Enter email address" --prompt "Email> ")