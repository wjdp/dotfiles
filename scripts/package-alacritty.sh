#!/bin/bash
cd /tmp
wget -O bat.deb https://github.com/alacritty/alacritty/releases/download/v0.4.2/Alacritty-v0.4.2-ubuntu_18_04_amd64.deb
sudo dpkg -i bat.deb
