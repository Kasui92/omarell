#!/bin/bash

# Set default XCompose that is triggered with CapsLock
if [ -f ~/.XCompose ]; then
  rm ~/.XCompose
fi

tee ~/.XCompose >/dev/null <<EOF
include "%H/.local/share/omarell/default/xcompose"

# Identification
<Multi_key> <space> <n> : "$OMARELL_USER_NAME"
<Multi_key> <space> <e> : "$OMARELL_USER_EMAIL"
EOF

ibus restart
gsettings set org.gnome.desktop.input-sources xkb-options "['compose:caps']"