#!/bin/sh

go get github.com/gopasspw/gopass

sudo apt install -qy oathtool expect zbar-tools

cd ~/local
git clone https://github.com/tadfisher/pass-otp
cd pass-otp
sudo make install
