#!/bin/bash
mkdir -p $HOME/.i3
rm $HOME/.i3/config
cat $HOME/dotfiles/i3/conf/0-common > $HOME/.i3/config
cat $HOME/dotfiles/i3/conf/`hostname` >> $HOME/.i3/config

