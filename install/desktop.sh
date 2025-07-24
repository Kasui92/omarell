#!/bin/bash

# Run required desktop installers
for installer in ~/.local/share/omarell/install/desktop/required/*.sh; do
  echo -e "\n\e[31mRunning required installer: $installer\e[0m"
  source "$installer"
done

# Run desktop installers
for installer in ~/.local/share/omarell/install/desktop/*.sh; do
  echo -e "\n\e[31mRunning installer: $installer\e[0m"
  source "$installer"
done
