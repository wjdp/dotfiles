#!/bin/sh

cd /tmp
# This needs bumping to go version desired
wget https://storage.googleapis.com/golang/go1.11.linux-amd64.tar.gz -O go.tar.gz
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf go.tar.gz

# Go apps I use
go get -u github.com/gopasspw/gopass
