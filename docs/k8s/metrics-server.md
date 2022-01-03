# Metrics API

Install the Metrics Server

```bash
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
```

List all kube-system pods

```bash
kubectl -n kube-system get pods
```

See the logs of metrics server pod

```bash
kubectl -n kube-system logs -f metrics-server-7b9c4d7fd9-hp62w
```
