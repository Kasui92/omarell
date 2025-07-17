# Setup theme links
if [ -d ~/.config/omarell/themes ]; then
  rm -rf ~/.config/omarell/themes
fi
mkdir -p ~/.config/omarell/themes
for f in ~/.local/share/omarell/themes/*; do ln -s "$f" ~/.config/omarell/themes/; done

# Set initial theme
mkdir -p ~/.config/omarell/current
ln -snf ~/.config/omarell/themes/$OMARELL_FIRST_RUN_THEME ~/.config/omarell/current/theme
source ~/.local/share/omarell/themes/$OMARELL_FIRST_RUN_THEME/backgrounds.sh
ln -snf ~/.config/omarell/backgrounds/$OMARELL_FIRST_RUN_THEME ~/.config/omarell/current/backgrounds
ln -snf $(find "$HOME/.config/omarell/current/backgrounds/" -type f | head -n 1) "$HOME/.config/omarell/current/background"

# Set specific app links for current theme
ln -snf ~/.config/omarell/current/theme/neovim.lua ~/.config/nvim/lua/plugins/theme.lua
mkdir -p ~/.config/btop/themes
ln -snf ~/.config/omarell/current/theme/btop.theme ~/.config/btop/themes/current.theme
mkdir -p ~/.config/zellij/themes
ln -snf ~/.config/omarell/current/theme/zellij.kdl ~/.config/zellij/themes/current.kdl

# Touch alacritty config to pickup the changed theme
touch "$HOME/.config/alacritty/alacritty.toml"

# Apply gnome and GDM themes
source ~/.config/omarell/current/theme/gnome.sh
source ~/.config/omarell/current/theme/gdm.sh
source ~/.config/omarell/current/theme/gnome-extensions.sh



