#!/usr/bin/env bash

apt-get install -y sudo make dirmngr composer
rm /etc/localtime
ln -s /usr/share/zoneinfo/Etc/GMT-2 /etc/localtime
echo "set mouse=\"\"" > ~/.vimrc
apt-get install -y redis-server

sudo apt-get install -y apt-transport-https lsb-release ca-certificates
sudo wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php.list
sudo apt-get update

#install the newest version of composer globally
cd /tmp
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
