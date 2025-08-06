#!/bin/bash

omarell_migrations_state_path=~/.local/state/omarell/migrations
mkdir -p $omarell_migrations_state_path

for file in ~/.local/share/omarell/migrations/*.sh; do
  touch "$omarell_migrations_state_path/$(basename "$file")"
done
