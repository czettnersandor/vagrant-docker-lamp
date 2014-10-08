# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

# Set the default provider to docker.
ENV['VAGRANT_DEFAULT_PROVIDER'] = "docker"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  # config.vm.box = "ubuntu"

  config.ssh.password = "vagrant"
  config.ssh.username = "root"
  config.ssh.port = 22

  config.vm.provider "docker" do |d|
    d.build_dir = "./dev/docker"
    d.has_ssh = true
    d.cmd = ["/run.sh"]
  end

  config.vm.network :forwarded_port, guest: 80, host: 8080

end
