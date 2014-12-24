#!/bin/bash

if [ -f /.composer-installed ]; then
    echo "Composer already installed"
    exit 0
fi

echo "=> Instaling Composer"
cd /
/usr/bin/php -r "readfile('https://getcomposer.org/installer');" | /usr/bin/php
/bin/chmod a+rwx composer.phar
mv composer.phar /usr/local/bin/composer

echo "=> Done!"
touch /.composer-installed
