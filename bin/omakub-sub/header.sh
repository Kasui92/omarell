#!/bin/bash

source $OMAKUB_PATH/ascii.sh
echo "" # Add spacing
echo "                                       $(cat $OMAKUB_PATH/version) $([ $(git branch --show-current) == "dev" ] && echo "\033[0;33m(dev)\033[0m" || echo "")"
echo "" # Add spacing