THEME_NAMES=("Tokyo Night" "Catppuccin" "Nord" "Everforest" "Gruvbox" "Kanagawa" "Rose Pine")
THEME=$(gum choose "${THEME_NAMES[@]}" "<< Back" --header "Choose your theme" --height 10 | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

if [ -n "$THEME" ] && [ "$THEME" != "<<-back" ]; then

  if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
    gum confirm "Do you want to set the theme wallpaper as login background?" && source $OMAKUB_PATH/themes/$THEME/gdm-background.sh > /dev/null 2>&1
    source $OMAKUB_PATH/themes/$THEME/gnome.sh
    source $OMAKUB_PATH/themes/$THEME/extensions.sh
    source $OMAKUB_PATH/themes/$THEME/vscode.sh

    cp $OMAKUB_PATH/themes/$THEME/alacritty.toml ~/.config/alacritty/theme.toml
  fi

  cp $OMAKUB_PATH/themes/$THEME/zellij.kdl ~/.config/zellij/themes/$THEME.kdl
  sed -i "s/theme \".*\"/theme \"$THEME\"/g" ~/.config/zellij/config.kdl

  if [ -d "$HOME/.config/nvim" ]; then
    cp $OMAKUB_PATH/themes/$THEME/neovim.lua ~/.config/nvim/lua/plugins/theme.lua
  fi

  gum spin --spinner globe --title "Theme changed!" -- sleep 3
fi

clear
source $OMAKUB_PATH/bin/omakub-sub/header.sh
source $OMAKUB_PATH/bin/omakub-sub/appearance.sh
