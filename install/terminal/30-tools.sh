#!/bin/bash

# Install Neovim
source "$OMARELL_INSTALL/applications/install/nvim.sh"

# Install Fastfetch
sudo add-apt-repository -y ppa:zhangsongcui3371/fastfetch
sudo apt update -y
sudo apt install -y fastfetch

# Install LazyGit
if ! command -v lazygit &>/dev/null; then
  cd /tmp
  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
  curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
  tar xf lazygit.tar.gz lazygit
  sudo install lazygit -D -t /usr/local/bin/
  rm lazygit.tar.gz lazygit
  cd -
fi

# Install GitHub CLI
if ! command -v gh &>/dev/null; then
  curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg &&
	sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg &&
	echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list >/dev/null &&
	sudo apt update &&
	sudo apt install gh -y
fi

# Install Gitlab CLI
if ! command -v glab &>/dev/null; then
  LATEST_URL=$(curl -s https://gitlab.com/api/v4/projects/gitlab-org%2Fcli/releases | grep -o '"direct_asset_url":"[^"]*linux_amd64\.deb"' | head -1 | cut -d '"' -f 4)
  if [ -n "$LATEST_URL" ]; then
      DEB_FILE=$(basename "$LATEST_URL")
      curl -L -o "/tmp/$DEB_FILE" "$LATEST_URL"
      sudo dpkg -i "/tmp/$DEB_FILE"
      sudo apt-get install -f -y
      rm "/tmp/$DEB_FILE"
  fi
fi