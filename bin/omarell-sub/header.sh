#!/bin/bash

source $HOME/.local/share/omarell/ascii.sh
echo "" # Add spacing
echo "                                       $(cat $HOME/.local/share/omarell/version) $(cd $HOME/.local/share/omarell && git branch --show-current | grep -q "dev" && echo -e "\033[0;33m(dev)" || echo "")"
echo "" # Add spacing