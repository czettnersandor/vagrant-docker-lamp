#!/bin/bash

if [ -f /.webgrind-installed ]; then
    echo "Webgrind already installed"
    exit 0
fi

echo "=> Instaling Webgrind"
cd /var/www/html
/usr/bin/wget http://webgrind.googlecode.com/files/webgrind-release-1.0.zip
/usr/bin/unzip webgrind-release-1.0.zip

echo "=> Done!"
touch /.webgrind-installed
