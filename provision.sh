#!/bin/bash

# System things
scripts/system-update.sh
scripts/system-locale.sh

# Install things
scripts/package-default.sh
scripts/package-docker.sh
scripts/package-git-lfs.sh
scripts/package-go.sh
scripts/package-google-chrome.sh
scripts/package-spotify.sh
scripts/package-steam.sh
scripts/package-sublime.sh

# Fix things
scripts/fix-wm.sh

# Install things for various tools
scripts/tool-node.sh
scripts/tool-python.sh
scripts/tool-ruby.sh
scripts/tool-supervisor.sh
