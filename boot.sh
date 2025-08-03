#!/bin/bash

set -o pipefail

ascii_art='
 ██████╗ ███╗   ███╗ █████╗ ██████╗ ███████╗██╗     ██╗
██╔═══██╗████╗ ████║██╔══██╗██╔══██╗██╔════╝██║     ██║
██║   ██║██╔████╔██║███████║██████╔╝█████╗  ██║     ██║
██║   ██║██║╚██╔╝██║██╔══██║██╔══██╗██╔══╝  ██║     ██║
╚██████╔╝██║ ╚═╝ ██║██║  ██║██║  ██║███████╗███████╗███████╗
 ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝
'

clear
echo -e "\n$ascii_art\n"

sudo apt-get update >/dev/null
sudo apt-get install -y git >/dev/null

# Use custom repo if specified, otherwise use default
OMARELL_REPO="${OMARELL_REPO:-Kasui92/omarell}"

echo -e "\e[32m\nCloning Omarell...\e[0m"
rm -rf ~/.local/share/omarell
git clone https://github.com/$OMARELL_REPO.git ~/.local/share/omarell >/dev/null

if [[ -n "$OMARELL_REF" ]]; then
  echo -e "\e[32mUsing branch: $OMARELL_REF\e[0m"
	cd ~/.local/share/omarell
	git fetch origin "${OMARELL_REF}" && git checkout "${OMARELL_REF}"
	cd -
fi

echo -e "\nInstallation starting..."
source ~/.local/share/omarell/install.sh
