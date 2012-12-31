#!/bin/bash

# dotfiles installer

mv $HOME/dotfiles $HOME/.dotfiles

for f in ~/.dotfiles/dot/*
do
    ln -s "$f" "$HOME/.${f##*/}"
done