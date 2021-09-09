"""
Prime Workspace
"""

workspace(
    name = "prime",
    managed_directories = {
        "@npm": ["node_modules"],
    },
)

# buildifier: disable=load-on-top
load("@prime//tools/build:workspace.bzl", "prime_dependencies")

prime_dependencies()

# Variables{{{
# ----------------------------------------------

# buildifier: disable=load-on-top
load(
    "//defs:config.bzl",
    "CONTAINER_REGISTRY",
    "NODEJS_SHA256",
    "NODEJS_VERSION",
    "YARN_SHA256",
    "YARN_VERSION",
)
#}}}

# Rules NodeJS{{{
# ----------------------------------------------

# buildifier: disable=load-on-top
load("@build_bazel_rules_nodejs//:index.bzl", "check_bazel_version", "node_repositories", "yarn_install")

# The minimum bazel version to use with this repo is v4.1.0.
check_bazel_version(minimum_bazel_version = "4.1.0")

# Bazel will use it's default NodeJS version and will not rely on the NodeJS version installed on the machine
node_repositories(
    # OPTIONAL
    node_repositories = {
        "%s-linux_amd64" % NODEJS_VERSION: (
            "node-v%s-linux-x64.tar.xz" % NODEJS_VERSION,
            "node-v%s-linux-x64" % NODEJS_VERSION,
            "%s" % NODEJS_SHA256,
        ),
    },
    # name = "nodejs", # This is build in name, included in this comment for the clarity
    node_version = NODEJS_VERSION,
    # node_urls = ["https://nodejs.org/dist/v16.4.1/node-v16.4.1-linux-x64.tar.xz"],
    # yarn_urls = ["https://github.com/yarnpkg/yarn/releases/download/v1.22.10/yarn-v1.22.10.tar.gz"],
    package_json = ["//:package.json"],
    preserve_symlinks = True,
    yarn_repositories = {
        "%s" % YARN_VERSION: (
            "yarn-v%s.tar.gz" % YARN_VERSION,
            "yarn-v%s" % YARN_VERSION,
            "%s" % YARN_SHA256,
        ),
    },
    yarn_version = YARN_VERSION,
)

# Setup Bazel managed npm dependencies with the `yarn_install` rule.
# The name of this rule should be set to `npm` so that `ts_library`
# can find your npm dependencies by default in the `@npm` workspace. You may
# also use the `npm_install` rule with a `package-lock.json` file if you prefer.
# See https://github.com/bazelbuild/rules_nodejs#dependencies for more info.

# Bazel will run Yarn on it's own and will install all the packages.
# Other option is to look into Self Managed Dependencies
# Setup the Node.js toolchain & install our npm dependencies into @npm
# https://bazelbuild.github.io/rules_nodejs/repositories.html#npm
yarn_install(
    name = "npm",  # Name this npm so that Bazel Label references look like @npm//package
    package_json = "//:package.json",
    symlink_node_modules = True,  # Expose installed packages for the IDE and the developer. See managed_directories.
    yarn_lock = "//:yarn.lock",
)
# }}}

# Rules Python{{{
# ----------------------------------------------
#}}}

# Skylib{{{
# ----------------------------------------------

# buildifier: disable=load-on-top
load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")

bazel_skylib_workspace()

# buildifier: disable=load-on-top
load("@bazel_skylib//lib:versions.bzl", "versions")

versions.check(minimum_bazel_version = "4.1.0")
#}}}

# Rules Go{{{
# ----------------------------------------------
# Check the go_rules and Gazelle version compatibility at https://github.com/bazelbuild/bazel-gazelle#id5

# buildifier: disable=load-on-top
load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")

# buildifier: disable=load-on-top
load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")

go_rules_dependencies()

go_register_toolchains(version = "1.16.6")

# buildifier: disable=load-on-top
load("@prime//tools/build:workspace_go.bzl", "prime_go_dependencies")

# gazelle:repository_macro tools/build/workspace_go.bzl%prime_go_dependencies
prime_go_dependencies()

# gazelle:repo bazel_gazelle
gazelle_dependencies()
# }}}

# Rules Proto{{{
# ----------------------------------------------

# buildifier: disable=load-on-top
load("@rules_proto//proto:repositories.bzl", "rules_proto_dependencies", "rules_proto_toolchains")

rules_proto_dependencies()

rules_proto_toolchains()

# buildifier: disable=load-on-top
load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")

protobuf_deps()
# }}}

# Rules Docker{{{
# ----------------------------------------------

# buildifier: disable=load-on-top
load("@io_bazel_rules_docker//toolchains/docker:toolchain.bzl", docker_toolchain_configure = "toolchain_configure")

# Override the default docker toolchain configuration.
docker_toolchain_configure(
    name = "docker_config",
    docker_flags = [
        "--log-level=info",
    ],
    docker_path = "/usr/bin/podman",
)

# buildifier: disable=load-on-top
load("@io_bazel_rules_docker//repositories:repositories.bzl", container_repositories = "repositories")

# buildifier: disable=load-on-top
container_repositories()

# buildifier: disable=load-on-top
load("@io_bazel_rules_docker//repositories:deps.bzl", container_deps = "deps")

container_deps()

# buildifier: disable=load-on-top
load("@io_bazel_rules_docker//container:container.bzl", "container_pull")

container_pull(
    name = "alpine_linux_amd64",
    registry = "index.docker.io",
    repository = "library/alpine",
    tag = "3.8",
)

# buildifier: disable=load-on-top
load("@io_bazel_rules_docker//go:image.bzl", _go_image_repos = "repositories")

_go_image_repos()
# }}}

# Rules K8s{{{
# ----------------------------------------------

# buildifier: disable=load-on-top
load("@io_bazel_rules_k8s//k8s:k8s.bzl", "k8s_defaults", "k8s_repositories")

k8s_repositories()

# buildifier: disable=load-on-top
load("@io_bazel_rules_k8s//k8s:k8s_go_deps.bzl", k8s_go_deps = "deps")

k8s_go_deps()

_CLUSTER = "minikube"

_CONTEXT = _CLUSTER

_NAMESPACE = "prime"

k8s_defaults(
    name = "k8s_object",
    cluster = _CLUSTER,
    context = _CONTEXT,
    image_chroot = CONTAINER_REGISTRY + "/oswee",
    namespace = _NAMESPACE,
)

k8s_defaults(
    name = "k8s_deploy",
    cluster = _CLUSTER,
    context = _CONTEXT,
    image_chroot = CONTAINER_REGISTRY + "/oswee",
    kind = "deployment",
    namespace = _NAMESPACE,
)

[k8s_defaults(
    name = "k8s_" + kind,
    cluster = _CLUSTER,
    context = _CONTEXT,
    kind = kind,
    namespace = _NAMESPACE,
) for kind in [
    "service",
    "crd",
    "todo",
]]
# }}}

# Rules Go Mock{{{
# ----------------------------------------------

# bazel_gomock_commit = "fde78c91cf1783cc1e33ba278922ba67a6ee2a84"

# http_archive(
#     name = "bazel_gomock",
#     sha256 = "692421b0c5e04ae4bc0bfff42fb1ce8671fe68daee2b8d8ea94657bb1fcddc0a",
#     strip_prefix = "bazel_gomock-{v}".format(v = bazel_gomock_commit),
#     urls = [
#         "https://github.com/jmhodges/bazel_gomock/archive/{v}.tar.gz".format(v = bazel_gomock_commit),
#     ],
# )
#}}}

# Rules TypeScript Proto{{{
# ----------------------------------------------

# buildifier: disable=load-on-top
load("@rules_typescript_proto//:index.bzl", "rules_typescript_proto_dependencies")

rules_typescript_proto_dependencies()
# }}}

# Rules Buildtools{{{
# ----------------------------------------------

# # Bazel toolchain needed for remote execution
# BAZEL_TOOLCHAIN_VERSION = "3.5.0"
# BAZEL_TOOLCHAIN_SHA256 = "89a053218639b1c5e3589a859bb310e0a402dedbe4ee369560e66026ae5ef1f2"
# http_archive(
#     name = "bazel_toolchains",
#     sha256 = BAZEL_TOOLCHAIN_SHA256,
#     strip_prefix = "bazel-toolchains-%s" % BAZEL_TOOLCHAIN_VERSION,
#     urls = [
#         "https://mirror.bazel.build/github.com/bazelbuild/bazel-toolchains/releases/download/%s/bazel-toolchains-%s.tar.gz" % (BAZEL_TOOLCHAIN_VERSION, BAZEL_TOOLCHAIN_VERSION),
#         "https://github.com/bazelbuild/bazel-toolchains/releases/download/%s/bazel-toolchains-%s.tar.gz" % (BAZEL_TOOLCHAIN_VERSION, BAZEL_TOOLCHAIN_VERSION),
#     ],
# )

# buildifier: disable=load-on-top
load("@com_github_bazelbuild_buildtools//buildifier:deps.bzl", "buildifier_dependencies")

buildifier_dependencies()

# go_register_toolchains(nogo = "@io_bazel_rules_go//:tools_nogo")
#}}}

# Rules SASS{{{
# ----------------------------------------------

# Fetch required transitive dependencies. This is an optional step because you
# can always fetch the required NodeJS transitive dependency on your own.
# buildifier: disable=load-on-top
load("@io_bazel_rules_sass//:package.bzl", "rules_sass_dependencies")

rules_sass_dependencies()

# Setup the rules_sass toolchain
# buildifier: disable=load-on-top
load("@io_bazel_rules_sass//sass:sass_repositories.bzl", "sass_repositories")

sass_repositories()
# }}}
