#!/bin/bash

cd /tmp
wget https://github.com/Peltoche/lsd/releases/download/0.18.0/lsd_0.18.0_amd64.deb -O lsd.deb
sudo dpkg -i lsd.deb
