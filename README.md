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

XDebug with Sublime Text
------------------------

Install this plugin via Package Control: https://github.com/martomo/SublimeTextXdebug

### Keyboard Shortcuts

Shift+f8: Open XDebug quick panel

f8: Open XDebug control quick panel when debugger is connected

Ctrl+f8: Toggle breakpoint

Ctrl+Shift+f5: Run to next breakpoint

Ctrl+Shift+f6: Step over

Ctrl+Shift+f7: Step into

Ctrl+Shift+f8: Step out

### Project configuration

*.sublime-project:

    {
        "folders":
        [
            {
                "path": "..."
            }
        ],
        "settings":
        {
            "xdebug": {
                "path_mapping": {
                    "/vagrant" : "/absolute/path/to/project/on/computer",
                },
                "ide_key": "sublime.xdebug",
                "url": "http://www.dev-site.com:8080",
                "port": 9000,
                "close_on_stop": true,
                "debug": true
            }
        }
    }

Coming Soon
-----------

1. phpmyadmin
2. webgrind