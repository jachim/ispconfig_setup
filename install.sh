#!/usr/bin/env bash
./prepare.sh
wget --no-check-certificate https://github.com/servisys/ispconfig_setup/archive/master.zip
unzip master.zip
sed="sed"
if [[ "$OSTYPE" == "darwin"* ]]; then
    sed="gsed"
fi
find ispconfig_setup-master -type f -print0 | xargs -0 $sed -i 's/php7.0/php7.1/g'
find ispconfig_setup-master -type f -print0 | xargs -0 $sed -i 's/php\/7.0/php\/7.1/g'
find ispconfig_setup-master/distros/debian9 -type f -print0 | xargs -0 $sed -i "s/cd \/tmp/#cd \/tmp/g"
find ispconfig_setup-master/distros/debian9 -type f -print0 | xargs -0 sed -i 's/if \[ \$CFG_ISPCVERSION/if \[ "\$CFG_ISPCVERSION"/g'
search="cd ispconfig3_install\/install\/"
$sed -i "s/$search/\.\.\/\.\.\/\.\.\/prepare_ispconfig\.sh\n$search\nls/g" ispconfig_setup-master/distros/debian9/install_ispconfig.sh
cd ispconfig_setup-master
./install.sh

./post_install.sh