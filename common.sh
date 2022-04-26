#!/usr/bin/env bash

apt-get update
sudo apt install nginx -y
systemctl enable nginx
ufw allow 'Nginx HTTP'
curl -4 icanhazip.com