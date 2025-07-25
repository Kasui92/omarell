#!/bin/bash

cp -f ~/.config/walker/config.toml ~/.config/walker/config.toml.bak 2>/dev/null
cp -f ~/.local/share/omarell/config/walker/config.toml ~/.config/walker/ 2>/dev/null

if cmp -s ~/.config/walker/config.toml.bak ~/.config/walker/config.toml; then
  rm ~/.config/walker/config.toml.bak
else
  echo -e "\e[31mExisting .config/walker/config.toml replaced with new Omarell default, but a .bak file was made.\e[0m"
fi

pkill walker
#uwsm app -- walker --gapplication-service &
