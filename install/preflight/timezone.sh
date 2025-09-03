#!/bin/bash

echo -e "\e[31mSelect your timezone:\e[0m"
timezone=$(timedatectl list-timezones | fzf --prompt="Timezone > " --height=40% --border)
if [ -n "$timezone" ]; then
    sudo timedatectl set-timezone "$timezone"
    echo -e "\e[32mTimezone set to: $timezone\e[0m"
else
    echo -e "\e[31mNo timezone selected.\e[0m"
fi