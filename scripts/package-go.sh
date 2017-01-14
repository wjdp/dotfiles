#!/bin/sh

cd /tmp
# This needs bumping to go version desired
wget https://storage.googleapis.com/golang/go1.7.4.linux-amd64.tar.gz -O go.tar.gz
sudo tar -C /usr/local -xzf go.tar.gz
