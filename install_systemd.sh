#!/bin/sh

sudo cp systemd/* /etc/systemd/system
sudo systemctl daemon-reload
sudo systemctl enable powertop.service

