# Ensure all alacritty configs have been migrated
alacritty migrate
alacritty migrate --config-file ~/.config/alacritty/btop.toml
alacritty migrate --config-file ~/.config/alacritty/pane.toml

# Ensure btop themes folder is available
mkdir -p ~/.config/btop/themes

sudo apt install -y ppa-purge