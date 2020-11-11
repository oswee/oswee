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

`bazel build //apps/front:server`

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
