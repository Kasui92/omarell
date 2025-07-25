#!/bin/bash

echo -e "\e[32m\nInstalling Forge and Rounded Window Corners extensions...\e[0m"

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

# Configure Rounded Window Corners
gsettings set org.gnome.shell.extensions.rounded-window-corners-reborn border-width 0
gsettings set org.gnome.shell.extensions.rounded-window-corners-reborn global-rounded-corner-settings "{'padding': <{'left': uint32 0, 'right': 0, 'top': 0, 'bottom': 0}>, 'keepRoundedCorners': <{'maximized': false, 'fullscreen': false}>, 'borderRadius': <uint32 14>, 'smoothing': <0.0>, 'borderColor': <(0.5, 0.5, 0.5, 1.0)>, 'enabled': <true>}"

echo -e "\e[32m\nMaking sure to improve the user experience...\e[0m"

# Configure Just Perfection
gsettings set org.gnome.shell.extensions.just-perfection search false
gsettings set org.gnome.shell.extensions.just-perfection dash false
gsettings set org.gnome.shell.extensions.just-perfection dash-separator false
gsettings set org.gnome.shell.extensions.just-perfection dash-app-running false
gsettings set org.gnome.shell.extensions.just-perfection show-apps-button false
gsettings set org.gnome.shell.extensions.just-perfection startup-status 1

echo -e "\e[32m\nRemoving unnecessary keybindings...\e[0m"

# Remove Space Bar Shortcut
gsettings set org.gnome.shell.extensions.space-bar.shortcuts enable-move-to-workspace-shortcuts false
gsettings set org.gnome.shell.extensions.space-bar.shortcuts activate-empty-key "@as []"
gsettings set org.gnome.shell.extensions.space-bar.shortcuts activate-previous-key "@as []"
gsettings set org.gnome.shell.extensions.space-bar.shortcuts move-workspace-left "@as []"
gsettings set org.gnome.shell.extensions.space-bar.shortcuts move-workspace-right "@as []"

# Remove gnome keybindings
gsettings set org.gnome.shell.keybindings toggle-message-tray "['<Super>m']"
gsettings set org.gnome.shell.keybindings focus-active-notification "['<Super>comma']"
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
gsettings set org.gnome.desktop.wm.keybindings show-desktop "['<Primary><Super>d', '<Primary><Alt>d', '<Super><Shift>d']"
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

echo -e "\e[32m\nSetting up custom keybindings...\e[0m"

# Use super + shift for moving windows to workspaces
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 "['<Super><Shift>1']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-2 "['<Super><Shift>2']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-3 "['<Super><Shift>3']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-4 "['<Super><Shift>4']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-5 "['<Super><Shift>5']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-6 "['<Super><Shift>6']"

# Reserve slots for custom keybindings
CUSTOM_KEYBINDINGS=(
  "custom0"
  "custom1"
  "custom2"
  "custom3"
  "custom4"
  "custom5"
  "custom6"
  "custom7"
  "custom8"
)

# Build the custom-keybindings path array
KEYBINDING_PATHS=""
for binding in "${CUSTOM_KEYBINDINGS[@]}"; do
  KEYBINDING_PATHS="${KEYBINDING_PATHS}'/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/${binding}/', "
done
# Remove trailing comma and space
KEYBINDING_PATHS="[${KEYBINDING_PATHS%, }]"

# Set the custom keybindings
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "$KEYBINDING_PATHS"

# Set wofi to Super+Space
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'Wofi'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'wofi-launcher'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Super>space'

# Set flameshot (with the sh fix for starting under Wayland) on alternate print screen key
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name 'Flameshot'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command 'sh -c -- "flameshot gui"'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding '<Control>Print'

# Set wofi themes launcher to Super + Shift + Control + Space
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ name 'Omarell Themes'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ command 'wofi-theme-launcher'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ binding '<Super><Shift><Control>space'

# Set background rotation to Super+Control+Space
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ name 'Omarell Background Next'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ command 'sh -c -- "$HOME/.local/share/omarell/scripts/omarell-theme-bg-next"'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ binding '<Super><Control>space'

# Open Gnome Terminal Super+Shift+Return
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/ name 'Gnome Terminal'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/ command 'gnome-terminal'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/ binding '<Super><Shift>Return'

# Open NeoVim Super+N
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/ name 'NeoVim'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/ command 'alacritty -e nvim'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/ binding '<Super>N'

# Open Activity Monitor Super+T
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/ name 'Activity Monitor'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/ command 'alacritty -e btop'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/ binding '<Super>t'

# Open LazyDocker Super+D
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom7/ name 'LazyDocker'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom7/ command 'alacritty -e lazydocker'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom7/ binding '<Super>d'

# Open Settings Super+Shift+S
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom8/ name 'Settings'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom8/ command 'gnome-control-center'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom8/ binding '<Super><Shift>s'

# Applications
gsettings set org.gnome.settings-daemon.plugins.media-keys terminal "['<Super>Return']"
gsettings set org.gnome.settings-daemon.plugins.media-keys www "['<Super>b']"
gsettings set org.gnome.settings-daemon.plugins.media-keys home "['<Super>f']"

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

echo -e "\e[32m\nSetting up Forge theme...\e[0m"

# Theme
mkdir -p ~/.config/forge/stylesheet/forge
ln -snf ~/.config/omarell/current/theme/forge.css ~/.config/forge/stylesheet/forge/stylesheet.css

# Refresh Forge to apply changes
gext disable forge@jmmaranan.com
gext enable forge@jmmaranan.com

echo -e "\e[32m\nRemoving old Omarell configurations...\e[0m"

# Remove Zellij
if command -v zellij &> /dev/null; then
  sudo rm -rf /usr/local/bin/zellij
  rm -rf ~/.config/zellij

  # Update Alacritty config to remove Zellij shell
  cp ~/.local/share/omarell/config/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
fi

# Remove .inputrc
echo -e "\e[32m\nRemoving .inputrc...\e[0m"
if [ -f ~/.inputrc ]; then
  rm ~/.inputrc
fi

# Remove downloaded backgrounds
echo -e "\e[32m\nRemoving downloaded backgrounds...\e[0m"
if [ -d ~/.config/omarell/backgrounds ]; then
  rm -rf ~/.config/omarell/backgrounds
fi

# Remove unused links
echo -e "\e[32m\nRemoving unused links...\e[0m"
rm -f ~/.config/omarell/themes/set-gdm-theme.sh
rm -f ~/.config/omarell/themes/set-gnome-extensions-theme.sh
rm -f ~/.config/omarell/themes/set-gnome-theme.sh

# Use docker and firewall script
echo -e "\e[32m\nUsing docker and firewall script...\e[0m"
if [ -f ~/.local/share/omarell/scripts/docker.sh ]; then
  source ~/.local/share/omarell/scripts/docker.sh
fi
if [ -f ~/.local/share/omarell/scripts/firewall.sh ]; then
  source ~/.local/share/omarell/scripts/firewall.sh
fi

# Remove old Omarell desktop file
echo -e "\e[32m\nMigrating old Omarell desktop file...\e[0m"
if [ -f ~/.local/share/applications/Omarell.desktop ]; then
  rm ~/.local/share/applications/Omarell.desktop
fi
cp ~/.local/share/omarell/applications/Omarell.desktop ~/.local/share/applications/Omarell.desktop

echo -e "\e[32m\nSetting up GDM background management...\e[0m"

# Install sudoers rule for GDM background management
sudo cp "$HOME/.local/share/omarell/default/gdm/sudoers" /etc/sudoers.d/gdm-wrapper 2>/dev/null
sudo chmod 440 /etc/sudoers.d/gdm-wrapper 2>/dev/null

# Update wofi config
sudo cp "$HOME/.local/share/omarell/config/wofi" "$HOME/.config/wofi" 2>/dev/null

echo -e "\e[32m\nSetting up Omarell themes...\e[0m"

# Setup theme links
if [ -d ~/.config/omarell/themes ]; then
  rm -rf ~/.config/omarell/themes
fi
mkdir -p ~/.config/omarell/themes
for f in ~/.local/share/omarell/themes/*; do ln -s "$f" ~/.config/omarell/themes/; done

# Get the current theme name from the first run theme variable
CURRENT_THEME_NAME=$(basename "$(realpath "$HOME/.config/omarell/current/theme")")

# Set initial theme
mkdir -p ~/.config/omarell/current
ln -snf ~/.config/omarell/themes/$CURRENT_THEME_NAME ~/.config/omarell/current/theme
ln -snf $(find "$HOME/.config/omarell/current/theme/backgrounds/" -type f | head -n 1) "$HOME/.config/omarell/current/background"

# Set specific app links for current theme
ln -snf ~/.config/omarell/current/theme/neovim.lua ~/.config/nvim/lua/plugins/theme.lua

mkdir -p ~/.config/btop/themes
ln -snf ~/.config/omarell/current/theme/btop.theme ~/.config/btop/themes/current.theme

mkdir -p ~/.config/forge/stylesheet/forge
ln -snf ~/.config/omarell/current/theme/forge.css ~/.config/forge/stylesheet/forge/stylesheet.css

# Apply GNOME theme
source ~/.config/omarell/current/theme/gnome.sh

# Set GNOME background
CURRENT_THEME_BACKGROUND="$(readlink -f "$HOME/.config/omarell/current/background")"
gsettings set org.gnome.desktop.background picture-uri $CURRENT_THEME_BACKGROUND
gsettings set org.gnome.desktop.background picture-uri-dark $CURRENT_THEME_BACKGROUND
gsettings set org.gnome.desktop.background picture-options 'zoom'

# Set GDM background
source ~/.local/share/omarell/scripts/omarell-refresh-gdm
