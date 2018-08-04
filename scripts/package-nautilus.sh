#!/bin/bash

sudo add-apt-repository ppa:lubomir-brindza/nautilus-typeahead -y

sudo apt dist-upgrade -qy

sudo killall nautilus