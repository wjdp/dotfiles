#!/bin/sh

cd /tmp
wget https://github.com/acrisci/playerctl/releases/download/v2.0.1/playerctl-2.0.1_amd64.deb -O playerctl.deb
sudo dpkg -i playerctl.deb

