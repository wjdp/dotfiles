#!/bin/sh
git clone --depth 1 --branch 0.11.0 https://github.com/Alexays/Waybar /waybar
cd /waybar
meson setup build
ninja -C build
