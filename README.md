# Kubernetes with Vagrant and Ansible
We will setup a Kubernetes cluster locally using Vagrant and Ansible. We will expose the cluster to the Internet by hosting a Nginx reverse proxy on any public cloud and reverse proxy all connections to our cluster's Nginx Ingress Controller over a Wireguard secure tunnel.

## Requirements

* Ubuntu (Host OS)
* Virtualbox
* Vagrant
* Ansible

## System Setup

### Install Virtualbox

1. [Download and Install Virtualbox](https://www.virtualbox.org/wiki/Downloads)

### Install Vagrant

> Choose as appropriate

1. [Intro to Vagrant](https://www.vagrantup.com/intro/index.html)
2. [Installing Vagrant](https://www.vagrantup.com/docs/installation/)
3. [Direct Download Vagrant Binaries](https://www.vagrantup.com/downloads.html)

### Install Ansible

```bash
sudo apt update
sudo apt install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible
```

* [Ansible Installation Guide](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

## Configuration

1. Number of worker nodes is defined in `Vagrantfile` and can also be set using environment variable `KUBERNETES_NODE_COUNT`
2. Review and edit playbooks in `kubernetes-setup` directory

Following assumptions are made:

* Vagrant Host only network in range: 192.168.50.0/16
* Pod network: 172.16.0.0/16
* Service network: 10.96.0.0/16 (default)

Update `playbooks` if overlapping with host network.

## Build Infrastructure

```bash
vagrant up
```

> Older versions of `vagrant` has a bug in `ansible` integration [Github #10281](https://github.com/hashicorp/vagrant/issues/10281)

In case of failure, you can run re-run provisioning on each node such as:

```bash
vagrant up k8s-master --provision
vagrant up k8s-node-1 --provision
vagrant up k8s-node-2 --provision
vagrant up k8s-node-3 --provision
```

## Testing Cluster

[ ] Master access
[ ] Component status (`kubectl get cs`)
[ ] Pod to Pod networking
[ ] Pod to Service networking
[ ] Pod to external networking

## References

* https://kubernetes.io/blog/2019/03/15/kubernetes-setup-using-ansible-and-vagrant/
* https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html