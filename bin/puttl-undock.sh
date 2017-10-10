#!/bin/sh

TOGGLE=$HOME/.docked

# UNDOCK
rm $TOGGLE
xrandr --output eDP-1 --auto
xrandr --output HDMI-2 --off
xrandr --output HDMI-1 --off

xmodmap -e "keycode 112 = Home"
xmodmap -e "keycode 117 = End"
xmodmap -e "keycode 110 = Prior"
xmodmap -e "keycode 115 = Next"
