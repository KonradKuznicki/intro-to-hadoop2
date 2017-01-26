# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  # preinstalled linux distribution
  config.vm.box = "centos7"
  # config.vm.box_url = "http://10.0.2.84:8000/centos7.box"

  # ports to forward to host
  config.vm.network "forwarded_port", guest: 8088, host: 8088
  config.vm.network "forwarded_port", guest: 8042, host: 8042
  config.vm.network "forwarded_port", guest: 9000, host: 9000
  config.vm.network "forwarded_port", guest: 19888, host: 19888
  config.vm.network "forwarded_port", guest: 50070, host: 50070
  config.vm.network "forwarded_port", guest: 50075, host: 50075
  config.vm.network "forwarded_port", guest: 50090, host: 50090

  config.vm.provider "virtualbox" do |vb|
    vb.name = "hadoop_all_in_one" # name in virtualbox gui
    vb.memory = "8192"
    vb.cpus = 4
  end

  # setup virtual machine
  config.vm.provision "shell", path: "provisioning/main.sh"

end
