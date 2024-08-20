set -e

ascii_art='________                               .__  .__   
\_____  \   _____ _____ _______   ____ |  | |  |  
 /   |   \ /     \\\__  \\\_  __ \_/ __ \|  | |  |  
/    |    \  Y Y  \/ __ \|  | \/\  ___/|  |_|  |__
\_______  /__|_|  (____  /__|    \___  >____/____/
        \/      \/     \/            \/           
'

echo -e "$ascii_art"
echo "=> Omarell is based on Omakub, but with some (not required!) tweaks."
echo "=> Like Omakub, a freshly installed version of Ubuntu 24.04 is required to avoid problems during following process."
echo -e "\nBegin installation (or abort with ctrl+c)..."

sudo apt-get update >/dev/null
sudo apt-get install -y git >/dev/null

echo "Cloning Omarell..."
rm -rf ~/.local/share/omakub
git clone https://github.com/kasui92/omarell.git ~/.local/share/omakub >/dev/null
if [[ $OMAKUB_REF != "main" ]]; then
  cd ~/.local/share/omakub
  git fetch origin "${OMAKUB_REF:-stable}" && git checkout "${OMAKUB_REF:-stable}"
  cd -
fi

echo "Installation starting..."
source ~/.local/share/omakub/install.sh
