#!/bin/sh

TOGGLE=$HOME/.docked

# UNDOCK
rm $TOGGLE
xrandr --output DP-2 --off
xrandr --output HDMI-1 --off
xrandr --output eDP-1 --auto --primary

xmodmap -e "keycode 112 = Home"
xmodmap -e "keycode 117 = End"
xmodmap -e "keycode 110 = Prior"
xmodmap -e "keycode 115 = Next"

nmcli radio wifi on
nmcli con up udp
