gum confirm "Do you want to remove snap and all its packages?" && echo "That's how it's done, young man!" || echo "I tell you that everything must be removed! Leave it to me!"

# Remove all snap packages
sudo snap remove $(snap list | awk '!/^Name|^core/ {print $1}')
sudo apt remove --purge -y snapd gnome-software-plugin-snap
