#!/bin/bash

cd /tmp
curl https://noto-website.storage.googleapis.com/pkgs/NotoColorEmoji-unhinted.zip > noto.zip
unzip -o noto.zip
mkdir -p $HOME/.fonts
cp NotoColorEmoji.ttf $HOME/.fonts
mkdir -p $HOME/.config/fontconfig/
cat << 'EOF' > ~/.config/fontconfig/fonts.conf
<?xml version="1.0" encoding="UTF-8"?><!DOCTYPE fontconfig SYSTEM "fonts.dtd">

<match>
 <test name="family"><string>sans-serif</string></test>
 <edit name="family" mode="prepend" binding="strong">
 <string>Noto Color Emoji</string>
 </edit>
</match>

<match>
 <test name="family"><string>serif</string></test>
 <edit name="family" mode="prepend" binding="strong">
 <string>Noto Color Emoji</string>
 </edit>
</match>

<match>
 <test name="family"><string>Apple Color Emoji</string></test>
 <edit name="family" mode="prepend" binding="strong">
 <string>Noto Color Emoji</string>
 </edit>
</match>
EOF
fc-cache -f -v
