#!/bin/bash

# Needed for all installers
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y wget curl git unzip

# Run required terminal installers
for installer in ~/.local/share/omarell/install/terminal/required/*.sh; do
  echo -e "\n\e[31mRunning required installer: $installer\e[0m"
  source "$installer"
done

# Run terminal installers
for installer in ~/.local/share/omarell/install/terminal/*.sh; do
  echo -e "\n\e[31mRunning installer: $installer\e[0m"
  source "$installer"
done