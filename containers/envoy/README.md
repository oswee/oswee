# Envoy

Be carefule about the version of Envoy you are running and the documentation version you are reading.

Build the image from the root of this repository

```bash
podman build -f ./containers/envoy/Containerfile -t oswee/envoy:latest .
```

Run container with the default config

```bash
podman run --rm -it -p 9902:9902 -p 10000:10000 --name=envoy oswee/envoy:latest
```

Run the container with config overrides

```bash
podman run --rm -it -p 9902:9902 -p 10000:10000 --name=envoy oswee/envoy:latest -c /etc/envoy/envoy.yaml --config-yaml
"$(cat containers/envoy/envoy-custom.yaml)"
```

## References

- https://www.envoyproxy.io/docs/envoy/latest/start/quick-start/run-envoy#run-envoy-with-the-demo-configuration
