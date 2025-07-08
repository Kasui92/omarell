# Set default XCompose that is triggered with CapsLock
tee ~/.XCompose >/dev/null <<EOF
include "%H/.local/share/omasway/default/xcompose"

# Identification
<Multi_key> <space> <n> : "$OMASWAY_USER_NAME"
<Multi_key> <space> <e> : "$OMASWAY_USER_EMAIL"
EOF

ibus restart
gsettings set org.gnome.desktop.input-sources xkb-options "['compose:caps']"