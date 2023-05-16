# Project Quay

This is for Quay TESTING ONLY!

## Rootless Deployment Setup

Add CNAME record of `registry.oswee.dev` in the CloudFlare DNS or use `/etc/hosts`.

Add front-end and back-end in the HAProxy.

Ensure LVM is configured and image storage volume is mounted. Use/create SystemD mount unit to control that.

```toml
# Mount unit file /etc/systemd/system/mnt-data-registry.mount

[Unit]
Description=Quay Registry Store
Before=local-fs.target

[Mount]
What=/dev/vgdata/lvregistry
Where=/mnt/data/registry
Type=ext4

[Install]
WantedBy=local-fs.target
```

```bash
sudo systemctl enable mnt-data-registry.mount
sudo systemctl start mnt-data-registry.mount
# Take ownership if not already taken
sudo chown -R dzintars:dzintars /mnt/data/registry
# Create some directory structure to hold images
mkdir -p /mnt/data/registry/quay/storage
```

Run the Quay (this) deployment:

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

- Username: `quayconfig`
- Password `configsecret`

Fill the details:

- Server Hostname: `registry.oswee.dev`
- TLS: `My own load balancer handles TLS` # this is important to be able to `podman login`
- Database Type: `Postgres`
- Database Server: `localhost:5432`
- Username: `quayuser`
- Password: `quaypass`
- Database Name: `quay`
- Redis Hostname: `localhost`
- Redis port: `6379`
- Redis password: `strongpassword`
- Super Users: `dzintars`

Validate and download the config bundle into `~/Downloads/`

Extract downloaded config bundle into Quay config container volume:

```bash
# Extract downloaded bundle
mkdir ~/Downloads/quay && tar -xvf ~/Downloads/quay-config.tar.gz -C ~/Downloads/quay
# Copy into container volume
podman cp ~/Downloads/quay/. registry-pod-quay:/quay-registry/conf/stack/
# Cleanup
rm -rf ~/Downloads/{quay-config.tar.gz,quay}
```

Remove config container from the Pod

```bash
podman container rm -f registry-pod-quay
```

Replace Quay config container with the registry container within the same `registry-pod`:

```bash
podman run --pod registry-pod -d  \
  --name=registry-pod-quay \
  -v registry-pvc-quay-config:/quay-registry/conf/stack:Z \
  -v /mnt/data/registry/quay/storage:/datastorage:z \
  quay.io/projectquay/quay:3.8.6
```

TODO: How to replace/execute this manual step within deployment manifest (I can replace `config secret` args with `registry`)?

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
chown -R 1001:1001 /datastorage
```

TODO: I don't like this workaround.

## Things to enhance

- Create new PG base image with the database and TRGM enabled
- Persistence and backups
- Probably shell script to automate all this setup
- Variables
- Keycloak OICD authentication

### TLS

These instructions are **NOT REQUIRED** if using TLS termination!

NOTE: I was trying this out to try solve `podman login` failing issue.

If you want to enable TLS copy your existing `cert1.pem` and `privkey1.pem` to `$QUAY/config` directory (not `extra_ca_certs`).
Rename them to `ssl.cert` and `ssl.key` respectively.
Make sure you have right file permissions.

```bash
QUAY_CERTS=/tmp/quay-certs
# Clone certificates
sudo cp /etc/letsencrypt/archive/oswee.dev/{cert1.pem,privkey1.pem} $QUAY_CERTS
# Change ownership
sudo chown -R dzintars:dzintars $QUAY_CERTS/{cert1.pem,privkey1.pem}
# Rename the files accordingly to the Quay documentation
mv $QUAY_CERTS/cert1.pem $QUAY_CERTS/config/ssl.cert && mv $QUAY_CERTS/privkey1.pem $QUAY_CERTS/ssl.key
# Change permissions (Not sure why it is required. Need some closer look into this.)
chmod -R 0644 $QUAY_CERTS/{ssl.cert,ssl.key}
# Copy certs into container volume
podman cp $QUAY_CERTS/. registry-pod-quay:/quay-registry/conf/stack/
# Cleanup
rm -rf $QUAY_CERTS
```

Turns out this is not the proper solution for the failing `podman login`.
Instead, enable TLS termination at the configurator stage. I updated instructions above.
Also see the `EXTERNAL_TLS_TERMINATION: true` config settings.

## Cleanup

WARNING! This will wipe out everything!
Don't remove volumes if you want to keep your data.

```bash
podman pod rm -f registry-pod
podman volume rm registry-pvc-quay-config registry-pvc-postgres registry-pvc-redis
rm -rf /mnt/data/registry/quay/storage
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