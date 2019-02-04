#!/bin/bash
cd /tmp
wget -O bat.deb https://github.com/sharkdp/bat/releases/download/v0.9.0/bat_0.9.0_amd64.deb
sudo dpkg -i bat.deb
