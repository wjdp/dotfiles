#!/bin/bash

declare -a files=(
  ".alacritty.yml"
  ".compton.conf"
  ".gitconfig"
  ".gitignore_global"
  ".i3status.conf"
  ".profile"
  ".screenrc"
  ".tmux.conf"
  ".vimrc"
  ".xsession"
  ".Xmodmap"
  ".zlogin"
  ".zlogout"
  ".zpreztorc"
  ".zprofile"
  ".zshrc"
  ".p10k.zsh"
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

ln -sfv $HOME/dotfiles/zpresto/prompt_wjdp_setup $HOME/.zprezto/modules/prompt/functions

# bin scripts

mkdir -p $HOME/bin
cd $HOME/dotfiles/bin

# rofi conf
mkdir -p $HOME/.config/rofi
ln -svf $HOME/dotfiles/rofi/config $HOME/.config/rofi/config
# ln -s $HOME/dotfiles/teiler/config $HOME/.config/teiler/config

# dunst conf
mkdir -p $HOME/.config/dunst
ln -svf $HOME/dotfiles/dunstrc $HOME/.config/dunst/dunstrc

# sublime config
rm -rf $HOME/.config/sublime-text-3/Packages/User
ln -svf $HOME/dotfiles/sublime $HOME/.config/sublime-text-3/Packages/User

# polybar
ln -svf $HOME/dotfiles/polybar.ini $HOME/.config/polybar/config

# fish shell

ln -svf $HOME/dotfiles/fish $HOME/.config/fish

# i3 make and install
$HOME/dotfiles/i3/make.sh
