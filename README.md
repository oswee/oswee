# Prime

This is sandbox monorepository to test Bazel in action

[![GitHub @dzintars](https://img.shields.io/github/followers/dzintars?label=follow&style=social)](https://github.com/dzintars)

[![Golang](https://img.shields.io/badge/-Golang-blue?style=flat-square&logo=go&logoColor=white)](https://golang.org/)
[![Typescript](https://img.shields.io/badge/-Typescript-blue?style=flat-square&logo=typescript&logoColor=white)](https://www.typescriptlang.org/)
[![bazel](https://img.shields.io/badge/build%20with-bazel-43A047.svg)](https://bazel.build/)

## Project status

Until this message is removed, the status is WIP.
Currently i am discoverig integration with Kubernetes. Ultimate goal
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
- **WebSockets** : Primary communication protocol to enable true real-time user experience (REST currently is not considered as an option)
- **Kafka** : Message broker
- **SASS** (SMACSS) : If style is not in TS, then SASS is used.

## General TO DO

- Cleanup the repository
- Unified package API
- Test on fresh Linux dev workstation
- Implement Hygen
- Implement StoryBook
- Container auto-deployments
- Setup Jenkins integration to run "prod/dev" versions from the `main/dev` repo
- Potentially replace WebPack Dev Server with the `ts_project`
- Swagger rollout for the REST part
- Swagger alternative for the WebSocket API
- Documentation
- T E S T S

## Prerequisites

These tools should be installed locally in order to execute

- Bazelisk with alias or symlink to the `bazel`
- iBazel from the sources
- NodeJS >=16
- Yarn
- TLS certificates should be valid and configured in the DNS/Proxy
- Github Personal Access `GITHUB_NPM_PAT` env. variable/token should be added to the `~/.zshenv` to be able to read and write private/public NPM packages.
- Minikube for local development

### Other relevant things

I have HAProxy configured at the edge which does the A+ perimeter security.
I have custom CloudFlare DNS setup

## How to use

`bazel run //:gazelle` to generate BUILD rules for Go

`bazel build '...'` to build everything

`bazel run //oswee/gateway:gateway -- -a :9090` to run the WSS binary with extra flags

`ibazel run //platform/web:devserver` to run my personal public dev server of user facing app.

In some cases NPM packages should be installed manually, otherwise Bazel will take care of that.

`yarn install`

## Random personal notes

[yarnpkg.com/advanced/editor-sdks#vscode](https://yarnpkg.com/advanced/editor-sdks#vscode)
`yarn dlx @yarnpkg/pnpify --sdk vscode`

Bazel does not play well with PnP ATM, but there are some open issues.
