# Alt+F4 is very cumbersome
gsettings set org.gnome.desktop.wm.keybindings close "['<Super>w']"

# For keyboards that only have a start/stop button for music, like Logitech MX Keys Mini
gsettings set org.gnome.settings-daemon.plugins.media-keys next "['<Shift>AudioPlay']"

# Full-screen with title/navigation bar
gsettings set org.gnome.desktop.wm.keybindings toggle-fullscreen "['<Shift>F11']"

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

# Use super for workspaces
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 "['<Super>1']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 "['<Super>2']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 "['<Super>3']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 "['<Super>4']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-5 "['<Super>5']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-6 "['<Super>6']"

# Use super + shift for moving windows to workspaces
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 "['<Super><Shift>1']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-2 "['<Super><Shift>2']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-3 "['<Super><Shift>3']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-4 "['<Super><Shift>4']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-5 "['<Super><Shift>5']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-6 "['<Super><Shift>6']"

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

# Reserve slots for custom keybindings
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/']"

# Set wofi to Super+Space
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'Wofi'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'wofi-launcher'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Super>space'

# Set flameshot (with the sh fix for starting under Wayland) on alternate print screen key
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name 'Flameshot'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command 'sh -c -- "flameshot gui"'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding '<Control>Print'

# Set flameshot (with the sh fix for starting under Wayland) on alternate print screen key
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