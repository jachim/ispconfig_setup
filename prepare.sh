#!/usr/bin/env bash

rm /etc/localtime
ln -s /usr/share/zoneinfo/Etc/GMT-2 /etc/localtime
echo "set mouse=\"\"" > ~/.vimrc
apt-get install redis-server

sudo apt-get install -y apt-transport-https lsb-release ca-certificates
sudo wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php.list
sudo apt-get update

