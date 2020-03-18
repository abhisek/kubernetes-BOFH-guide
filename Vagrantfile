IMAGE_NAME = "bento/ubuntu-16.04"
N = (ENV["KUBERNETES_NODE_COUNT"] || 5).to_i

Vagrant.configure("2") do |config|
    config.ssh.insert_key = false

    config.vm.provider "virtualbox" do |v|
        v.memory = 2048
        v.cpus = 2
    end

    config.vm.define "k8s-master" do |master|
        master.vm.box = IMAGE_NAME
        master.vm.network "private_network", ip: "192.168.50.10"
        master.vm.hostname = "k8s-master"
        master.vm.network "forwarded_port", guest: 6443, host: 6443
        master.vm.provision "ansible" do |ansible|
            ansible.compatibility_mode = "2.0"
            ansible.playbook = "kubernetes-setup/master-playbook.yml"
            ansible.extra_vars = {
                node_ip: "192.168.50.10",
            }
        end
    end

    (1..N).each do |i|
        config.vm.define "k8s-node-#{i}" do |node|
            node.vm.box = IMAGE_NAME
            node.vm.network "private_network", ip: "192.168.50.#{i + 10}"
            node.vm.hostname = "k8s-node-#{i}"
            node.vm.provision "ansible" do |ansible|
                ansible.compatibility_mode = "2.0"
                ansible.playbook = "kubernetes-setup/node-playbook.yml"
                ansible.extra_vars = {
                    node_ip: "192.168.50.#{i + 10}",
                }
            end
        end
    end

    config.vm.define "k8s-nfs" do |nfs|
        nfs.vm.box = IMAGE_NAME
        nfs.vm.provider "virtualbox" do |v|
            v.cpus = 1
            v.memory = 1024
        end
        nfs.vm.network "private_network", ip: "192.168.50.254"
        nfs.vm.hostname = "k8s-nfs"
        nfs.vm.provision "ansible" do |ansible|
            ansible.compatibility_mode = "2.0"
            ansible.playbook = "kubernetes-setup/nfs-playbook.yml"
            ansible.extra_vars = {
                node_ip: "192.168.50.254",
            }
        end
    end
end

