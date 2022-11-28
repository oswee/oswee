#!/bin/nu

sudo rm -r /home/dzintars/containers/github.com/dzintars/oswee/sonarqube

mkdir /home/dzintars/containers/github.com/dzintars/oswee/sonarqube/volumes/postgres
mkdir /home/dzintars/containers/github.com/dzintars/oswee/sonarqube/volumes/postgres/data
mkdir /home/dzintars/containers/github.com/dzintars/oswee/sonarqube/volumes/sonarqube/data
mkdir /home/dzintars/containers/github.com/dzintars/oswee/sonarqube/volumes/sonarqube/logs
mkdir /home/dzintars/containers/github.com/dzintars/oswee/sonarqube/volumes/sonarqube/extensions

# sudo firewall-cmd --add-port 9100/tcp --permanent
# sudo firewall-cmd --reload

# Increase memory for ElasticSearch
# sudo sysctl -w vm.max_map_count=262144
# sudo sysctl --system

# podman play kube pod.yaml
# podman logs -f sonarqube-server
