# Browse the web with the most popular browser. See https://www.google.com/chrome/
cd /tmp
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

# Set as default-web-browser
if [ -n "$OMAKUB_FIRST_RUN_SYSTEM_DEFAULT_BROWSER" ] && [ "$OMAKUB_FIRST_RUN_SYSTEM_DEFAULT_BROWSER" == "Google-Chrome" ]; then
  xdg-settings set default-web-browser google-chrome.desktop
fi

cd -
