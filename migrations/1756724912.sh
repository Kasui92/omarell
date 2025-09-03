#!/bin/bash

# Update GNOME settings
echo -e "\n\e[31mAlt+Tab app switching now only happens on the current workspace\e[0m"
echo

gsettings set org.gnome.shell.app-switcher current-workspace-only true

# Install Starship
if ! command -v starship &>/dev/null; then
  gum confirm "Do you want to install starship?" && {
    source ~/.local/share/omakub/applications/install/starship.sh
  }
fi
echo

# Update VSCode
if command -v code &>/dev/null; then
  if [[ -f ~/.config/omakub/current/theme/vscode.sh ]]; then
    source ~/.config/omakub/current/theme/vscode.sh
    if [[ -n "$VSC_EXTENSION" && -n "$VSC_THEME" ]]; then
      echo -e "\n\e[31mUpdating VSCode theme\e[0m"
      echo
      code --install-extension $VSC_EXTENSION >/dev/null
      sed -i "s/\"workbench.colorTheme\": \".*\"/\"workbench.colorTheme\": \"$VSC_THEME\"/g" ~/.config/Code/User/settings.json
    fi
  fi
fi
