# -*- mode: ruby -*-
# vi: set ft=ruby :

#pref_interface = ['p2p0','en0: Wi-Fi (AirPort)']
#vm_interfaces = %x( VBoxManage list bridgedifs | grep ^Name ).gsub(/Name:\s+/, '').split("\n")
#pref_interface = pref_interface.map {|n| n if vm_interfaces.include?(n)}.compact
#$network_interface = pref_interface[0]

Vagrant.configure("2") do |config|
  #config.vm.network :public_network, :bridge => $network_interface

#  config.vm.define "haproxy" do |haproxy|
#    haproxy.vm.network :private_network, ip: "33.33.32.10"
#
#    haproxy.vm.box = "trusty64"
#    haproxy.vm.box_url = "http://files.vagrantup.com/trusty64.box"
#    haproxy.vm.hostname = "haproxy"
#
#    haproxy.vm.synced_folder "salt/states",  "/srv/salt"
#    haproxy.vm.synced_folder "salt/pillars", "/srv/pillars"
#
#    haproxy.vm.provider "virtualbox" do |v|
#      v.name = "haproxy"
#      v.memory = 512
#    end
#  end

  config.vm.define "db1" do |db1|
    db1.vm.network :private_network, ip: "33.33.32.5"

    db1.vm.box = "trusty64"
    db1.vm.hostname = "db1"

    db1.vm.synced_folder "salt/states",  "/srv/salt"
    db1.vm.synced_folder "salt/pillars", "/srv/pillars"

    db1.vm.provider "virtualbox" do |v|
      v.name = "db1"
      v.memory = 1024
    end
  end

  config.vm.provision :salt do |c|
    c.minion_config = "salt/minion"
    c.run_highstate = true
    c.verbose = true
  end
end
