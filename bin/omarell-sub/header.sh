#!/bin/bash

source $OMARELL_PATH/ascii.sh
echo "" # Add spacing
echo "                                       $(cat $OMARELL_PATH/version) $(cd $OMARELL_PATH && git branch --show-current | grep -q "dev" && echo -e "\033[0;33m(dev)" || echo "")"
echo "" # Add spacing