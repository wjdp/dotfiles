#!/bin/bash

declare -a files=(
  ".compton.conf"
  ".gitconfig"
  ".gitignore_global"
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
