#!/bin/sh

cd /tmp
wget https://download.sublimetext.com/sublime-text_build-3131_amd64.deb -O subl.deb
sudo dpkg -i subl.deb
rm -rf $HOME/.config/sublime-text-3/Packages/User
ln -s $HOME/dotfiles/sublime $HOME/.config/sublime-text-3/Packages/User
