#!/bin/sh

TOGGLE=$HOME/.docked

# UNDOCK
rm $TOGGLE
$HOME/.screenlayout/laptop.sh

xmodmap -e "keycode 112 = Home"
xmodmap -e "keycode 117 = End"
xmodmap -e "keycode 110 = Prior"
xmodmap -e "keycode 115 = Next"

nmcli radio wifi on
nmcli con up udp
