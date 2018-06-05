#!/bin/sh

cd /tmp
wget https://github.com/acrisci/playerctl/releases/download/v0.6.0/playerctl-0.6.0_amd64.deb -O playerctl.deb
sudo dpkg -i playerctl.deb

