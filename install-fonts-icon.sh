#!/bin/bash
ln -sf $HOME/dotfiles/fonts-icon/material-design-icons/iconfont/MaterialIcons-Regular.ttf ~/.fonts/
ln -sf $HOME/dotfiles/fonts-icon/MaterialDesign-Webfont/fonts/materialdesignicons-webfont.ttf ~/.fonts/
ln -sf "$HOME/dotfiles/fonts-icon/Font-Awesome/otfs/Font Awesome 5 Free-Solid-900.otf" ~/.fonts/
ln -sf "$HOME/dotfiles/fonts-icon/Font-Awesome/otfs/Font Awesome 5 Free-Regular-400.otf" ~/.fonts/
ln -sf "$HOME/dotfiles/fonts-icon/Font-Awesome/otfs/Font Awesome 5 Brands-Regular-400.otf" ~/.fonts/
ln -sf $HOME/dotfiles/fonts-icon/typicons.font/src/font/typicons.ttf ~/.fonts/
fc-cache -fv
