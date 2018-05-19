#!/usr/bin/env bash
apt-get -y install php7.1 php7.1-common php7.1-gd php7.1-mysql php7.1-imap php7.1-cli php7.1-cgi php-pear php7.1-mcrypt php7.1-curl php7.1-intl php7.1-pspell php7.1-recode php7.1-sqlite3 php7.1-tidy php7.1-xmlrpc php7.1-zip php7.1-mbstring php7.1-imap php7.1-mcrypt php7.1-snmp php7.1-xmlrpc php7.1-xsl php7.1-dev php7.1-bcmath php7.1-fpm php-redis

sudo apt-get install libcurl4-openssl-dev pkg-config libssl-dev #for mongo pecl
sudo pecl install mongodb

echo "extension=mongodb.so" > /etc/php/7.1/mods-available/mongo.ini
ln -s /etc/php/7.1/mods-available/mongo.ini /etc/php/7.1/cli/conf.d/mongo.ini
ln -s /etc/php/7.1/mods-available/mongo.ini /etc/php/7.1/fpm/conf.d/mongo.ini

echo "date.timezone = \"Europe/Warsaw\";" >> /etc/php/7.1/mods-available/itur.ini
ln -s /etc/php/7.1/mods-available/itur.ini /etc/php/7.1/fpm/conf.d/itur.ini
ln -s /etc/php/7.1/mods-available/itur.ini /etc/php/7.1/cli/conf.d/itur.ini


#install mongodb from documentation
echo deb http://ftp.debian.org/debian jessie-backports main >> /etc/apt/sources.list

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5
echo "deb http://repo.mongodb.org/apt/debian jessie/mongodb-org/3.6 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.6.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo service mongod start