# Thunderbird is a free email application that's easy to set up and customize - and it's loaded with great features! https://www.thunderbird.net

# Check if ppa:mozillateam is already installed, otherwise installed it and set priority
if ! grep -q ".*mozillateam/ppa" /etc/apt/sources.list.d/*; then
  sudo add-apt-repository ppa:mozillateam/ppa -y

  echo '
     Package: thunderbird*
     Pin: release o=LP-PPA-mozillateam
     Pin-Priority: 1001
     ' | sudo tee /etc/apt/preferences.d/mozillateamppa
fi

# Install latest version of Thunderbird https://www.mozilla.org/thunderbird/
sudo apt-get update && sudo apt-get install thunderbird
