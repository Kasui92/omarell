# Run desktop installers
for installer in ~/.local/share/omarell/install/desktop/*.sh; do
  echo -e "\nRunning installer: $installer"
  source "$installer"
done
