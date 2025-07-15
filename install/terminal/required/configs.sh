# Copy over Omasway configs
mkdir -p ~/.config
cp -R ~/.local/share/omarell/config/* ~/.config/

# Configure the bash shell using Omarell defaults
[ -f "~/.bashrc" ] && mv ~/.bashrc ~/.bashrc.bak
echo "source ~/.local/share/omarell/default/bash/rc" >~/.bashrc

# Load the PATH for use later in the installers
source ~/.local/share/omarell/default/bash/shell

# Configure the inputrc using Omarell defaults
[ -f "~/.inputrc" ] && mv ~/.inputrc ~/.inputrc.bak
echo "\$include ~/.local/share/omarell/default/bash/inputrc" >~/.inputrc

# Set common git aliases
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global pull.rebase true

# Set identification from install inputs
if [[ -n "${OMASWAY_USER_NAME//[[:space:]]/}" ]]; then
  git config --global user.name "$OMASWAY_USER_NAME"
fi

if [[ -n "${OMASWAY_USER_EMAIL//[[:space:]]/}" ]]; then
  git config --global user.email "$OMASWAY_USER_EMAIL"
fi