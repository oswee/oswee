# Kiali

Use `kubectl get svc -n istio-system` to list running services and their ports.

For a simple check you can use `kubectl port-forward svc/kiali -n istio-system 20001:20001 &`
and to access Kiali via `http://localhost:20001`.
