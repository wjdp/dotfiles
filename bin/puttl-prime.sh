#!/bin/sh

STATE=$HOME/.prime

if [ ! -e $STATE ]; then
    # ENABLE GRAPHICS
    touch $STATE
    sudo prime-select nvidia
    sudo systemctl restart lightdm.service
else
    # USE INTEGRATED
    rm $STATE
    sudo prime-select intel
    sudo systemctl restart lightdm.service
fi
