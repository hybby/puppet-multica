# -*- mode: ruby -*-
# vi: set ft=ruby :
#
# Box used: trusty-puppet: https://oss-binaries.phusionpassenger.com/vagrant/boxes/latest/ubuntu-14.04-amd64-vbox.box

Vagrant.configure(2) do |config|
  config.vm.box_check_update = false

  # --------------
  # puppet options
  # --------------
  config.vm.provision "puppet" do |puppet|
    puppet.options = "--verbose"
    puppet.working_directory = "/vagrant"
    puppet.module_path = "modules"
    puppet.manifests_path = "manifests"
    puppet.manifest_file = "nodes.pp"
    puppet.hiera_config_path = "hiera.yaml"
  end

  # ------------
  # puppet nodes
  # ------------
  config.vm.define "puppet-1" do |server|
    server.vm.hostname = "puppet-1.hybby.com"
    server.vm.box = "trusty-puppet"
    server.vm.network :private_network, ip: "192.168.10.11"
  end

  config.vm.define "puppet-2" do |server|
    server.vm.hostname = "puppet-2.hybby.com"
    server.vm.box = "trusty-puppet"
    server.vm.network :private_network, ip: "192.168.10.12"
  end

  config.vm.define "puppet-3" do |server|
    server.vm.hostname = "puppet-3.hybby.com"
    server.vm.box = "trusty-puppet"
    server.vm.network :private_network, ip: "192.168.10.13"
  end

  # --------
  # nfs node
  # --------
  config.vm.define "nfs" do |server|
    server.vm.hostname = "nfs.hybby.com"
    server.vm.box = "trusty-puppet"
    server.vm.network :private_network, ip: "192.168.10.14"
  end

  # -----------
  # client node
  # -----------
  config.vm.define "client" do |server|
    server.vm.hostname = "client.hybby.com"
    server.vm.box = "trusty-puppet"
    server.vm.network :private_network, ip: "192.168.10.15"
  end
end
