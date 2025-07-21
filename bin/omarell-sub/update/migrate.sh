#!/bin/bash

cd $HOME/.local/share/omarell
last_updated_at=$(git log -1 --format=%cd --date=unix)
git pull

if [ -d "$HOME/.local/share/omarell/migrations" ] && [ "$(ls -A $HOME/.local/share/omarell/migrations)" ]; then
  for file in $HOME/.local/share/omarell/migrations/*.sh; do
    filename=$(basename "$file")
    migrate_at="${filename%.sh}"

    if [ $migrate_at -gt $last_updated_at ]; then
      echo "Running migration for $migrate_at"
      source $file
    fi
  done
fi

cd -