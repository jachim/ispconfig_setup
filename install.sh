#!/usr/bin/env bash
wget --no-check-certificate https://github.com/servisys/ispconfig_setup/archive/master.zip
unzip master.zip
if [[ "$OSTYPE" == "darwin"* ]]; then
    sed="gsed"
fi
find . -type f -print0 | xargs -0 $sed -i 's/php7.0/php7.1/g'
gsed -i "s/cd \/tmp/#cd \/tmp/g" ispconfig_setup-master/distros/debian9/install_ispconfig.sh
search="cd ispconfig3_install\/install\/"
gsed -i "s/$search/\.\.\/prepare_ispconfig\.sh\n$search\nls\nexit 1/g" ispconfig_setup-master/distros/debian9/install_ispconfig.sh
cd ispconfig_setup-master
./install.sh