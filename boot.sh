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

echo -e "\033[1;35m=> Omarell: basically Omakub with some fancy, totally optional (... and unrequested!) tweaks.\033[0m"
echo -e "\033[1;35m=> Just like its parent, it demands the purity of a fresh Ubuntu 24.04+ install... unless you enjoy debugging cryptic errors later!\033[0m"
echo -e "\nBegin installation (or abort with ctrl+c)..."

sudo apt-get update >/dev/null
sudo apt-get install -y git >/dev/null

echo -e "\033[1;35mCloning Omarell...\033[0m"
rm -rf ~/.local/share/omakub
git clone https://github.com/Kasui92/omarell.git ~/.local/share/omakub >/dev/null
if [[ $OMAKUB_REF != "main" ]]; then
	cd ~/.local/share/omakub
	git fetch origin "${OMAKUB_REF:-dev}" && git checkout "${OMAKUB_REF:-dev}"
	cd -
fi

echo -e "\033[1;35mInstallation starting...\033[0m"
source ~/.local/share/omakub/install.sh
