#!/bin/bash

which docker
if [[ "$?" == 1 ]]; then
  curl -sSL https://get.docker.com/ | sudo sh
  sudo usermod -aG docker will
fi

cd /tmp

wget https://github.com/docker/compose/releases/download/1.13.0/docker-compose-`uname -s`-`uname -m` -O docker-compose
sudo mv docker-compose /usr/local/bin
sudo chmod +x /usr/local/bin/docker-compose
