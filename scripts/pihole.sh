#!/bin/sh

sudo systemctl stop systemd-resolved.service
sudo sysetmctl disable systemd-resolved.service

sudo podman play kube k8s/containers/pihole/pod.k8s.yaml

sudo firewall-cmd --permanent --direct --add-rule ipv4 nat OUTPUT 0 -p tcp -o lo --dport 53 -j REDIRECT --to-ports 53
sudo firewall-cmd --reload

