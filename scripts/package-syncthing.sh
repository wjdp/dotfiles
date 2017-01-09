#!/bin/sh

# Add the release PGP keys:
curl -s https://syncthing.net/release-key.txt | sudo apt-key add -

# Add the "release" channel to your APT sources:
echo "deb https://apt.syncthing.net/ syncthing release" | sudo tee /etc/apt/sources.list.d/syncthing.list

# Update and install syncthing:
sudo apt-get update
sudo apt-get install syncthing
