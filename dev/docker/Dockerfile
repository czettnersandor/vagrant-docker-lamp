FROM ubuntu:16.04

# Install packages
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install ssh bash sudo supervisor git apache2 memcached php7.0 libapache2-mod-php mysql-server php-mysql php-curl php-gd php-mcrypt php-xdebug php-memcache php-intl php-xsl php-zip phpmyadmin pwgen drush unzip

# Add image configuration and scripts
ADD start-apache2.sh /start-apache2.sh
ADD start-mysqld.sh /start-mysqld.sh
ADD start-sshd.sh /start-sshd.sh
ADD shutdown /sbin/shutdown
ADD run.sh /run.sh
ADD firstrun.sh /firstrun.sh
RUN chmod 755 /*.sh
ADD sshd_config /etc/ssh/sshd_config
ADD supervisord-apache2.conf /etc/supervisor/conf.d/supervisord-apache2.conf
ADD supervisord-mysqld.conf /etc/supervisor/conf.d/supervisord-mysqld.conf
ADD supervisord-sshd.conf /etc/supervisor/conf.d/supervisord-sshd.conf

# Add MySQL users and `database`
ADD create_mysql_admin_user.sh /create_mysql_admin_user.sh
ADD install_webgrind.sh /install_webgrind.sh
ADD install_n98-magerun.sh /install_n98-magerun.sh
ADD install_composer.sh /install_composer.sh
RUN chmod 755 /*.sh /sbin/shutdown

# Apache config
ADD apache_default /etc/apache2/sites-available/000-default.conf
ADD apache_webgrind /etc/apache2/sites-enabled/webgrind.conf
ADD ports.conf /etc/apache2/ports.conf
RUN a2enmod rewrite headers suexec

# PHPMyAdmin config
RUN echo "\n# Include PHPMyAdmin configuration\nInclude /etc/phpmyadmin/apache.conf\n" >> /etc/apache2/apache2.conf
RUN sed -i -e "s/\/\/ \$cfg\['Servers'\]\[\$i\]\['AllowNoPassword'\]/\$cfg\['Servers'\]\[\$i\]\['AllowNoPassword'\]/g" /etc/phpmyadmin/config.inc.php

# SSHD
RUN mkdir /var/run/sshd
RUN echo 'root:vagrant' |chpasswd
RUN /firstrun.sh

EXPOSE 22 80 443 3306 9000 35729
