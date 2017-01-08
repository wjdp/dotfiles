#!/bin/sh

# Installs chrome from google deb package, this deb should sort out adding the
# correct source for automatic updates all by itself.

cd /tmp
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
