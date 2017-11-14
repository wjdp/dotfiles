#!/bin/bash

cd /tmp
wget -O pulse-sms.deb https://github.com/klinker-apps/messenger-issues/releases/download/v1.0.0-beta8/pulse-sms-1.0.0-beta8-amd64.deb
sudo dpkg -i pulse-sms.deb
