#!/bin/sh

# Hack to make the key 400
cat $SSH_PRIVATE_KEY > /root/skey
chmod 400 /root/skey

ssh -T -N -vvv -o StrictHostKeyChecking=no \
	-i /root/skey \
	-R 0.0.0.0:$FWD_PORT:ingress-nginx.ingress-nginx.svc.cluster.local:$FWD_PORT $SSH_USER@$SSH_SERVER




