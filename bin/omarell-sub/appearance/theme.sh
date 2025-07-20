THEME_NAMES=("Tokyo Night" "Catppuccin" "Nord" "Everforest" "Gruvbox" "Kanagawa")
THEME=$(gum choose "${THEME_NAMES[@]}" "<< Back" --header "Choose your theme" --height 10 | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

if [ -n "$THEME" ] && [ "$THEME" != "<<-back" ]; then
  # Set current theme
  ln -nsf "$HOME/.config/omarell/themes/$THEME" "$HOME/.config/omarell/current/theme"

  # Trigger btop config reload
  pkill -SIGUSR2 btop

  # Set desktop theme
  if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
    ln -snf $(find "$HOME/.config/omarell/current/theme/backgrounds/" -type f | head -n 1) "$HOME/.config/omarell/current/background"

    # Touch alacritty config to pickup the changed theme
    touch "$HOME/.config/alacritty/alacritty.toml"

    # Apply GDM and GNOME themes
    gum confirm "Do you want to set the theme wallpaper as login background?" && source $HOME/.local/share/omarell/themes/$THEME/gdm.sh > /dev/null 2>&1
    source $HOME/.local/share/omarell/themes/$THEME/gnome.sh
    source $HOME/.local/share/omarell/themes/$THEME/gnome-extensions.sh
  fi

  gum spin --spinner globe --title "Theme changed!" -- sleep 3
fi

clear
source $HOME/.local/share/omarell/bin/omarell-sub/header.sh
source $HOME/.local/share/omarell/bin/omarell-sub/appearance.sh
