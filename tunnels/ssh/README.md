# SSH Reverse Port-Forward

SSH reverse port-forward can be used to expose `ingress-nginx` service to the Internet using a cloud hosted VPS.

For this to work, remote SSH server must allow `GatewayPorts`. To do this:

* Edit `/etc/ssh/sshd_conf`
* Set `GatewayPorts=yes`


## Setup

Generate SSH key pair

```
ssh-keygen
```

Create namespace

```
kubectl create namespace ssh-ingress-tunnel
```

Create secret with private key

```
kubectl create secret generic \
  -n ssh-ingress-tunnel ssh-private-key \
  --from-file=ssh_private_key=./id_rsa
```

Create config map for SSH tunnel

```
kubectl create configmap -n ssh-ingress-tunnel ssh-ingress-config \
  --from-literal=SSH_USERNAME=root \
  --from-literal=SSH_SERVER=199.247.18.228
```