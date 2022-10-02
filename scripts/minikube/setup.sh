#!/bin/sh
# Run this script (without sudo) from the root of this repository `./scripts/minikube.sh`

MINIKUBE_PROFILE="minikube-dev"

# TODO: Check does the default net exists and make this conditional
# In order to run this without sudo, user should be part of libvirt group
# virsh net-define --file ./scripts/libvirt-default-net.xml
# virsh net-start default
# virsh net-autostart --network default

virsh pool-define --file ./scripts/libvirt-pool.xml
virsh pool-start virt

source ./scripts/libvirt-default-net.sh

# Set the default config values `minikube config --help`
minikube config set driver kvm2
minikube config set kubernetes-version v1.24.3

# Set the profile
minikube profile $MINIKUBE_PROFILE
# Istio and Kiali requires extra memory and CPU
minikube -p $MINIKUBE_PROFILE start --memory=16384 --cpus=6 --network=default

# TODO: Minikube can't locate default network. Simpe solution is to open `virt-manager` and create network named `default` for any device.
# or to run //scripts/libvirt-default-net.sh

# Mount drive
minikube -p $MINIKUBE_PROFILE mount /data/minio:/data/minio

echo "Enabling metallb addon..."

# Enable Metallb in order to run Istio
minikube -p $MINIKUBE_PROFILE addons enable metallb

# Apply Metallb cofing map (could be done with vanilla `kubectl`)
# yarn bazel run //k8s/manifests/devcluster:metallb_config_map.apply
kubectl apply -f ./k8s/manifests/istio/metallb-config-map.k8s.yaml

# Enable Metrics API
minikube -p $MINIKUBE_PROFILE addons enable metrics-server

kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
# Temporary added `--kubelet-insecure-tls` flag
kubectl apply -f ./k8s/manifests/devcluster/metrics-server.k8s.yaml

# Run the Minikube dashboard
# minikube -p $MINIKUBE_PROFILE dashboard
