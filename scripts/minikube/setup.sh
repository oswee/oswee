#!/bin/sh
# Run this script (without sudo) from the root of this repository `./scripts/minikube.sh`

MINIKUBE_PROFILE="minikube"

# TODO: Check does the default net exists and make this conditional
# In order to run this without sudo, user should be part of libvirt group
# virsh net-define --file ./scripts/libvirt-default-net.xml
# virsh net-start default
# virsh net-autostart --network default

# virsh pool-define --file ./scripts/libvirt-pool.xml
# virsh pool-start virt

source ./scripts/minikube/libvirt-default-net.sh

# Set the default config values `minikube config --help`
# This will update ~/.minikube/config/config.json file
minikube config set kubernetes-version v1.26.3
minikube config set profile $MINIKUBE_PROFILE
minikube config set driver kvm2
minikube config set network minikube
# Istio and Kiali requires extra memory and CPU
minikube config set memory 16384
minikube config set cpus 6

# Set the profile
minikube profile $MINIKUBE_PROFILE
# Start Minikube VM
minikube start

# TODO: Minikube can't locate default network.
# Simple solution is to open `virt-manager` and create network named `default` for any device.
# or to run //scripts/libvirt-default-net.sh

# Mount drive
minikube -p $MINIKUBE_PROFILE mount /mnt/minikube:/data/minio

echo "Enabling metallb addon..."

# Enable Metallb in order to run Istio
minikube -p $MINIKUBE_PROFILE addons enable metallb

# Apply Metallb config map (could be done with vanilla `kubectl`)
# yarn bazel run //k8s/manifests/devcluster:metallb_config_map.apply
kubectl apply -f ./k8s/manifests/istio/metallb-config-map.k8s.yaml

# Enable Metrics API
minikube -p $MINIKUBE_PROFILE addons enable metrics-server

kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
# Temporary added `--kubelet-insecure-tls` flag
kubectl apply -f ./k8s/manifests/devcluster/metrics-server.k8s.yaml

# Run the Minikube dashboard
# minikube -p $MINIKUBE_PROFILE dashboard
