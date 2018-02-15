#!/bin/zsh
cd ~
mv .zhistory .zhistory_bad
strings .zhistory_bad > .zhistory
fc -R .zhistory
