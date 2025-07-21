#!/bin/bash

# Run required desktop installers
for installer in ~/.local/share/omarell/install/desktop/required/*.sh; do
  echo -e "\nRunning required installer: $installer"
  source "$installer"
done

# Run desktop installers
for installer in ~/.local/share/omarell/install/desktop/*.sh; do
  echo -e "\nRunning installer: $installer"
  source "$installer"
done
