#!/bin/sh

# CURRENT_DIR=$(pwd)
#
# cd ~/code/github.com/dzintars/oswee/ansible/custom
#
# ansible-playbook -i environments/development playbooks/workstation.dev.yaml --tags istio.setup
#
# cd $CURRENT_DIR

istioctl install -y

# Install all Istio addons
kubectl apply -f /opt/istio/samples/addons

# Delete Zipkin to avoid any potential conflicts with Jaeger
kubectl delete -f /opt/istio/samples/addons/extras/zipkin.yaml

# Output EXTERNAL-IP of the Istio Gateway
kubectl get svc istio-ingressgateway -n istio-system

# EXTERNAL-IP should be used in `/etc/hosts` in order to access services by domains locally
#sed '$ a 192.168.100.210 kiali.oswee.local' /etc/hosts

# List all Istio services
#kubectl get svc -n istio-system
