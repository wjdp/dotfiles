#!/bin/bash

declare -a files=(
  ".compton.conf"
  ".dunstrc"
  ".gitconfig"
  ".gitignore_global"
  ".i3status.conf"
  ".profile"
  ".screenrc"
  ".tmux.conf"
  ".vimrc"
  ".xsession"
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
  "vim"
)

for f in "${folders[@]}"
do
  rm "$HOME/.${f##*/}" 2> /dev/null
  ln -sv "$HOME/dotfiles/$f" "$HOME/.${f##*/}"
done

# zpresto patches

ln -sv $HOME/dotfiles/zpresto/prompt_wjdp_setup $HOME/.zprezto/modules/prompt/functions

# bin scripts

mkdir -p $HOME/bin
cd $HOME/dotfiles/bin

# rofi conf
mkdir -p $HOME/.config/rofi
ln -s $HOME/dotfiles/rofi/config $HOME/.config/rofi/config
ln -s $HOME/dotfiles/teiler/config $HOME/.config/teiler/config

# i3 make and install
$HOME/dotfiles/i3/make.sh
