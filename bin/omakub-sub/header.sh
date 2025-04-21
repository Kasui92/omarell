#!/bin/bash

source $OMAKUB_PATH/ascii.sh
echo "" # Add spacing
echo "                                       $(cat $OMAKUB_PATH/version) $(cd $OMAKUB_PATH && git branch --show-current | grep -q "dev" && echo -e "\033[0;33m(dev)\033[0m" || echo "")"
echo "" # Add spacing