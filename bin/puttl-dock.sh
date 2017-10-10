#!/bin/sh

TOGGLE=$HOME/.docked

# DOCK
touch $TOGGLE
xrandr --output HDMI-2 --auto
xrandr --output HDMI-1 --auto --right-of HDMI-2
xrandr --output eDP-1 --off

xmodmap -e "keycode 112 = Prior"
xmodmap -e "keycode 117 = Next"
xmodmap -e "keycode 110 = Home"
xmodmap -e "keycode 115 = End"
