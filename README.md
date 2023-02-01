# [WIP] Oswee

This is sandbox monorepository to test Bazel in action to build "microservices" oriented web application for transportation domain.

[![GitHub@dzintars](https://img.shields.io/github/followers/dzintars?label=follow&style=social)](https://github.com/dzintars)

[![Bazel](https://img.shields.io/badge/-Bazel-419B45?style=flat&logo=data:image/svg%2bxml;base64,PHN2ZyB3aWR0aD0iNDQ4IiBoZWlnaHQ9IjQ0OCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cGF0aCBkPSJNLjcwNyAxMTJMMTEyIC43MDcgMjIzLjI5MyAxMTIgMTEyIDIyMy4yOTMuNzA3IDExMnpNMTExLjUgMzM0Ljc5M2wtMTExLTExMVYxMTMuMjA3bDExMSAxMTF2MTEwLjU4NnpNMjI0LjcwNyAxMTJMMzM2IC43MDcgNDQ3LjI5MyAxMTIgMzM2IDIyMy4yOTMgMjI0LjcwNyAxMTJ6TTMzNi41IDIyNC4yMDdsMTExLTExMXYxMTAuNTg2bC0xMTEgMTExVjIyNC4yMDd6TTExMi43MDcgMjI0TDIyNCAxMTIuNzA3IDMzNS4yOTMgMjI0IDIyNCAzMzUuMjkzIDExMi43MDcgMjI0ek0xMTIuNSAyMjUuMjA3bDExMSAxMTF2MTEwLjU4NmwtMTExLTExMVYyMjUuMjA3ek0yMjQuNSA0NDYuNzkzVjMzNi4yMDdsMTExLTExMXYxMTAuNTg2bC0xMTEgMTExeiIgZmlsbD0iI2ZmZiIgc3Ryb2tlPSIjNDE5QjQ1Ii8%2BPC9zdmc%2B)](https://bazel.build/)
[![Kubernetes](https://img.shields.io/badge/-Kubernetes-316CE6?style=flat-square&logo=kubernetes&logoColor=white)](https://kubernetes.io)
[![Golang](https://img.shields.io/badge/-Golang-blue?style=flat-square&logo=go&logoColor=white)](https://golang.org/)
[![Typescript](https://img.shields.io/badge/-Typescript-blue?style=flat-square&logo=typescript&logoColor=white)](https://www.typescriptlang.org/)

## Project status

Until this message is removed, the status is WIP.

UPDATE: 2022 JUN:
Did some Neovim configuration.
Mostly looking into changes at Bazel ecosystem.
Planning to finally set Bazel up for all required languages.
Constantly thinking about cleanup in all areas.
Repository structure still is under the question. Separation by language could have some downsides. I collected some resources in my personal notes, how people handle this.
I am specifically talking about repository structure and not the single "sub-project" structure.
Also thinking to ditch the SASS. Taking into account how modern CSS evolves I think there is no more point to use SASS. If you want imports, you can use PostCSS.
Bazel setup seems cluttered. There are many competing rules and it is not clear which is recommended and which is not and its time consuming to test every of them.
Bazel modules promises to solve that, but they still are too fresh and I am not sure is it worth to invest time into looking into `bzlmod`
Also thinking to fully migrate my workshop (IDE) setup to remote server with only reasoning to test remote workflow.

UPDATE: 2022 APR:
Mostly busy with my house renovation so its less time to code.
Majority of Ansible roles are migrated and requires refactor and cleanup.
Plan to write automation for Dev/semi-Prod environments. Meanwhile also playing with Golang Hexagonal Architecture.

UPDATE 2022 FEB:
Still moving Ansible Collections and Terraform code into this repository.

UPDATE 2022 JAN:
Looking into merging infrastructure code into this repository.

UPDATE 2021 AUG:
Currently i am discovering integration with Kubernetes. Ultimate goal
is to let Bazel manage all image production and container provisioning. For
local development it seems that i will utilize Minikube. For image registry -
Project Quay. Secrets will be managed by Hashicorp Vault. While all these pieces
are tested to work in some combinations, i am still failing to get it nicely done
for entire project. But i see how it can be done and i am slowly moving there.

## Stack

- **Bazel** : Whole repository is managed with Bazel
- **Go** : Back-end services will be written in Go
- **TypeScript** : Front-end apps will be written in TypeScript
- **Lit** : WebComponents library (alternative of React, Angular, Vue)
- **Redux** : State management
- **Redux Dynamic Modules** : To avoid cyclic dependencies and enable code splitting
- **Protobuf** : Protobufs are used to set the API contracts
- **gRPC** : gRPC used for the inter-service communication
- **Yarn** : Just a package manager
- **Copybara** : To copy/migrate repositories or parts of that
- **WebSockets** : Primary communication protocol to enable true real-time user experience (REST currently is not
  considered as an option)
- **Kafka** : Message broker
- **SASS** (SMACSS) : If style is not in TS, then SASS is used.

## General TODO

- Cleanup the repository
- Script all the manual bits and pieces
- Unified package API (The structure of the package)
- Test on fresh Linux dev workstation
- Implement Hygen
- Implement StoryBook
- Container auto-deployments
- Setup Jenkins integration to run "prod/dev" versions from the `main/dev` repo
- Potentially replace WebPack Dev Server with the `ts_project`
- Swagger rollout for the REST part
- Swagger alternative for the WebSocket API (UPD: HTTP/2 vs WebSocket)
- Monitoring
- Documentation
- T E S T S (Should place higher in the list, but... let's be realistic :) )

## Prerequisites

These tools should be installed locally in order to execute

Critical requirements:

- Install latest NodeJS on the system
- Install Yarn globally (Can be done via Ansible playbook. NodeJS will be installed automatically as dependency)
- Make sure you have NO ANY Bazel related binaries installed on the system (there are exceptions).
- Install all NPM modules

Recommended requirements:

- TLS certificates should be valid and configured in the DNS/Proxy
- ~~Github Personal Access `GITHUB_NPM_PAT` env. variable/token should be added to the `~/.zshenv` to be able to read and write private/public NPM packages~~
- Quay image registry for `rules_k8s` to publish image artifacts (can be used Minikube's built-in registry). I made a gist https://gist.github.com/dzintars/c93beed43f4eb1610af8307cb235eba3
- Minikube for local development
- /etc/hosts DNS entries

### Minikube

- Install Minikube
- Enable Metallb
- Install Istio
- Install Istio extensions `kubectl apply -f ~/istio-1.11.1/samples/addons`
- Remove the Zipkin because Jaeger will be used `kubectl delete -f ~/istio-1.11.1/samples/addons/extras/zipkin.yaml`

### Other relevant things

I have HAProxy configured at the edge which does the A+ perimeter security with valid TLS certificates.
I have custom CloudFlare DNS setup

## Usage

UPDATE: These instructions most likely is broken ATM

- Clone this repository
- Configure workstation base
- Configure workstation for development
- Deploy Base infrastructure (MinIO, Vault, Jenkins)
- ?
- Check the `package.json#scripts` for the available commands.
- Run `yarn install` to install all required NPM packages
- Update Go dependencies `yarn run gazelle:update-repos`
- Generate BUILD rules for Go: `yarn run gazelle`
- Build everything: `yarn bazel build '...'`
- Build single target `yarn bazel build //go/cmd/http-server:http-server`
- Run some binary with flags: `yarn bazel run //go/cmd/gateway:gateway -- -a :9090`
- Run Bazel in watch mode: `yarn ibazel run //platform/web:devserver`

### Potential issues

- If the `yarn bazel run......` stuck, check the Image Registry is is fully functional

## DONT's

- You [should not](https://github.com/bazelbuild/rules_go#can-i-still-use-the-go-command) run `go` tool from this repository.
  All Go and Protobuf dependencies should be handled by Gazelle.
