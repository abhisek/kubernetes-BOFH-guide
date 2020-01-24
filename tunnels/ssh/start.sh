#!/bin/sh

# Hack to make the key 400
cat $SSH_PRIVATE_KEY > /root/skey
chmod 400 /root/skey

export AUTOSSH_GATETIME=0
export AUTOSSH_PIDFILE="/tmp/autossh.pid"
export AUTOSSH_DEBUG=1

autossh -M 0 -T -N \
	-o "ServerAliveInterval 10" \
	-o "ServerAliveCountMax 3" \
	-o "StrictHostKeyChecking no" \
	-i /root/skey \
	-R 0.0.0.0:$FWD_PORT:ingress-nginx.ingress-nginx.svc.cluster.local:$FWD_PORT $SSH_USER@$SSH_SERVER

