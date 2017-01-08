#!/bin/bash

which docker
if [[ "$?" == 1 ]]; then
  curl -sSL https://get.docker.com/ | sudo sh
  sudo usermod -aG docker will
fi
