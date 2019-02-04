#!/bin/sh

# Upgrade latest
sudo pip install -U pip
sudo pip3 install -U pip

# My packages
# sudo pip install ...

sudo pip install awscli && \
sudo pip install awsebcli && \
sudo pip install aws-shell
sudo pip install icdiff

# Dev

sudo pip3 install virtualenv virtualenvwrapper
