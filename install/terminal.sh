#!/bin/bash

# Needed for all installers
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y wget curl git unzip

# Run required terminal installers
for installer in ~/.local/share/omarell/install/terminal/required/*.sh; do
  echo -e "\nRunning required installer: $installer"
  source "$installer"
done

# Run terminal installers
for installer in ~/.local/share/omarell/install/terminal/*.sh; do
  echo -e "\nRunning installer: $installer"
  source "$installer"
done