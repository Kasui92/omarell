# Install latest version of Firefox https://www.mozilla.org/firefox/
sudo install -d -m 0755 /etc/apt/keyrings
wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc >/dev/null
echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list >/dev/null
echo '
Package: *
Pin: origin packages.mozilla.org
Pin-Priority: 1000
' | sudo tee /etc/apt/preferences.d/mozilla

sudo apt-get update && sudo apt-get install firefox

# Set as default-web-browser
if [ -n "$OMAKUB_FIRST_RUN_SYSTEM_DEFAULT_BROWSER"] && [ "$OMAKUB_FIRST_RUN_SYSTEM_DEFAULT_BROWSER" == "Chrome" ]; then
  xdg-settings set default-web-browser google-chrome.desktop
fi
