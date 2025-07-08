THEME_NAMES=("Tokyo Night" "Catppuccin" "Nord" "Everforest" "Gruvbox" "Kanagawa")
THEME=$(gum choose "${THEME_NAMES[@]}" "<< Back" --header "Choose your theme" --height 10 | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

if [ -n "$THEME" ] && [ "$THEME" != "<<-back" ]; then

  if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
    gum confirm "Do you want to set the theme wallpaper as login background?" && source $OMARELL_PATH/themes/$THEME/gdm-background.sh > /dev/null 2>&1
    source $OMARELL_PATH/themes/$THEME/gnome.sh
    source $OMARELL_PATH/themes/$THEME/extensions.sh

    cp $OMARELL_PATH/themes/$THEME/alacritty.toml ~/.config/alacritty/theme.toml
  fi

  cp $OMARELL_PATH/themes/$THEME/zellij.kdl ~/.config/zellij/themes/$THEME.kdl
  sed -i "s/theme \".*\"/theme \"$THEME\"/g" ~/.config/zellij/config.kdl

  if [ -f "$OMARELL_PATH/themes/$THEME/btop.theme" ]; then
    cp $OMARELL_PATH/themes/$THEME/btop.theme ~/.config/btop/themes/$THEME.theme
    sed -i "s/theme = \".*\"/theme = \"$THEME\"/g" ~/.config/btop/btop.conf
  else
    sed -i "s/theme = \".*\"/theme = \"Default\"/g" ~/.config/btop/btop.conf
  fi

  if [ -d "$HOME/.config/nvim" ]; then
    cp $OMARELL_PATH/themes/$THEME/neovim.lua ~/.config/nvim/lua/plugins/theme.lua
  fi

  gum spin --spinner globe --title "Theme changed!" -- sleep 3
fi

clear
source $OMARELL_PATH/bin/omarell-sub/header.sh
source $OMARELL_PATH/bin/omarell-sub/appearance.sh
