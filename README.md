# Prime

This is sandbox monorepository to test Bazel in action

Install Bazelisk as `basel`

```sh
sudo wget -O /usr/local/bin/bazel https://github.com/bazelbuild/bazelisk/releases/latest/download/bazelisk-linux-amd64
sudo chmod +x /usr/local/bin/bazel
```

Run `bazel run //:gazelle` to generate BUILD rules

Run `bazel build '...'` to build everything

Run `bazel run //api/wss:wss -- -a :9090` to run the WSS binary

`yarn install`

## Random personal notes

[yarnpkg.com/advanced/editor-sdks#vscode](https://yarnpkg.com/advanced/editor-sdks#vscode)
`yarn dlx @yarnpkg/pnpify --sdk vscode`

Bazel does not play well with PnP ATM, but there are some open issues.
