#!/bin/sh

TOGGLE=$HOME/.docked

# DOCK
touch $TOGGLE
$HOME/.screenlayout/docked.sh

xmodmap -e "keycode 112 = Prior"
xmodmap -e "keycode 117 = Next"
xmodmap -e "keycode 110 = Home"
xmodmap -e "keycode 115 = End"

nmcli radio wifi off
nmcli con up udp
