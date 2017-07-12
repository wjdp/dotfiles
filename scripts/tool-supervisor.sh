#!/bin/sh

sudo ln -sv $HOME/dotfiles/etc/supervisor/syncthing.conf /etc/supervisor/conf.d/

sudo supervisorctl reread
