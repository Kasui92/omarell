BACKGROUNDS_DIR=~/.config/omarell/backgrounds/

download_background_image() {
  local url="$1"
  local path="$2"
  gum spin --title "Downloading $url as $path..." -- curl -sL -o "$BACKGROUNDS_DIR/$path" "$url"
}

for t in ~/.local/share/omarell/themes/*; do source "$t/backgrounds.sh"; done
