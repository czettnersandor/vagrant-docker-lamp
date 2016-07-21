#!/bin/bash

if [ -f /.n98-magerun-installed ]; then
    echo "n98-magerun already installed"
    exit 0
fi

echo "=> Instaling n98-magerun"
cd /tmp
wget https://files.magerun.net/n98-magerun.phar
/bin/chmod +x ./n98-magerun.phar
cp ./n98-magerun.phar /usr/local/bin/n98-magerun

/usr/bin/wget https://files.magerun.net/n98-magerun2.phar
/bin/chmod +x ./n98-magerun2.phar
cp ./n98-magerun2.phar /usr/local/bin/n98-magerun2

echo "=> Done!"
touch /.n98-magerun-installed
