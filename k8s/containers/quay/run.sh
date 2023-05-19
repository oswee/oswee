#!/bin/bash

# Cloudflare
# HAProxy

sudo mkdir -p /mnt/registry
sudo chown -R dzintars:dzintars /mnt/registry

sudo lvscan
sudo mount /dev/vgdata/lvregistry /mnt/registry

mkdir -p /mnt/registry/quay/storage

podman network create registry

podman kube play pvc.yaml

QUAY=/home/dzintars/.local/share/containers/storage/volumes/registry-pvc-quay-config/_data

sudo tar -xvf ~/Downloads/quay-config.tar.gz -C $QUAY

podman kube play deployment.yaml

podman exec -it registry-pod-postgres /bin/bash -c 'echo "CREATE EXTENSION IF NOT EXISTS pg_trgm" | psql -d quay -U quayuser'

podman pod restart registry-pod

# mkdir -p /home/dzintars/containers/github.com/dzintars/quay/volumes/quay/data/config
# mkdir -p /home/dzintars/containers/github.com/dzintars/quay/volumes/quay/data/storage

