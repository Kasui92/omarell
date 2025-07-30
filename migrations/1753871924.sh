#!/bin/bash

echo -e "\e[32m\nUpdate .bashrc...\e[0m"

# Configure the bash shell using Omarell defaults
[ -f ~/.bashrc ] && mv ~/.bashrc ~/.bashrc.bak
cp ~/.local/share/omarell/default/bashrc ~/.bashrc