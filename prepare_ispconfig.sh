#!/usr/bin/env bash
sudo apt-get install -y apt-transport-https lsb-release ca-certificates
sudo wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php.list
sudo apt-get update
sed="sed"
if [[ "$OSTYPE" == "darwin"* ]]; then
    sed="gsed"
fi
find . -type f -print0 | xargs -0 $sed -i 's/php7.0/php7.1/g'