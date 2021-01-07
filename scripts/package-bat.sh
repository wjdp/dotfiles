#!/bin/bash
cd /tmp
wget -O bat.deb https://github.com/sharkdp/bat/releases/download/v0.17.1/bat_0.17.1_amd64.deb
sudo dpkg -i bat.deb
