#!/usr/bin/env bash
sed="sed"
if [[ "$OSTYPE" == "darwin"* ]]; then
    sed="gsed"
fi
find ispconfig_setup-master -type f -print0 | xargs -0 $sed -i 's/php7.0/php7.1/g'
find ispconfig_setup-master -type f -print0 | xargs -0 $sed -i 's/php\/7.0/php\/7.1/g'