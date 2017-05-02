#!/bin/sh

curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs

# Upgrade latest
sudo npm install -g npm
sudo npm -g update

# My packages
sudo npm install -g coffeescript bower gulp-cli grunt-cli
