# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define :vm1 do |node|
    node.vm.box = "bento/ubuntu-18.04"
    node.vm.network :private_network, ip: "10.200.19.35"
  end

  config.vm.define :vm2 do |node|
    node.vm.box = "bento/ubuntu-18.04"
    node.vm.network :private_network, ip: "10.200.19.36"
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "site.yml"

    ansible.groups = {
      "master" => ["vm1"],
      "node"  => ["vm2"],
    }

    ansible.extra_vars = "inventories/vagrant/group_vars/all.yml"
  end
end
