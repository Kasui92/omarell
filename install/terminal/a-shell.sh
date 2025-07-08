# Configure the bash shell using Omarell defaults
[ -f "~/.bashrc" ] && mv ~/.bashrc ~/.bashrc.bak
cp ~/.local/share/omarell/configs/bashrc ~/.bashrc

# Load the PATH for use later in the installers
source ~/.local/share/omarell/defaults/bash/shell

[ -f "~/.inputrc" ] && mv ~/.inputrc ~/.inputrc.bak
# Configure the inputrc using Omarell defaults
cp ~/.local/share/omarell/configs/inputrc ~/.inputrc
