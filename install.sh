#!/bin/bash

declare -a files=(
  ".compton.conf"
  ".gitconfig"
  ".gitignore_global"
  ".i3status.conf"
  ".screenrc"
  ".tmux.conf"
  ".vimrc"
  ".zlogin"
  ".zlogout"
  ".zpreztorc"
  ".zprofile"
  ".zshrc"
)

# dotfiles installer

cd $HOME/dotfiles

for f in "${files[@]}"
do
  rm "$HOME/${f##*/}" 2> /dev/null
  ln -sv "$HOME/dotfiles/$f" "$HOME/"
done

declare -a folders=(
  "i3"
  "vim"
)

for f in "${folders[@]}"
do
  rm "$HOME/.${f##*/}" 2> /dev/null
  ln -sv "$HOME/dotfiles/$f" "$HOME/.${f##*/}"
done

# bin scripts

mkdir -p $HOME/bin
cd $HOME/dotfiles/bin

for f in *;
do
  rm $HOME/bin/$f
  ln -sv $HOME/dotfiles/bin/$f $HOME/bin/$f
done
