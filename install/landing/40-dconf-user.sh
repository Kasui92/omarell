#!/bin/bash

# ==============================================================================
# GNOME USER SETTINGS CONFIGURATION
# ==============================================================================

# Import GNOME user settings from dconf
if [ -f ~/.local/share/omarell/default/dconf/omarell-gnome.ini ]; then
  # Apply dconf settings for the user
  dconf load / < ~/.local/share/omarell/default/dconf/omarell-gnome.ini
fi
