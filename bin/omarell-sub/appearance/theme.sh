THEME_NAMES=("Tokyo Night" "Catppuccin" "Nord" "Everforest" "Gruvbox" "Kanagawa")
THEME=$(gum choose "${THEME_NAMES[@]}" "<< Back" --header "Choose your theme" --height 10 | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

if [ -n "$THEME" ] && [ "$THEME" != "<<-back" ]; then
  # Set current theme
  ln -nsf "$HOME/.config/omarell/themes/$THEME" "$HOME/.config/omarell/current/theme"

  # Set desktop theme
  if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
    ln -snf ~/.config/omarell/backgrounds/$THEME ~/.config/omarell/current/backgrounds
    ln -snf $(find "$HOME/.config/omarell/current/backgrounds/" -type f | head -n 1) "$HOME/.config/omarell/current/background"

    # Touch alacritty config to pickup the changed theme
    touch "$HOME/.config/alacritty/alacritty.toml"

    # Apply GDM and GNOME themes
    gum confirm "Do you want to set the theme wallpaper as login background?" && source $OMARELL_PATH/themes/$THEME/gdm.sh > /dev/null 2>&1
    source $OMARELL_PATH/themes/$THEME/gnome.sh
    source $OMARELL_PATH/themes/$THEME/gnome-extensions.sh
  fi

  gum spin --spinner globe --title "Theme changed!" -- sleep 3
fi

clear
source $OMARELL_PATH/bin/omarell-sub/header.sh
source $OMARELL_PATH/bin/omarell-sub/appearance.sh
