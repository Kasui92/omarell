# Run desktop installers
for installer in ~/.local/share/omarell/install/desktop/*.sh; do source $installer; done

# Logout to pickup changes
gum confirm "Now everything is built as it should be. Reboot and let's see!" && sudo reboot
