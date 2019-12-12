# Kubernetes with Vagrant and Ansible

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

```
sudo apt update
sudo apt install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible
```

* [Ansible Installation Guide](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

## Configuration

1. Number of worker nodes is defined in `Vagrantfile` and can also be set using environment variable `KUBERNETES_NODE_COUNT`
2. Review and edit playbooks in `kubernetes-setup` directory

## Build Infrastructure

```
vagrant up
```

> Older versions of `vagrant` has a bug in `ansible` integration [Github #10281](https://github.com/hashicorp/vagrant/issues/10281)

## References

* https://kubernetes.io/blog/2019/03/15/kubernetes-setup-using-ansible-and-vagrant/
* https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html