# Install default programming languages
if [[ -v OMAKUB_FIRST_RUN_LANGUAGES ]]; then
  languages=$OMAKUB_FIRST_RUN_LANGUAGES
else
  AVAILABLE_LANGUAGES=("Node.js" "PHP")
  languages=$(gum choose "${AVAILABLE_LANGUAGES[@]}" --no-limit --height 10 --header "Select programming languages")
fi

# Add programming languages to lazyvim
enable_lazyvim_extras() {
	local temp_file=$(mktemp /tmp/omakub.XXXXX)
	local extras=("$@")
	local jq_extras=$(printf '"%s",' "${extras[@]}")
	jq_extras="[${jq_extras%,}]"

	jq --argjson extras "$jq_extras" '.extras |= (. + $extras | unique)' ~/.config/nvim/lazyvim.json >"$temp_file" &&
	mv "$temp_file" ~/.config/nvim/lazyvim.json
}

if [[ -n "$languages" ]]; then
  for language in $languages; do
    case $language in
    Node.js)
      mise use --global node@lts

      enable_lazyvim_extras "lazyvim.plugins.extras.lang.typescript"
      ;;
    PHP)
      sudo add-apt-repository -y ppa:ondrej/php
      sudo apt -y install php8.3 php8.3-{curl,apcu,intl,mbstring,opcache,pgsql,mysql,sqlite3,redis,xml,zip}
      php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
      php composer-setup.php --quiet && sudo mv composer.phar /usr/local/bin/composer
      rm composer-setup.php

      # Configure PHP's LSP to use intelephense instead of phpactor (default)
			if ! grep -q 'php_lsp' ~/.config/nvim/lua/config/options.lua; then
				echo 'vim.g.lazyvim_php_lsp = "intelephense"' >>~/.config/nvim/lua/config/options.lua
			fi

      enable_lazyvim_extras "lazyvim.plugins.extras.lang.php" "lazyvim.plugins.extras.lang.typescript"
      ;;
    esac
  done
fi
