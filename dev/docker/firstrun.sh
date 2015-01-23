#!/bin/bash

if [ ! -f /.mysql_admin_created ]; then
    /create_mysql_admin_user.sh
fi

if [ ! -f /.webgrind-installed ]; then
    /install_webgrind.sh
fi

if [ ! -f /.n98-magerun-installed ]; then
    /install_n98-magerun.sh
fi

if [ ! -f /.composer-installed ]; then
    /install_composer.sh
fi
