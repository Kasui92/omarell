# Uninstall onlyoffice
sudo apt purge -y onlyoffice-desktopeditors

# Remove repository
sudo rm -f /etc/apt/sources.list.d/onlyoffice.list
sudo rm -f /usr/share/keyrings/onlyoffice.gpg
