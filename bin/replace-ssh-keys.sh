#!/bin/bash

mkdir -p ~/.ssh
user=wjdp
curl https://github.com/$user.keys > ~/.ssh/authorized_keys
