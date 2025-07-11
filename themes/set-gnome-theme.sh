gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface cursor-theme 'Yaru'
gsettings set org.gnome.desktop.interface gtk-theme "Yaru-$OMARELL_THEME_COLOR-dark"
gsettings set org.gnome.desktop.interface icon-theme "Yaru-$OMARELL_THEME_COLOR"
gsettings set org.gnome.desktop.interface accent-color "$OMARELL_THEME_COLOR" 2>/dev/null || true

CURRENT_THEME_BACKGROUND=$(find "~/.config/omarell/current/background" -name "*.jpg" -o -name "*.png" | head -1)

gsettings set org.gnome.desktop.background picture-uri $CURRENT_THEME_BACKGROUND
gsettings set org.gnome.desktop.background picture-uri-dark $CURRENT_THEME_BACKGROUND
gsettings set org.gnome.desktop.background picture-options 'zoom'
