#!/bin/sh

set -e
cd /tmp
wget https://github.com/acrisci/playerctl/releases/download/v2.0.2/playerctl-2.0.2_amd64.deb -O playerctl.deb
sudo dpkg -i playerctl.deb

