FROM ubuntu:12.04

# Install packages
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install ssh sudo supervisor git apache2 libapache2-mod-php5 mysql-server php5-mysql php5-curl php5-gd php5-mcrypt php5-xdebug pwgen drush

# Add image configuration and scripts
ADD start-apache2.sh /start-apache2.sh
ADD start-mysqld.sh /start-mysqld.sh
ADD start-sshd.sh /start-sshd.sh
ADD shutdown /sbin/shutdown
ADD run.sh /run.sh
RUN chmod 755 /*.sh
ADD my.cnf /etc/mysql/conf.d/my.cnf
ADD supervisord-apache2.conf /etc/supervisor/conf.d/supervisord-apache2.conf
ADD supervisord-mysqld.conf /etc/supervisor/conf.d/supervisord-mysqld.conf
ADD supervisord-sshd.conf /etc/supervisor/conf.d/supervisord-sshd.conf

# Add MySQL utils
ADD create_mysql_admin_user.sh /create_mysql_admin_user.sh
ADD import_sql.sh /import_sql.sh
ADD create_db.sh /create_db.sh
RUN chmod 755 /*.sh /sbin/shutdown

# config to enable .htaccess
ADD apache_default /etc/apache2/sites-available/default
RUN a2enmod rewrite

# SSHD
RUN mkdir /var/run/sshd
RUN echo 'root:vagrant' |chpasswd

EXPOSE 22 80 3306