# Alt+F4 is very cumbersome
gsettings set org.gnome.desktop.wm.keybindings close "['<Super>w']"

# For keyboards that only have a start/stop button for music, like Logitech MX Keys Mini
gsettings set org.gnome.settings-daemon.plugins.media-keys next "['<Shift>AudioPlay']"

# Full-screen with title/navigation bar
gsettings set org.gnome.desktop.wm.keybindings toggle-fullscreen "['<Shift>F11']"

# Use 6 fixed workspaces instead of dynamic mode
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.desktop.wm.preferences num-workspaces 6

# Use alt for pinned apps
gsettings set org.gnome.shell.keybindings switch-to-application-1 "['<Alt>1']"
gsettings set org.gnome.shell.keybindings switch-to-application-2 "['<Alt>2']"
gsettings set org.gnome.shell.keybindings switch-to-application-3 "['<Alt>3']"
gsettings set org.gnome.shell.keybindings switch-to-application-4 "['<Alt>4']"
gsettings set org.gnome.shell.keybindings switch-to-application-5 "['<Alt>5']"
gsettings set org.gnome.shell.keybindings switch-to-application-6 "['<Alt>6']"
gsettings set org.gnome.shell.keybindings switch-to-application-7 "['<Alt>7']"
gsettings set org.gnome.shell.keybindings switch-to-application-8 "['<Alt>8']"
gsettings set org.gnome.shell.keybindings switch-to-application-9 "['<Alt>9']"

# Use super for workspaces
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 "['<Super>1']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 "['<Super>2']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 "['<Super>3']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 "['<Super>4']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-5 "['<Super>5']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-6 "['<Super>6']"

# Remove gnome keybindings
gsettings set org.gnome.desktop.wm.keybindings switch-input-source "@as []"
gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward "@as []"
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-down "@as []"
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-up "@as []"
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-left "@as []"
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-right "@as []"
gsettings set org.gnome.desktop.mutter.keybindings toggle-tiled-right "@as []"
gsettings set org.gnome.desktop.mutter.keybindings toggle-tiled-left "@as []"

# Reserve slots for custom keybindings
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/']"

# Set wofi to Super+Space
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'Wofi'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'wofi-launcher'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Super>space'

# Set flameshot (with the sh fix for starting under Wayland) on alternate print screen key
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name 'Flameshot'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command 'sh -c -- "flameshot gui"'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding '<Control>Print'

# Start a new alacritty window (rather than just switch to the already open one)
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ name 'New Alacritty Window'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ command 'alacritty'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ binding '<Shift><Alt>2'

# Start a new Default Browser window (rather than just switch to the already open one)
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ name 'New Browser Window'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ command "$(xdg-settings get default-web-browser | sed 's/.desktop//')"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ binding '<Shift><Alt>1'

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