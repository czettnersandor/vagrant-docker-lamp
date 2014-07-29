#!/bin/bash

if [ ! -f /.mysql_admin_created ]; then
    /create_mysql_admin_user.sh
fi

if [ ! -f /.webgrind-installed ]; then
    /install_webgrind.sh
fi

exec supervisord -n