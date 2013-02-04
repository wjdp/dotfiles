#!/bin/bash

# dotfiles installer

mv $HOME/dotfiles $HOME/.dotfiles

for f in ~/.dotfiles/dot/*
do
    mv "$HOME/.${f##*/}" "$HOME/.${f##*/}.pre-dotfile" 
    ln -s "$f" "$HOME/.${f##*/}"
done
