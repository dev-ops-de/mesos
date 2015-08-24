# -*- mode: ruby -*-
# vi: set ft=ruby :

ANSIBLE_GROUPS = {
    "master" => ["node1"],
    "nodes" => ["node2", "node3", "node4"],
    "all_groups:children" => ["master", "nodes"]
}
Vagrant.configure(2) do |config|
  config.vm.boot_timeout = 300
  config.vm.provider 'virtualbox' do |v|
    v.memory = 1024
    v.cpus = 2
  end
  config.vm.box = "boxcutter/centos70"
  config.vm.define "node1" do |node1|
#        node1.vm.network :private_network, type: :dhcp
    node1.vm.network "private_network", ip: "192.168.12.10"
#        node1.vm.network "public_network", ip: "192.168.13.10"
    node1.vm.network :forwarded_port, guest: 5050, host: 25050 # chronos
    node1.vm.network :forwarded_port, guest: 8500, host: 28500 # consul server
    node1.vm.network :forwarded_port, guest: 8080, host: 28080 # marathon
    node1.vm.network :forwarded_port, guest: 4400, host: 24400 # mesos
    node1.vm.network :forwarded_port, guest: 6060, host: 26060 # irgend eine app
    node1.vm.network :forwarded_port, guest: 7070, host: 27070 # testport fuer eine apps
    node1.vm.hostname = "node1"
    node1.vm.provision "ansible" do |ansible|
      ansible.playbook = "playbook.yml"
      ansible.groups = ANSIBLE_GROUPS
    end
  end

  config.vm.define "node2" do |node2|
    node2.vm.network "private_network", ip: "192.168.12.11"
    node2.vm.hostname = "node2"
    node2.vm.provision "ansible" do |ansible|
      ansible.playbook = "playbook.yml"
      ansible.groups = ANSIBLE_GROUPS
    end
  end

  config.vm.define "node3" do |node3|
    node3.vm.network "private_network", ip: "192.168.12.12"
    node3.vm.hostname = "node3"
    node3.vm.provision "ansible" do |ansible|
      ansible.playbook = "playbook.yml"
      ansible.groups = ANSIBLE_GROUPS
    end
  end

  config.vm.define "node4" do |node4|
    node4.vm.network "private_network", ip: "192.168.12.13"
    node4.vm.hostname = "node4"
    node4.vm.provision "ansible" do |ansible|
      ansible.playbook = "playbook.yml"
      ansible.groups = ANSIBLE_GROUPS
    end
  end
end
