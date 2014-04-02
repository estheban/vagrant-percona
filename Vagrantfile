# -*- mode: ruby -*-
# vi: set ft=ruby :

#pref_interface = ['p2p0','en0: Wi-Fi (AirPort)']
#vm_interfaces = %x( VBoxManage list bridgedifs | grep ^Name ).gsub(/Name:\s+/, '').split("\n")
#pref_interface = pref_interface.map {|n| n if vm_interfaces.include?(n)}.compact
#$network_interface = pref_interface[0]

Vagrant.configure("2") do |config|
  #config.vm.network :public_network, :bridge => $network_interface

  # Multiple VM of one
  config.vm.define "percona1" do |percona1|
    percona1.vm.network :private_network, ip: "33.33.32.5"

    percona1.vm.box = "precise64"
    percona1.vm.box_url = "http://files.vagrantup.com/precise64.box"
    percona1.vm.hostname = "percona1"

    percona1.vm.synced_folder "salt/states",  "/srv/salt"
    percona1.vm.synced_folder "salt/pillars", "/srv/pillars"

    percona1.vm.provider "virtualbox" do |v|
      v.name = "percona1"
      v.memory = 1024
    end
  end

  config.vm.define "percona2" do |percona2|
    percona2.vm.network :private_network, ip: "33.33.32.6"

    percona2.vm.box = "precise64"
    percona2.vm.box_url = "http://files.vagrantup.com/precise64.box"
    percona2.vm.hostname = "percona2"

    percona2.vm.synced_folder "salt/states",  "/srv/salt"
    percona2.vm.synced_folder "salt/pillars", "/srv/pillars"

    percona2.vm.provider "virtualbox" do |v|
      v.name = "percona2"
      v.memory = 2048
    end
  end

  config.vm.define "percona3" do |percona3|
    percona3.vm.network :private_network, ip: "33.33.32.7"

    percona3.vm.box = "precise64"
    percona3.vm.box_url = "http://files.vagrantup.com/precise64.box"
    percona3.vm.hostname = "percona3"

    percona3.vm.synced_folder "salt/states",  "/srv/salt"
    percona3.vm.synced_folder "salt/pillars", "/srv/pillars"

    percona3.vm.provider "virtualbox" do |v|
      v.name = "percona3"
      v.memory = 1024
    end
  end


  config.vm.provision :salt do |c|
    c.minion_config = "salt/minion"
    c.run_highstate = true
    c.verbose = true
  end
end
