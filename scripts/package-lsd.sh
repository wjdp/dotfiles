#!/bin/bash

cd /tmp
wget https://github.com/Peltoche/lsd/releases/download/0.14.0/lsd_0.14.0_amd64.deb -O lsd.deb
sudo dpkg -i lsd.deb
