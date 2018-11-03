#!/bin/sh

mkdir ~/.fonts
cp ~/dotfiles/fonts/* ~/.fonts
fc-cache -f -v
