# Quay

https://gist.github.com/dzintars/c93beed43f4eb1610af8307cb235eba3

Use @latest tag.

See this issue https://github.com/oswee/prime/issues/98 about some setup caveats.

- Run the pod.yaml with Postgres and Redis
- Install Postgres pg_trgm module
- Add the registry.oswee.com to the /etc/hosts workstation IP
- Stop the HAproxy to free up the 80 and 443 ports
- Run the Quay config image
- Validate and download the config. Include Super user
- Place the config in `containers/...` directory (should be regenerated for each new setup)
- Destroy the Quay config container
- Run the Quay registry with `sudo podman run`
- Podman login
- Make sure ~/.docker/config.json contains right auth key
- Check the GitHub issues of Prime repository
- Create the Secret in minikube
- Run the `bazel run //:dev.apply`
- Delete the deployment with `bazel run //:dev.delete
