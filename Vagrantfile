# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # https://docs.vagrantup.com.

  config.vm.box = "debian/stretch64"

  config.vm.provision "shell", inline: <<-SHELL
	/vagrant/provision.sh
  SHELL
end
