# Quay

Setup:

- Stop the HAproxy to free up the `80` port
- Add the `<host-ip> registry.oswee.com` to the `/etc/hosts`
- Run `sudo podman play kube ./containers/quay/play.yaml`
- Run the config container

```bash
  sudo podman run --rm -it --name quay_config -p 80:8080 -p 443:8443 quay.io/projectquay/quay:latest config secret
```

- Follow the instructions at [Configuring Project Quay](https://docs.projectquay.io/deploy_quay.html#_configuring_project_quay)
- Kill the config container once config file is downloaded
- Export the environment variable `export QUAY=/home/dzintars/containers/github.com/dzintars/prime/volumes/quay/data`
- Place the config files at `tar -xvf ~/Downloads/quay-config.tar.gz -C $QUAY/config`
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

Things to enhance:

- Persistence
- Single pod of all components
- Probably shell script to automate all this setup
- Variables
