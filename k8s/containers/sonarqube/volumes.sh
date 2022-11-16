#!/bin/bash

mkdir -p /home/dzintars/containers/github.com/dzintars/oswee/sonarqube/volumes/postgres
mkdir -p /home/dzintars/containers/github.com/dzintars/oswee/sonarqube/volumes/postgres/data
mkdir -p /home/dzintars/containers/github.com/dzintars/oswee/sonarqube/volumes/sonarqube/data
mkdir -p /home/dzintars/containers/github.com/dzintars/oswee/sonarqube/volumes/sonarqube/logs
mkdir -p /home/dzintars/containers/github.com/dzintars/oswee/sonarqube/volumes/sonarqube/extensions

# sudo firewall-cmd --add-port 9100/tcp --permanent
# sudo firewall-cmd --reload

podman play kube pod.yaml
podman logs -f sonarqube-server
