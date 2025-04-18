# Install latest version of Zen Browser https://zen-browser.app
cd /tmp
curl -s https://updates.zen-browser.app/install.sh -o zen-install.sh 2>/dev/null
chmod +x zen-install.sh 2>/dev/null
bash zen-install.sh >/dev/null 2>&1
rm -f zen-install.sh 2>/dev/null
cd -

# Set as default-web-browser
if [ -n "$OMAKUB_FIRST_RUN_SYSTEM_DEFAULT_BROWSER" ] && [ "$OMAKUB_FIRST_RUN_SYSTEM_DEFAULT_BROWSER" == "Zen" ]; then
  xdg-settings set default-web-browser zen.desktop
fi