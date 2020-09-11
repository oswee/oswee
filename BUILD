load("@bazel_gazelle//:def.bzl", "gazelle")
load("@com_github_bazelbuild_buildtools//buildifier:def.bzl", "buildifier")

# https://bazelbuild.github.io/rules_nodejs/TypeScript.html
exports_files(["tsconfig.json"], visibility = ["//visibility:public"])

# gazelle:exclude third_party
# gazelle:build_file_name BUILD,BUILD.bazel
# gazelle:prefix github.com/oswee/api
gazelle(
    name = "gazelle",
)

buildifier(
    name = "buildifier",
)

buildifier(
    name = "buildifier_check",
    mode = "check",
)
