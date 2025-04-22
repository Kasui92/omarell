THEME_NAMES=("Tokyo Night" "Catppuccin" "Nord" "Everforest" "Gruvbox" "Kanagawa" "Rose Pine")
THEME=$(gum choose "${THEME_NAMES[@]}" "<< Back" --header "Choose your theme" --height 10 | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

if [ -n "$THEME" ] && [ "$THEME" != "<<-back" ]; then
  SET_GDM_BACKGROUND=$(gum choose "Yes" "No" --header "Do you want to set the theme wallpaper as login background?" --height 5)

  cp $OMAKUB_PATH/themes/$THEME/alacritty.toml ~/.config/alacritty/theme.toml
  cp $OMAKUB_PATH/themes/$THEME/zellij.kdl ~/.config/zellij/themes/$THEME.kdl
  sed -i "s/theme \".*\"/theme \"$THEME\"/g" ~/.config/zellij/config.kdl
  cp $OMAKUB_PATH/themes/$THEME/neovim.lua ~/.config/nvim/lua/plugins/theme.lua

  source $OMAKUB_PATH/themes/$THEME/gnome.sh
  if [ "$SET_GDM_BACKGROUND" == "Yes" ]; then
    source $OMAKUB_PATH/themes/$THEME/gdm-background.sh > /dev/null 2>&1
  fi
  source $OMAKUB_PATH/themes/$THEME/extensions.sh
  source $OMAKUB_PATH/themes/$THEME/vscode.sh
else
  source $OMAKUB_PATH/bin/omakub-sub/appearance.sh
fi
