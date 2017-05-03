#!/bin/sh

TOGGLE=$HOME/.docked

if [ ! -e $TOGGLE ]; then
    touch $TOGGLE
    xrandr --output HDMI-1-1 --auto
    xrandr --output DP-1-2 --auto
    xrandr --output eDP-1-1 --off
    xrandr --output HDMI-1-1 --right-of DP-1-2
else
    rm $TOGGLE
    xrandr --output eDP-1-1 --auto
    xrandr --output HDMI-1-1 --off
    xrandr --output DP-1-2 --off
fi




