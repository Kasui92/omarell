#!/bin/bash

# Update the package database
sudo updatedb
# Update and upgrade system packages
sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y
# Clean up unnecessary packages
sudo apt autoremove -y && sudo apt clean