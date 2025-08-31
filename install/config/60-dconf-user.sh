#!/bin/bash

# ==============================================================================
# GNOME USER SETTINGS AND EXTENSIONS CONFIGURATION
# TODO: use a more robust method for pulling latest extension versions
# ==============================================================================

# Check if curl and unzip are available
if ! command -v curl >/dev/null 2>&1; then
  echo "Error: curl is not installed"
  exit 1
fi

if ! command -v unzip >/dev/null 2>&1; then
  echo "Error: unzip is not installed"
  exit 1
fi

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

# List of extensions to install and enable with their version tags
# Format: "extension_uuid:version_tag"
extensions=(
  "tactile@lundal.io:62623"
  "just-perfection-desktop@just-perfection:64879"
  "blur-my-shell@aunetx:62504"
  "space-bar@luchrioh:62828"
  "undecorate@sun.wxg@gmail.com:62481"
  "tophat@fflewddur.github.io:63975"
  "quick-settings-tweaks@qwreey:62240"
  "gnome-ui-tune@itstime.tech:62908"
  "user-theme@gnome-shell-extensions.gcampax.github.com:61748"
  "AlphabeticalAppGrid@stuarthayhurst:64613"
)

# Install extensions manually by downloading from extensions.gnome.org
extensions_dir="$HOME/.local/share/gnome-shell/extensions"
mkdir -p "$extensions_dir"

for extension_info in "${extensions[@]}"; do
  extension_uuid="${extension_info%:*}"
  version_tag="${extension_info#*:}"

  # Skip if already installed
  if [ -d "$extensions_dir/$extension_uuid" ]; then
    continue
  fi

  temp_file="/tmp/${extension_uuid//[@\/]/_}.zip"

  # First attempt: with version tag
  download_url="https://extensions.gnome.org/download-extension/${extension_uuid}.shell-extension.zip?version_tag=${version_tag}"
  if curl -L -s -f -o "$temp_file" "$download_url" 2>/dev/null && [ -s "$temp_file" ] && unzip -t "$temp_file" >/dev/null 2>&1; then
    download_success=true
  else
    rm -f "$temp_file"
    # Second attempt: without version tag (latest)
    download_url="https://extensions.gnome.org/download-extension/${extension_uuid}.shell-extension.zip"
    if curl -L -s -f -o "$temp_file" "$download_url" 2>/dev/null && [ -s "$temp_file" ] && unzip -t "$temp_file" >/dev/null 2>&1; then
      download_success=true
    else
      rm -f "$temp_file"
    fi
  fi

  if [ "$download_success" = true ]; then
    extension_dir="$extensions_dir/$extension_uuid"
    mkdir -p "$extension_dir"

    if unzip -q "$temp_file" -d "$extension_dir" 2>/dev/null && [ -f "$extension_dir/metadata.json" ]; then
      rm -f "$temp_file"
    else
      echo "Error: Failed to extract or validate $extension_uuid"
      rm -f "$temp_file"
      rm -rf "$extension_dir"
    fi
  else
    echo "Error: Failed to download $extension_uuid"
  fi
done

# Enable extensions and copy schemas
enabled_extensions_string="["
for ((i=0; i<${#extensions[@]}; i++)); do
  extension_uuid="${extensions[i]%:*}"

  [ $i -gt 0 ] && enabled_extensions_string+=", "
  enabled_extensions_string+="'$extension_uuid'"

  # Copy schemas for this extension
  extension_dir="$HOME/.local/share/gnome-shell/extensions/$extension_uuid"
  if [ -d "$extension_dir/schemas" ]; then
    [ ! -f "$extension_dir/schemas/gschemas.compiled" ] && glib-compile-schemas "$extension_dir/schemas/" 2>/dev/null
    for schema_file in "$extension_dir/schemas"/*.xml; do
      [ -f "$schema_file" ] && sudo cp "$schema_file" /usr/share/glib-2.0/schemas/ 2>/dev/null
    done
  elif [ -d "$extension_dir" ]; then
    for schema_file in "$extension_dir"/*.xml; do
      [[ -f "$schema_file" && "$(basename "$schema_file")" == *.gschema.xml ]] && sudo cp "$schema_file" /usr/share/glib-2.0/schemas/ 2>/dev/null
    done
  fi
done
enabled_extensions_string+="]"

# Set enabled extensions via dconf
dconf write /org/gnome/shell/enabled-extensions "$enabled_extensions_string" 2>/dev/null || echo "Error: Failed to enable extensions via dconf"

# Compile schemas
sudo glib-compile-schemas /usr/share/glib-2.0/schemas/ 2>/dev/null || echo "Error: Failed to compile schemas"

# Apply dconf settings
if [ -f ~/.local/share/omakub/default/dconf/omakub-gnome.ini ]; then
  # Replace placeholder with actual background URL
  temp_dconf_file=$(mktemp /tmp/omakub-gnome.XXXXXX.ini)
  cp ~/.local/share/omakub/default/dconf/omakub-gnome.ini "$temp_dconf_file"
  sed -i "s|{{OMAKUB_BACKGROUND_URL}}|file://$HOME/.config/omakub/current/background|g" "$temp_dconf_file"
  # Load dconf settings
  dconf load / < "$temp_dconf_file" 2>/dev/null || echo "Error: Failed to load dconf settings from $temp_dconf_file"
  rm -f "$temp_dconf_file"
else
  echo "Error: dconf settings file not found at ~/.local/share/omakub/default/dconf/omakub-gnome.ini"
  exit 1
fi
