#!/bin/sh

cd /tmp
wget https://download.sublimetext.com/sublime-text_build-3128_amd64.deb
sudo dpkg -i sublime-text_build-3128_amd64.deb
rm -rf $HOME/.config/sublime-text-3/Packages/User
ln -s $HOME/dotfiles/sublime $HOME/.config/sublime-text-3/Packages/User
