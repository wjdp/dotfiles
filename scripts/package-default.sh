#!/bin/bash

# Installs packages I want from the ubuntu index

# WM / System
sudo apt install -qy lxappearance rofi feh supervisor hsetroot xautolock pavucontrol pasystray flameshot xautomation

# CLI tools
sudo apt install -qy git git-lfs zsh vim curl wget httpie ruby ruby-dev htop powertop build-essential python3-pip python3-dev sudo software-properties-common pass xdotool ncdu

# Stuff I tend to need
sudo apt install -qy imagemagick libpq-dev libjpeg-dev libxslt1-dev

# GUI software
sudo apt install -qy audacity gimp gpick vlc mpv meld arandr baobab nemo

# Fallback fonts

sudo apt install -qy fonts-noto
