FROM ubuntu:14.04

# Install packages
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install ssh bash sudo supervisor git apache2 memcached libapache2-mod-php5 mysql-server-5.6 php5-mysql php5-curl php5-gd php5-mcrypt php5-xdebug php5-memcache php5-intl php5-xsl pwgen drush unzip && /usr/sbin/php5enmod mcrypt

# Add image configuration and scripts
ADD start-apache2.sh /start-apache2.sh
ADD start-mysqld.sh /start-mysqld.sh
ADD start-sshd.sh /start-sshd.sh
ADD shutdown /sbin/shutdown
ADD run.sh /run.sh
ADD firstrun.sh /firstrun.sh
RUN chmod 755 /*.sh
ADD php.ini /etc/php5/apache2/php.ini
ADD xdebug.ini /etc/php5/apache2/conf.d/xdebug.ini
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
RUN a2enmod rewrite headers

# SSHD
RUN mkdir /var/run/sshd
RUN echo 'root:vagrant' |chpasswd
RUN /firstrun.sh

EXPOSE 22 80 3306 9000
