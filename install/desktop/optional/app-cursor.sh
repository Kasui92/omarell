cd /tmp
curl -L "https://www.cursor.com/api/download?platform=linux-x64&releaseTrack=stable" | jq -r '.downloadUrl' | xargs curl -L -o cursor.appimage
sudo mv cursor.appimage /opt/cursor.appimage
sudo chmod +x /opt/cursor.appimage
sudo apt install -y fuse3
sudo apt install -y libfuse2t64

DESKTOP_FILE="/usr/share/applications/cursor.desktop"

sudo bash -c "cat > $DESKTOP_FILE" <<EOL
[Desktop Entry]
Name=Cursor
Comment=AI-powered code editor
Exec=/opt/cursor.appimage --no-sandbox
Icon=/home/$USER/.local/share/omakub/applications/icons/cursor.png
Type=Application
Categories=Development;IDE;
EOL

if [ -f "$DESKTOP_FILE" ]; then
	echo -e "\033[1;35mCursor installed successfully.\033[0m"
else
	echo -e "\033[1;31mCursor installation failed.\033[0m"
fi