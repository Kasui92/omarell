#!/bin/bash

sudo apt install -y cups cups-pdf cups-filters system-config-printer
sudo systemctl enable --now cups.service
