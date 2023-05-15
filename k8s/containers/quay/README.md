# Quay

This is for TESTING ONLY!

## Rootless Deployment Setup

Add CNAME record of `registry.oswee.dev` in the CloudFlare DNS or use `/etc/hosts`.

Add front-end and back-end in the HAProxy.

Ensure LVM is configured and image storage volume is mounted. Use/create SystemD mount unit to control that.

Run the deployment:

```bash
podman kube play deployment.yaml
```

Check does the all containers run successfully:

```bash
podman ps -a
podman logs registry-pod-quay  # or any other container within `registry-pod`
```

Enable TRGM for `quay` database:

```bash
podman exec -it registry-pod-postgres /bin/bash -c 'echo "CREATE EXTENSION IF NOT EXISTS pg_trgm" | psql -d quay -U quayuser'
```

Open [registry configurator](https://registry.oswee.dev)

Use default credentials:

Username: `quayconfig`
Password `secret`

Fill the details:

Server Hostname: `registry.oswee.dev`
TLS: `My own load balancer handles TLS` # this is important to be able to `podman login`
Database Type: `Postgres`
Database Server: `localhost:5432`
Username: `quayuser`
Password: `quaypass`
Database Name: `quay`
Redis Hostname: `localhost`
Redis port: `6379`
Redis password: `strongpassword`
Super Users: `dzintars`

Validate and download the config bundle.

Extract downloaded config bundle into Quay config volume:

```bash
QUAY=/home/dzintars/.local/share/containers/storage/volumes/registry-pvc-quay-config/_data
mkdir $QUAY/config
tar -xvf ~/Downloads/quay-config.tar.gz -C $QUAY/config
rm ~/Downloads/quay-config.tar.gz
```

Remove config container from the Pod

```bash
podman container rm -f registry-pod-quay
```

Replace Quay config container with the registry container within the same `registry-pod`:

TODO: How to replace/execute this manual step within deployment manifest (I can replace `config secret` args with `registry`)?

```bash
podman run --pod registry-pod -d  \
  --name=registry-pod-quay \
  -v $QUAY/config:/quay-registry/conf/stack:Z \
  -v /mnt/data/registry/quay/storage:/datastorage:z \
  quay.io/projectquay/quay:3.8.6
```

Wait a bit until the registry will bootstrap itself.

Use `podman logs registry-pod-quay` to see the logs of containers.

See the running [registry](https://registry.oswee.dev) container.

Create the first user with the same user name you added to Super Users.

Create Application Token and use it to `podman login`.

WORKAROUND: Fix the issue with `podman push` failing [issue #379](https://github.com/oswee/oswee/issues/379)

```bash
podman exec -u 0 -it registry-pod-quay /bin/bash
```

Change storage ownership (don't use `unshare`).

```bash
chown -R 1001:root /datastorage
```

## Things to enhance

- Create new PG base image with the database and TRGM enabled
- Persistence and backups
- Probably shell script to automate all this setup
- Variables
- Keycloak OICD authentication

### TLS

NOT REQUIRED if using TLS termination!

NOTE: Doing this because `podman login` is failing.

If you want to enable TLS copy your existing `cert1.pem` and `privkey1.pem` to `$QUAY/config` directory (not `extra_ca_certs`).
Rename them to `ssl.cert` and `ssl.key` respectively.
Make sure you have right file permissions.

```bash
sudo cp /etc/letsencrypt/archive/oswee.dev/{cert1.pem,privkey1.pem} $QUAY/config/
sudo chown -R dzintars:dzintars $QUAY/config/{cert1.pem,privkey1.pem}
mv $QUAY/config/cert1.pem $QUAY/config/ssl.cert
mv $QUAY/config/privkey1.pem $QUAY/config/ssl.key
chmod -R 0644 $QUAY/config/{ssl.cert,ssl.key}
```

Turns out this is not the proper solution for the failing `podman login`.
Instead, enable TLS termination at the configurator stage. I updated instructions above.
Also see the `EXTERNAL_TLS_TERMINATION: true` config setting.

## Cleanup

```bash
podman pod rm -f registry-pod
podman volume rm registry-pvc-quay-config registry-pvc-postgres registry-pvc-redis
```

## Notes

- You need to `podman login registry.redhat.io` in order to download the images
- Most likely config should be re-generated for each new setup, because Quay uses some unique values
- TRGM should be enabled for the `quay` database
- I had some issues by using `:latest` Quay image
- `docker.io/redis` requires some other configuration.

## References

- [Floating Kwaaaay with Podman and systemd](https://www.redhat.com/en/blog/floating-kwaaaay-podman-and-systemd) @ 2019-03-08
- [Deploy Project Quay for proof-of-concept (non-production) purposes](https://docs.projectquay.io/deploy_quay.html)