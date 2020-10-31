# Prime

This is sandbox monorepository to test Bazel in action

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

- Bazelisk with alias to the `bazel`
- iBazel from the sources
- NodeJS >=14
- Yarn
- TLS certificates should be valid and configured in the DNS/Proxy

### Other relevant things

plus: I have HAProxy configured at the edge which does the A+ perimeter security.
plus: I have custom CloudFlare DNS setup

## How to use

`bazel run //:gazelle` to generate BUILD rules for Go

`bazel build '...'` to build everything

`bazel run //api/wss:wss -- -a :9090` to run the WSS binary with extra flags

`ibazel run //apps/front:devserver` to run the My personal public dev server.

NPM packages should be installed manually

`yarn install`

## Random personal notes

[yarnpkg.com/advanced/editor-sdks#vscode](https://yarnpkg.com/advanced/editor-sdks#vscode)
`yarn dlx @yarnpkg/pnpify --sdk vscode`

Bazel does not play well with PnP ATM, but there are some open issues.
