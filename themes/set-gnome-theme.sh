gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface cursor-theme 'Yaru'
gsettings set org.gnome.desktop.interface gtk-theme "Yaru-$OMARELL_THEME_COLOR-dark"
gsettings set org.gnome.desktop.interface icon-theme "Yaru-$OMARELL_THEME_COLOR"
gsettings set org.gnome.desktop.interface accent-color "$OMARELL_THEME_COLOR" 2>/dev/null || true

BACKGROUND_ORG_PATH="$HOME/.local/share/omarell/themes/$OMARELL_THEME_BACKGROUND"
BACKGROUND_DEST_DIR="$HOME/.local/share/backgrounds"
BACKGROUND_DEST_PATH="$BACKGROUND_DEST_DIR/$(echo $OMARELL_THEME_BACKGROUND | tr '/' '-')"

if [ ! -d "$BACKGROUND_DEST_DIR" ]; then mkdir -p "$BACKGROUND_DEST_DIR"; fi

[ ! -f $BACKGROUND_DEST_PATH ] && cp $BACKGROUND_ORG_PATH $BACKGROUND_DEST_PATH
gsettings set org.gnome.desktop.background picture-uri $BACKGROUND_DEST_PATH
gsettings set org.gnome.desktop.background picture-uri-dark $BACKGROUND_DEST_PATH
gsettings set org.gnome.desktop.background picture-options 'zoom'
