cat <<EOF >~/.local/share/applications/Omarell.desktop
[Desktop Entry]
Version=1.0
Name=Omarell
Comment=Omarell Controls
Exec=alacritty --config-file /home/$USER/.local/share/omakub/defaults/alacritty/pane.toml --class=Omarell --title=Omarell -e omakub
Terminal=false
Type=Application
Icon=/home/$USER/.local/share/omakub/applications/icons/Omarell.png
Categories=GTK;
StartupNotify=false
EOF
