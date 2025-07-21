#!/bin/bash

echo -e "\n\nInstalling Forge and configuring GNOME extensions...\n"

# Uninstall Tactile
gext uninstall tactile@lundal.io
gext uninstall quick-settings-avatar@d-go

# Install Extensions
gext install forge@jmmaranan.com
gext install rounded-window-corners@fxgn

sudo cp ~/.local/share/gnome-shell/extensions/forge@jmmaranan.com/schemas/org.gnome.shell.extensions.forge.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/rounded-window-corners\@fxgn/schemas/org.gnome.shell.extensions.rounded-window-corners-reborn.gschema.xml /usr/share/glib-2.0/schemas/
sudo glib-compile-schemas /usr/share/glib-2.0/schemas/

# Configure Forge
gsettings set org.gnome.shell.extensions.forge window-gap-size 5
gsettings set org.gnome.shell.extensions.forge window-gap-size-increment 1
gsettings set org.gnome.shell.extensions.forge quick-settings-enabled false
gsettings set org.gnome.shell.extensions.forge auto-exit-tabbed false
gsettings set org.gnome.shell.extensions.forge focus-border-size 2
gsettings set org.gnome.shell.extensions.forge tiling-mode-enabled true

# Configure Just Perfection
gsettings set org.gnome.shell.extensions.just-perfection search false
gsettings set org.gnome.shell.extensions.just-perfection dash false
gsettings set org.gnome.shell.extensions.just-perfection dash-separator false
gsettings set org.gnome.shell.extensions.just-perfection dash-app-running false
gsettings set org.gnome.shell.extensions.just-perfection show-apps-button false
gsettings set org.gnome.shell.extensions.just-perfection startup-status 1

# Configure Rounded Window Corners
gsettings set org.gnome.shell.extensions.rounded-window-corners-reborn border-width 0
gsettings set org.gnome.shell.extensions.rounded-window-corners-reborn global-rounded-corner-settings "{'padding': <{'left': uint32 0, 'right': 0, 'top': 0, 'bottom': 0}>, 'keepRoundedCorners': <{'maximized': false, 'fullscreen': false}>, 'borderRadius': <uint32 14>, 'smoothing': <0.0>, 'borderColor': <(0.5, 0.5, 0.5, 1.0)>, 'enabled': <true>}"

# Remove Space Bar Shortcut
gsettings set org.gnome.shell.extensions.space-bar.shortcuts enable-move-to-workspace-shortcuts false
gsettings set org.gnome.shell.extensions.space-bar.shortcuts activate-empty-key "@as []"
gsettings set org.gnome.shell.extensions.space-bar.shortcuts activate-previous-key "@as []"
gsettings set org.gnome.shell.extensions.space-bar.shortcuts move-workspace-left "@as []"
gsettings set org.gnome.shell.extensions.space-bar.shortcuts move-workspace-right "@as []"

# Remove gnome keybindings
gsettings set org.gnome.shell.keybindings toggle-message-tray "['<Super>m']"
gsettings set org.gnome.desktop.wm.keybindings switch-input-source "@as []"
gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward "@as []"
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-down "@as []"
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-up "@as []"
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-left "@as []"
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-right "@as []"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "@as []"
gsettings set org.gnome.desktop.wm.keybindings maximize "@as []"
gsettings set org.gnome.desktop.wm.keybindings minimize "@as []"
gsettings set org.gnome.desktop.wm.keybindings toggle-maximized "@as []"
gsettings set org.gnome.mutter.keybindings toggle-tiled-right "@as []"
gsettings set org.gnome.mutter.keybindings toggle-tiled-left  "@as []"

# Remove alt for pinned apps
gsettings set org.gnome.shell.keybindings switch-to-application-1 "@as []"
gsettings set org.gnome.shell.keybindings switch-to-application-2 "@as []"
gsettings set org.gnome.shell.keybindings switch-to-application-3 "@as []"
gsettings set org.gnome.shell.keybindings switch-to-application-4 "@as []"
gsettings set org.gnome.shell.keybindings switch-to-application-5 "@as []"
gsettings set org.gnome.shell.keybindings switch-to-application-6 "@as []"
gsettings set org.gnome.shell.keybindings switch-to-application-7 "@as []"
gsettings set org.gnome.shell.keybindings switch-to-application-8 "@as []"
gsettings set org.gnome.shell.keybindings switch-to-application-9 "@as []"

# Remove open new window shortcut
gsettings set org.gnome.shell.keybindings open-new-window-application-1 "@as []"
gsettings set org.gnome.shell.keybindings open-new-window-application-2 "@as []"
gsettings set org.gnome.shell.keybindings open-new-window-application-3 "@as []"
gsettings set org.gnome.shell.keybindings open-new-window-application-4 "@as []"
gsettings set org.gnome.shell.keybindings open-new-window-application-5 "@as []"
gsettings set org.gnome.shell.keybindings open-new-window-application-6 "@as []"
gsettings set org.gnome.shell.keybindings open-new-window-application-7 "@as []"
gsettings set org.gnome.shell.keybindings open-new-window-application-8 "@as []"
gsettings set org.gnome.shell.keybindings open-new-window-application-9 "@as []"

# Unset favorite applications
gsettings set org.gnome.shell favorite-apps "[]"

# Use super + shift for moving windows to workspaces
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 "['<Super><Shift>1']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-2 "['<Super><Shift>2']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-3 "['<Super><Shift>3']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-4 "['<Super><Shift>4']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-5 "['<Super><Shift>5']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-6 "['<Super><Shift>6']"

# Reduce slots for custom keybindings
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/']"

# Applications
gsettings set org.gnome.settings-daemon.plugins.media-keys terminal "['<Super>Return']"
gsettings set org.gnome.settings-daemon.plugins.media-keys www "['<Super>b']"

# Configure keybindings for Forge
gsettings set org.gnome.shell.extensions.forge.keybindings focus-border-toggle '[]'
gsettings set org.gnome.shell.extensions.forge.keybindings window-gap-size-increase '[]'
gsettings set org.gnome.shell.extensions.forge.keybindings window-gap-size-decrease '[]'
gsettings set org.gnome.shell.extensions.forge.keybindings con-split-layout-toggle '[]'
gsettings set org.gnome.shell.extensions.forge.keybindings con-split-horizontal '[]'
gsettings set org.gnome.shell.extensions.forge.keybindings con-split-vertical '[]'
gsettings set org.gnome.shell.extensions.forge.keybindings con-stacked-layout-toggle '[]'
gsettings set org.gnome.shell.extensions.forge.keybindings con-tabbed-layout-toggle '[]'
gsettings set org.gnome.shell.extensions.forge.keybindings con-tabbed-showtab-decoration-toggle '[]'
gsettings set org.gnome.shell.extensions.forge.keybindings window-swap-left "['<Shift><Super>Left']"
gsettings set org.gnome.shell.extensions.forge.keybindings window-swap-right "['<Shift><Super>Right']"
gsettings set org.gnome.shell.extensions.forge.keybindings window-swap-up "['<Shift><Super>Up']"
gsettings set org.gnome.shell.extensions.forge.keybindings window-swap-down "['<Shift><Super>Down']"
gsettings set org.gnome.shell.extensions.forge.keybindings window-move-left '[]'
gsettings set org.gnome.shell.extensions.forge.keybindings window-move-right '[]'
gsettings set org.gnome.shell.extensions.forge.keybindings window-move-up '[]'
gsettings set org.gnome.shell.extensions.forge.keybindings window-move-down '[]'
gsettings set org.gnome.shell.extensions.forge.keybindings window-focus-left "['<Super>Left']"
gsettings set org.gnome.shell.extensions.forge.keybindings window-focus-right "['<Super>Right']"
gsettings set org.gnome.shell.extensions.forge.keybindings window-focus-up "['<Super>Up']"
gsettings set org.gnome.shell.extensions.forge.keybindings window-focus-down "['<Super>Down']"
gsettings set org.gnome.shell.extensions.forge.keybindings window-toggle-float "['<Super>v']"
gsettings set org.gnome.shell.extensions.forge.keybindings window-toggle-always-float '[]'
gsettings set org.gnome.shell.extensions.forge.keybindings workspace-active-tile-toggle '[]'
gsettings set org.gnome.shell.extensions.forge.keybindings prefs-open "['<Super><Shift>t']"
gsettings set org.gnome.shell.extensions.forge.keybindings prefs-tiling-toggle '[]'
gsettings set org.gnome.shell.extensions.forge.keybindings window-swap-last-active '[]'
gsettings set org.gnome.shell.extensions.forge.keybindings window-snap-one-third-right '[]'
gsettings set org.gnome.shell.extensions.forge.keybindings window-snap-one-third-left '[]'
gsettings set org.gnome.shell.extensions.forge.keybindings window-snap-two-third-right '[]'
gsettings set org.gnome.shell.extensions.forge.keybindings window-snap-two-third-left '[]'
gsettings set org.gnome.shell.extensions.forge.keybindings window-snap-center '[]'
gsettings set org.gnome.shell.extensions.forge.keybindings window-resize-left-increase "['<Super>equal']"
gsettings set org.gnome.shell.extensions.forge.keybindings window-resize-left-decrease "['<Super>minus']"
gsettings set org.gnome.shell.extensions.forge.keybindings window-resize-right-increase "['<Shift><Super>equal']"
gsettings set org.gnome.shell.extensions.forge.keybindings window-resize-right-decrease "['<Shift><Super>minus']"
gsettings set org.gnome.shell.extensions.forge.keybindings window-resize-top-increase '[]'
gsettings set org.gnome.shell.extensions.forge.keybindings window-resize-top-decrease '[]'
gsettings set org.gnome.shell.extensions.forge.keybindings window-resize-bottom-increase '[]'
gsettings set org.gnome.shell.extensions.forge.keybindings window-resize-bottom-decrease '[]'

# Theme
mkdir -p ~/.config/forge/stylesheet/forge
ln -snf ~/.config/omarell/current/theme/forge.css ~/.config/forge/stylesheet/forge/stylesheet.css

# Refresh Forge to apply changes
gext disable forge@jmmaranan.com
gext enable forge@jmmaranan.com

# Remove Zellij
if command -v zellij &> /dev/null; then
  sudo rm -rf /usr/local/bin/zellij
  rm -rf ~/.config/zellij

  # Update Alacritty config to remove Zellij shell
  cp ~/.local/share/omarell/config/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
fi

# Remove .inputrc
echo -e "\n\nRemoving .inputrc...\n"
if [ -f ~/.inputrc ]; then
  rm ~/.inputrc
fi

# Remove downloaded backgrounds
echo -e "\n\nRemoving downloaded backgrounds...\n"
if [ -d ~/.config/omarell/backgrounds ]; then
  rm -rf ~/.config/omarell/backgrounds
fi

# Remove unused links
echo -e "\n\nRemoving unused links...\n"
rm -f ~/.config/omarell/themes/set-gdm-theme.sh
rm -f ~/.config/omarell/themes/set-gnome-extensions-theme.sh
rm -f ~/.config/omarell/themes/set-gnome-theme.sh

# Use docker and firewall script
echo -e "\n\nUsing docker and firewall script...\n"
if [ -f ~/.local/share/omarell/scripts/docker.sh ]; then
  source ~/.local/share/omarell/scripts/docker.sh
fi
if [ -f ~/.local/share/omarell/scripts/firewall.sh ]; then
  source ~/.local/share/omarell/scripts/firewall.sh
fi

# Remove old Omarell desktop file
echo -e "\nMigrating old Omarell desktop file...\n"
if [ -f ~/.local/share/applications/Omarell.desktop ]; then
  rm ~/.local/share/applications/Omarell.desktop
fi
cp ~/.local/share/omarell/applications/Omarell.desktop ~/.local/share/applications/Omarell.desktop
