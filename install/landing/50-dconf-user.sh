#!/bin/bash

# ==============================================================================
# GNOME USER SETTINGS AND EXTENSIONS CONFIGURATION
# ==============================================================================

# Check if we're in a graphical environment
if [ -z "$DISPLAY" ] && [ -z "$WAYLAND_DISPLAY" ]; then
  # We're likely on a TTY, set up environment for dconf/gsettings
  export DISPLAY=:0
fi

# Ensure we have a dbus session for dconf/gsettings
if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
  # Try to find the session bus address for the user
  if [ -f "/run/user/$(id -u)/bus" ]; then
    export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"
  fi
fi

# List of extensions to install and enable
extensions=(
  "forge@jmmaranan.com"
  "just-perfection-desktop@just-perfection"
  "blur-my-shell@aunetx"
  "space-bar@luchrioh"
  "undecorate@sun.wxg@gmail.com"
  "tophat@fflewddur.github.io"
  "AlphabeticalAppGrid@stuarthayhurst"
  "gnome-ui-tune@itstime.tech"
  "quick-settings-tweaks@qwreey"
  "rounded-window-corners@fxgn"
  "user-theme@gnome-shell-extensions.gcampax.github.com"
)

# Install extensions using gext
extension_install_success=true
for extension in "${extensions[@]}"; do
  # Try filesystem backend first, then fallback to dbus if needed
  if ! gext install --filesystem "$extension" >/dev/null 2>&1; then
    if ! gext install "$extension" >/dev/null 2>&1; then
      extension_install_success=false
    fi
  fi
done

# Enable all extensions at once using gsettings (only if installation was successful)
if [ "$extension_install_success" = true ]; then
  enabled_extensions_string="["
  for ((i=0; i<${#extensions[@]}; i++)); do
    if [ $i -gt 0 ]; then
      enabled_extensions_string+=", "
    fi
    enabled_extensions_string+="'${extensions[i]}'"
  done
  enabled_extensions_string+="]"

  gsettings set org.gnome.shell enabled-extensions "$enabled_extensions_string" >/dev/null 2>&1
fi

# Copy extension schemas to system directory for proper configuration (only if extensions were installed)
if [ "$extension_install_success" = true ]; then
  extension_schemas=(
    "forge@jmmaranan.com:org.gnome.shell.extensions.forge.gschema.xml"
    "just-perfection-desktop@just-perfection:org.gnome.shell.extensions.just-perfection.gschema.xml"
    "blur-my-shell@aunetx:org.gnome.shell.extensions.blur-my-shell.gschema.xml"
    "space-bar@luchrioh:org.gnome.shell.extensions.space-bar.gschema.xml"
    "tophat@fflewddur.github.io:org.gnome.shell.extensions.tophat.gschema.xml"
    "AlphabeticalAppGrid@stuarthayhurst:org.gnome.shell.extensions.AlphabeticalAppGrid.gschema.xml"
    "gnome-ui-tune@itstime.tech:org.gnome.shell.extensions.gnome-ui-tune.gschema.xml"
    "quick-settings-tweaks@qwreey:org.gnome.shell.extensions.quick-settings-tweaks.gschema.xml"
    "rounded-window-corners@fxgn:org.gnome.shell.extensions.rounded-window-corners-reborn.gschema.xml"
    "user-theme@gnome-shell-extensions.gcampax.github.com:org.gnome.shell.extensions.user-theme.gschema.xml"
  )

  for schema_info in "${extension_schemas[@]}"; do
    extension_dir="${schema_info%:*}"
    schema_file="${schema_info#*:}"
    schema_path="$HOME/.local/share/gnome-shell/extensions/$extension_dir/schemas/$schema_file"

    if [ -f "$schema_path" ]; then
      sudo cp "$schema_path" /usr/share/glib-2.0/schemas/ >/dev/null 2>&1
    fi
  done

  # Compile schemas
  sudo glib-compile-schemas /usr/share/glib-2.0/schemas/ >/dev/null 2>&1

  # Wait a moment for extensions to be properly loaded
  sleep 2
fi

# Now apply dconf settings
if [ -f ~/.local/share/omarell/default/dconf/omarell-gnome.ini ]; then
  dconf load / < ~/.local/share/omarell/default/dconf/omarell-gnome.ini
fi
