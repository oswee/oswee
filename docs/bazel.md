# Bazel

Multi-run - run multiple executable

[Multi-Run](https://github.com/atlassian/bazel-tools/tree/master/multirun)

Alias - short name of the target

[YouTube](https://youtu.be/1KbfkOWO-DY?t=3125)

Watch mode `yarn add -D @bazel/ibazel`

[Macros](https://youtu.be/1KbfkOWO-DY?t=3793)

Probably I can use underscore to identify macros for easy spotting.

How to structure repository?
[building-large-scale-react-applications-in-a-monorepo](https://medium.com/@luisvieira_gmr/building-large-scale-react-applications-in-a-monorepo-91cd4637c131)

[package.json#scripts](https://docs.bazel.build/versions/master/build-javascript.html#step-4-linting)

[github.com/dataform-co/dataform/blob/master/protos/BUILD](https://github.com/dataform-co/dataform/blob/master/protos/BUILD)
[dataform.co/blog/typescript-monorepo-with-bazel](https://dataform.co/blog/typescript-monorepo-with-bazel)

[A User's Guide to Bazel](http://gensoft.pasteur.fr/docs/bazel/0.3.0/bazel-user-manual.html)

[`bazel clean --expunge`](https://github.com/bazelbuild/rules_nodejs/issues/1220#issuecomment-537106667)

Run single build rule

```bash
bazel build //apps/front:server
```

"Server" is a target name in the `//apps/front/BUILD.bazel`

To run front app use `bazel run //apps/front:server`

To reference the rule from the same package use `:rule_name_from_the_same_package`

To reference the rule from the another package use `//path/from/the/workspace/root/to/the/project/package:rule_name_from_the_another_package`

If the rule name is the same as package name, for example `//foo/bar:bar` then it is preferred to use shorthand version of `//foo/bar`

## Installation

Install Bazelisk as `bazel`

```sh
sudo wget -O /usr/local/bin/bazel https://github.com/bazelbuild/bazelisk/releases/latest/download/bazelisk-linux-amd64
sudo chmod +x /usr/local/bin/bazel
```

## Update

- Update NodeJS
- Update Yarn
- Update Bazelisk
- Increase the Bazel version in .bazelversion file of this repository
- Update other components like ibazel, buildifier, etc.

## TODO

- [ ] How to get SHA checksum?
      From command line run `sha256sum ~/Downloads/node-v17.9.0-linux-x64.tar.xz`

To get checksums you can visit https://github.com/bazelbuild/rules_nodejs/blob/stable/nodejs/private/node_versions.bzl
and https://github.com/bazelbuild/rules_nodejs/blob/stable/nodejs/private/yarn_versions.bzl files.

## NPM vs Yarn

If you take a look at Angular project, you will see this statement [Please use yarn instead of NPM to install dependencies](https://github.com/angular/angular/blob/5d155950e3764f72972017144edd9c7793200cd1/package.json#L13)

## Modules

To get Subresource Integrity use this command

```bash
shasum -b -a 256 ~/Downloads/rules_swc-0.10.0.tar.gz | awk '{ print $1 }' | xxd -r -p | base64
```

It will return `g7qJa977TS1Te2dHQrw4vxUa3jU65KVk+IS8buLB3GU=`

```bash
sha256sum ~/Downloads/protobuf-21.5.tar.gz
```

where the archive is dowloaded from the GitHub releases or similar source. Don't forget to add `sha256-` prefix when listing dependency in the registry.

```

```
