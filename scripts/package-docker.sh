#!/bin/bash

COMPOSE_VERSION=1.27.4

which docker
if [[ "$?" == 1 ]]; then
  sudo apt install -qyy apt-transport-https ca-certificates curl software-properties-common
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
  sudo apt install -qyy docker-ce
  sudo usermod -aG docker will
fi

cd /tmp

wget https://github.com/docker/compose/releases/download/$COMPOSE_VERSION/docker-compose-`uname -s`-`uname -m` -O docker-compose
sudo mv docker-compose /usr/local/bin
sudo chmod +x /usr/local/bin/docker-compose
