#!/bin/sh

# Install spotify, from https://www.spotify.com/uk/download/linux/

# 1. Add the Spotify repository signing keys to be able to verify downloaded packages
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add -

# 2. Add the Spotify repository
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

# 3. Update list of available packages
sudo apt-get update

# 4. Install Spotify
sudo apt-get install spotify-client -qy
