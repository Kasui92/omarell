#!/bin/bash

print_ascii_art() {
  ascii_art='
________                               .__  .__
\_____  \   _____ _____ _______   ____ |  | |  |
 /   |   \ /     \\\__  \\\_  __ \_/ __ \|  | |  |
/    |    \  Y Y  \/ __ \|  | \/\  ___/|  |_|  |__
\_______  /__|_|  (____  /__|    \___  >____/____/
    \/      \/     \/            \/

'

  # Define the color gradient (shades of cyan and blue)
  colors=(
    '\033[38;5;81m' # Cyan
    '\033[38;5;75m' # Light Blue
    '\033[38;5;69m' # Sky Blue
    '\033[38;5;63m' # Dodger Blue
    '\033[38;5;57m' # Deep Sky Blue
    '\033[38;5;51m' # Cornflower Blue
    '\033[38;5;45m' # Royal Blue
  )

  # Split the ASCII art into lines
  IFS=$'\n' read -rd '' -a lines <<<"$ascii_art"

  # Build the colored ASCII art in a variable
  colored_ascii=""
  for i in "${!lines[@]}"; do
    color_index=$((i % ${#colors[@]}))
    colored_ascii+="${colors[color_index]}${lines[i]}\n"
  done

  # Add color reset
  colored_ascii+='\033[0m'

  # Print the colored ASCII art
  echo -e "\n$colored_ascii\n"
}

clear
print_ascii_art