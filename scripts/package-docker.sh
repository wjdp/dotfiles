#!/bin/bash

COMPOSE_VERSION=1.27.4

which docker
if [[ "$?" == 1 ]]; then
  curl -sSL https://get.docker.com/ | sudo sh
  sudo usermod -aG docker will
fi

cd /tmp

wget https://github.com/docker/compose/releases/download/$COMPOSE_VERSION/docker-compose-`uname -s`-`uname -m` -O docker-compose
sudo mv docker-compose /usr/local/bin
sudo chmod +x /usr/local/bin/docker-compose
