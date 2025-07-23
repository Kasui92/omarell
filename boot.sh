#!/bin/bash

set -o pipefail

ascii_art='
________                               .__  .__
\_____  \   _____ _____ _______   ____ |  | |  |
 /   |   \ /     \\\__  \\\_  __ \_/ __ \|  | |  |
/    |    \  Y Y  \/ __ \|  | \/\  ___/|  |_|  |__
\_______  /__|_|  (____  /__|    \___  >____/____/
        \/      \/     \/            \/

'

# Define the color gradient (shades of cyan and blue)
colors=(
  '\033[38;5;81m' # Cyan
  '\033[38;5;75m' # Light Blue
  '\033[38;5;69m' # Sky Blue
  '\033[38;5;63m' # Dodger Blue
  '\033[38;5;57m' # Deep Sky Blue
  '\033[38;5;51m' # Cornflower Blue
  '\033[38;5;45m' # Royal Blue
)

# Split the ASCII art into lines
IFS=$'\n' read -rd '' -a lines <<<"$ascii_art"

# Print each line with the corresponding color
for i in "${!lines[@]}"; do
  color_index=$((i % ${#colors[@]}))
  echo -e "${colors[color_index]}${lines[i]}"
done
echo -e "\033[0m" # Reset color

sudo apt-get update >/dev/null
sudo apt-get install -y git >/dev/null

echo -e "\nCloning Omarell..."
rm -rf ~/.local/share/omarell
git clone https://github.com/Kasui92/omarell.git ~/.local/share/omarell >/dev/null

if [[ -n "$OMARELL_REF" ]]; then
  echo -e "\eUsing branch: $OMARELL_REF"
	cd ~/.local/share/omarell
	git fetch origin "${OMARELL_REF}" && git checkout "${OMARELL_REF}"
	cd -
fi

echo -e "\nInstallation starting..."
source ~/.local/share/omarell/install.sh
