#!/bin/sh

# Reference: https://istio.io/latest/docs/tasks/traffic-management/ingress/secure-ingress/

DOMAIN=oswee.local

CURRENT_DIR=$(pwd)

rm -rf /tmp/openssl

mkdir /tmp/openssl

cd /tmp/openssl

# Create a root certificate and private key to sign the certificates for your services
openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -subj '/O=Oswee/CN=$DOMAIN' -keyout $DOMAIN.key -out $DOMAIN.crt

# Create a certificate and a private key for $SERVICE.$DOMAIN
# openssl req -out grafana.$DOMAIN.csr -newkey rsa:2048 -nodes -keyout grafana.$DOMAIN.key -subj "/CN=grafana.$DOMAIN/O=Grafana organization"
# openssl x509 -req -days 365 -CA $DOMAIN.crt -CAkey $DOMAIN.key -set_serial 0 -in grafana.$DOMAIN.csr -out grafana.$DOMAIN.crt
#
# openssl req -out kiali.oswee.local.csr -newkey rsa:2048 -nodes -keyout kiali.oswee.local.key -subj "/CN=kiali.oswee.local/O=Kiali organization"
# openssl x509 -req -days 365 -CA oswee.local.crt -CAkey oswee.local.key -set_serial 0 -in kiali.oswee.local.csr -out kiali.oswee.local.crt
#
# openssl req -out prometheus.$DOMAIN.csr -newkey rsa:2048 -nodes -keyout prometheus.$DOMAIN.key -subj "/CN=prometheus.$DOMAIN/O=prometheus organization"
# openssl x509 -req -days 365 -CA $DOMAIN.crt -CAkey $DOMAIN.key -set_serial 0 -in prometheus.$DOMAIN.csr -out prometheus.$DOMAIN.crt
#
# openssl req -out jaeger.$DOMAIN.csr -newkey rsa:2048 -nodes -keyout jaeger.$DOMAIN.key -subj "/CN=jaeger.$DOMAIN/O=jaeger organization"
# openssl x509 -req -days 365 -CA $DOMAIN.crt -CAkey $DOMAIN.key -set_serial 0 -in jaeger.$DOMAIN.csr -out jaeger.$DOMAIN.crt

openssl req -out minio.$DOMAIN.csr -newkey rsa:2048 -nodes -keyout minio.$DOMAIN.key -subj "/CN=minio.$DOMAIN/O=minio organization"
openssl x509 -req -days 365 -CA $DOMAIN.crt -CAkey $DOMAIN.key -set_serial 0 -in minio.$DOMAIN.csr -out minio.$DOMAIN.crt

# kubectl create -n istio-system secret tls grafana-cert --key=grafana.$DOMAIN.key --cert=grafana.$DOMAIN.crt
# kubectl create -n istio-system secret tls kiali-cert --key=kiali.oswee.local.key --cert=kiali.oswee.local.crt
# kubectl create -n istio-system secret tls prometheus-cert --key=prometheus.$DOMAIN.key --cert=prometheus.$DOMAIN.crt
# kubectl create -n istio-system secret tls jaeger-cert --key=jaeger.$DOMAIN.key --cert=jaeger.$DOMAIN.crt
kubectl create -n istio-system secret tls minio-cert --key=minio.$DOMAIN.key --cert=minio.$DOMAIN.crt

cd $CURRENT_DIR
