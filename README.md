Vagrant LAMP config with Docker
==================================

Vagrant/Docker files for a LAMP Virtual Machine like setup. In approach to give the speed of the bare metal but the security of a VM using Linux Container (LXC). This configuration gives you a fast, reproducible development environment.

This configuration is designed for Magento development, but can be also used for any PHP application. Tested with Drupal as well.

Provides
--------

  * Ubuntu 12.04 LTS
  * Apache 2.2.22
  * MySQL 5.5.37
  * PHP 5.3.10
  * SSH
  * supervisord for keeping ssh, apache, mysql running (no init scripts).
  * shutdown script
  * Pre configured Apache virtualhost and a database ready to use
  * Just drop this config into your project and start using

Preparation
-----------

Install Vagrant (>= 1.6.2): http://www.vagrantup.com/downloads.html

Install Docker (>= 0.11.1) https://www.docker.io/gettingstarted/#h_installation

Copy the dev folder and Vagrantfile from this repository to your project folder

    vagrant up
        
It will take a few minutes for the first time.

Start using
-----------

Add this line to your `/etc/hosts` (or windows equivalent)

    127.0.0.1 www.dev-site.com dev-site.com dev.dev-site-static.com

Your project folder will be served on this url: http://www.dev-site.com:8080

You can SSH to the box:

    vagrant ssh

A mysql database has been set up and ready to use immediately. Username: `myadmin`. Password: `myadmin`. Database name: `database`

Coming Soon
-----------

1. xdebug
2. phpmyadmin
3. webgrind
