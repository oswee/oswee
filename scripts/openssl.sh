#!/bin/bash

# Reference: https://istio.io/latest/docs/tasks/traffic-management/ingress/secure-ingress/

# Create a root certificate and private key to sign the certificates for your services
openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -subj '/O=Oswee/CN=oswee.local' -keyout oswee.local.key -out oswee.local.crt

# Create a certificate and a private key for httpbin.oswee.local
openssl req -out httpbin.oswee.local.csr -newkey rsa:2048 -nodes -keyout httpbin.oswee.local.key -subj "/CN=httpbin.oswee.local/O=httpbin organization"
openssl x509 -req -days 365 -CA oswee.local.crt -CAkey oswee.local.key -set_serial 0 -in httpbin.oswee.local.csr -out httpbin.oswee.local.crt

kubectl create -n istio-system secret tls httpbin-credential --key=httpbin.oswee.local.key --cert=httpbin.oswee.local.crt
