#!/bin/bash

set -euo pipefail

sudo add-apt-repository -y ppa:fish-shell/release-3
sudo apt install -y fish
curl -L https://get.oh-my.fish | fish
