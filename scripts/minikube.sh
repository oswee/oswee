#!/bin/bash
# Run this script (without sudo) from the root of this repository `./scripts/minikube.sh`

# TODO: Check does the default net exists and make this conditional
# In order to run this without sudo, user should be part of libvirt group
virsh net-define --file ./scripts/libvirt-default-net.xml
virsh net-start default
virsh net-autostart --network default

# Set the default driver (just in case needed later)
minikube config set driver kvm2
# Set the profile
minikube profile dev
# Istio and Kiali requires more memory and CPU
minikube start --memory=16384 --cpus=6 --network=default -p dev

# Enable Metallb in order to run Istio
minikube addons enable metallb

# Apply Metallb cofing map (could be done with vanilla `kubectl`)
yarn bazel run //manifests/devcluster:metallb_config_map.apply
#kubectl apply -f ./manifests/devcluster/metallb-config-map.yaml

# Install Istio. `istioctl` can be installed via `oswee.ansible.istio`.
istioctl install -y

# Install Istio addons
kubectl apply -f /opt/istio/samples/addons

# Delete Zipkin to avoid any potential conflicts with Jaeger
kubectl delete -f /opt/istio/samples/addons/extras/zipkin.yaml

# Output EXTERNAL-IP of the Istio Gateway
kubectl get svc istio-ingressgateway -n istio-system

# EXTERNAL-IP should be used in `/etc/hosts` in order to access services by domains locally
#sed '$ a 192.168.100.210 kiali.oswee.local' /etc/hosts

# List all Istio services
#kubectl get svc -n istio-system

# Enable Metrics API
#minikube addons enable metrics-server

kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
# Temporary added `--kubelet-insecure-tls` flag
kubectl apply -f ./manifests/devcluster/metrics-server.yaml
