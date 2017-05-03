#!/bin/sh

TOGGLE=$HOME/.docked

if [ ! -e $TOGGLE ]; then
    touch $TOGGLE
    xrandr --output HDMI-1-2 --auto
    xrandr --output HDMI-1-1 --auto --right-of HDMI-1-2
    xrandr --output eDP-1-1 --off
else
    rm $TOGGLE
    xrandr --output eDP-1-1 --auto
    xrandr --output HDMI-1-2 --off
    xrandr --output HDMI-1-1 --off
fi




