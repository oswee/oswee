# Quay

## Setup

For the first run please comment out the Registry container as it should be created separately.
That also means, that in order for Quay Config container to communicate with Postgresql and Redis,
the Redis and PG ports should be open in the firewall, those ports should be exposed in the containers
and appropriate host addresses should be used in order to Config communicate with them.

TODO: Write 1st run instructions and consecvent run instructions.

- Stop the HAproxy to free up the `80` port
- Add the `<host-ip> registry.oswee.com` to the `/etc/hosts`
- Run `sudo podman play kube ./containers/quay/play.yaml`
- Make sure to execute

```bash
  sudo podman exec -it quay-postgres /bin/bash -c 'echo "CREATE EXTENSION IF NOT EXISTS pg_trgm" | psql -d quay -U quayuser'
```

- Run the config container

```bash
  sudo podman run --rm -it --name quay_config -p 80:8080 -p 443:8443 quay.io/projectquay/quay:latest config secret
```

- Follow the instructions at [Configuring Project Quay](https://docs.projectquay.io/deploy_quay.html#_configuring_project_quay)
- Because Quay, Redis and Postgresql are running inside of single POD use the `127.0.0.1` as their host adresses
- Kill the config container once config file is downloaded
- Export the environment variable `export QUAY=/home/dzintars/containers/github.com/dzintars/prime/volumes/quay/data`
- Place the config files at `tar -xvf ~/Downloads/quay-config.tar.gz -C $QUAY/config`
- Open the firewall port `sudo firewall-cmd --add-port=9981/tcp --zone=public --permanent` (no need to pen PG and Redis ports as those are not exposed)
- Reload the firewall `sudo firewall-cmd --reload`
- Run the registry container

```bash
  sudo podman run -d -p 9981:8080 -p 8443:8443 \
  --name=registry \
  -v $QUAY/config:/quay-registry/conf/stack:Z \
  -v $QUAY/storage:/datastorage:Z \
  quay.io/projectquay/quay:latest
```

- Access the registry by browser at `http://registry.oswee.com:9981`
- If willing, you can start the HAproxy and if backend is configured then access registry by [](https://registry.oswee.com)
- Probably you want to make new organization like `oswee` to hold your images.

## Things to enhance

- Create new PG base image with TRGM enabled
- Persistence
- Single pod of all components
- Probably shell script to automate all this setup
- Variables

## References

- [Floating Kwaaaay with Podman and systemd](https://www.redhat.com/en/blog/floating-kwaaaay-podman-and-systemd) @ 2019-03-08
- [Deploy Project Quay for proof-of-concept (non-production) purposes](https://docs.projectquay.io/deploy_quay.html)
