#!/bin/bash

# Update the package database
sudo updatedb

# Update and upgrade system packages
sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y

# Remove unnecessary packages and clean up
sudo apt purge -y byobu snapd landscape-common unattended-upgrades \
              cloud-init cloud-guest-utils \
              apport apport-symptoms popularity-contest

# Clean up unnecessary packages
sudo apt autoremove -y && sudo apt clean