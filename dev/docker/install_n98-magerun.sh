#!/bin/bash

if [ -f /.n98-magerun-installed ]; then
    echo "n98-magerun already installed"
    exit 0
fi

echo "=> Instaling n98-magerun"
cd /tmp
/usr/bin/wget https://raw.githubusercontent.com/netz98/n98-magerun/master/n98-magerun.phar
/bin/chmod +x ./n98-magerun.phar
cp ./n98-magerun.phar /usr/local/bin/n98-magerun

echo "=> Done!"
touch /.n98-magerun-installed
