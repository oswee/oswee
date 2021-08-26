# Simple HTTP server for workflow testing purposes

Requirements

- Libvirt network named "default"
- Minikube `minikube start --memory=16384 --cpus=6 --network=default`
- Install Metallb addon `minikube addons enable metallb`
- Quay image registry `sudo podman play kube ./containers/quay/play.yaml`
- Istio. You can instal either "official" way `istioctl install` either `minikube addons enable istio istio-provisioner`
- Make sure no any other Ingress provider is installed
- Get the External IP of istioingress `kubectl get svc -n istio-system istio-ingressgateway`
- Add that addrress to the `sudo vim /etc/hosts` like `192.168.100.210 server.apps.ocp.oswee.com`
- Create the namespace `yarn bazel run //k8s:all.apply`
- ~~Obtain TLS Certificate. I am using the real one, so it is not listed in the source files~~
- ~~Manually create TLS Secret `kubectl create secret tls my-tls-secret --namespace prime --key ~/.tls/oswee.com/privkey.pem --cert ~/.tls/oswee.com/cert.pem`~~
- Run the deployment `yarn bazel run //oswee/http-server:all.apply`
- Forward the Kiali port `kubectl port-forward svc/kiali -n istio-system 20001:20001 &`
- Run the Kubernetes dashboard `minikube dashboard`
- Dashboard should be opened automatically in the default browser
- Access Kiali via `localhost:20001`

Things to enhance (unordered):

- Persistent Dashboard service
- Kiali user ConfiMap
- Container image layering
- HTTP Servers helthcheck endpoints. Liveness, Readiness and Startup Probes.
- Basic routing and proper error handling
- TLS
- Injecting static content from frontend package
- Tidy up file structure
- Better target naming
- Get the secrets from external Vault service
- Logging, tracing
- Tests

Things to keep in mind:

- `minikube delete` will delete default libvirt network and it should be created manually before `minikube start`
- `istio-injection=enabled` label should be added to the namespace in order for Envoy sidecard to be injected into application pods. (done in the namespace manifest)
- Metallb should be installed and configured in order for `istio-ingressgateway` to obtain its External IP. Othervise External IP will have infinite state of `<pending>`.
- If Quay fails to run, one of the reasons could be that it tries to use old config where secrets maps to wrong UUIDs. Start over by creating fresh Config.
- If you have Edge Proxy like HAproxy, TLS termination gets tricky. I don't think that you should serve unencripted traffic inside of perimeter.
  But i am still discovering this aspect. I know Istio can handle TLS termination as well. Also i can run `listenAndServeTLS()` and provide the certs inside the binary.
  Not sure which is the right way. I think one of the goals of Envoy was to simplify TLS distribution so that developers do not need to inject certs int their code.
  Not sure. Could be totally wrong. Also there are thing like Spiffe, which tries to automate application and k8s node attestation. Term - Zerro Trust. Basically this
  requires a lot of research.
  requires a lot of research.requires a lot of research.
