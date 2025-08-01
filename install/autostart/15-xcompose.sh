#!/bin/bash

# XCompose configuration
ibus restart
gsettings set org.gnome.desktop.input-sources xkb-options "['compose:caps']"

