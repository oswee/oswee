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
    "//bazel:config.bzl",
    "NODE_SHA256",
    "NODE_VERSION",
    "YARN_SHA256",
    "YARN_VERSION",
    "CONTAINER_REGISTRY",
)
#}}}

# Rules NodeJS{{{
# ----------------------------------------------

load("@build_bazel_rules_nodejs//:repositories.bzl", "build_bazel_rules_nodejs_dependencies")

build_bazel_rules_nodejs_dependencies()

# buildifier: disable=load-on-top
load("@rules_nodejs//nodejs:repositories.bzl", "nodejs_register_toolchains")

nodejs_register_toolchains(
    name = "nodejs",
    node_version = NODE_VERSION,
    # node_urls = ["https://nodejs.org/dist/v16.4.1/node-v16.4.1-linux-x64.tar.xz"],
    node_repositories = {
        "%s-linux_amd64" % NODE_VERSION: (
            "node-v%s-linux-x64.tar.xz" % NODE_VERSION,
            "node-v%s-linux-x64" % NODE_VERSION,
            "%s" % NODE_SHA256,
        ),
    },

    # Use custom Yarn version.
    # yarn_version = YARN_VERSION,
    # yarn_version = "1.22.18",
    # yarn_urls = ["https://github.com/yarnpkg/berry/archive/refs/tags/@yarnpkg/cli/%s.tar.gz" % YARN_VERSION],
    # yarn_repositories = {
    #     "%s" % YARN_VERSION: (
    #         "berry--yarnpkg-cli-%s.tar.gz" % YARN_VERSION,
    #         "berry--yarnpkg-cli-%s" % YARN_VERSION,
    #         "%s" % YARN_SHA256,
    #     ),
    # },

    # package_json = ["//:package.json"],
    # preserve_symlinks = True,
)

load("@build_bazel_rules_nodejs//:index.bzl", "yarn_install")
yarn_install(
    name = "npm",  # Name this npm so that Bazel Label references look like @npm//package
    # args = ["--immutable"],  # Pass extra Yarn arguments
    # frozen_lockfile = False,
    symlink_node_modules = True,  # Expose installed packages for the IDE and the developer. See managed_directories.
    # use_mutex = False,
    # quiet = False,
    data = [
      # "//:.yarnrc.yml",
      # "@vendored_yarn_3_2_0//:berry--yarnpkg-cli-3.2.0/packages/yarnpkg-cli/bin/yarn.js",
    ],
    package_json = "//:package.json",
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

versions.check(minimum_bazel_version = "5.0.0")
#}}}

# Rules Go{{{
# ----------------------------------------------
# Check the go_rules and Gazelle version compatibility at https://github.com/bazelbuild/bazel-gazelle#id5

# buildifier: disable=load-on-top
load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")

# buildifier: disable=load-on-top
load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")

go_rules_dependencies()

go_register_toolchains(version = "1.18")

# buildifier: disable=load-on-top
load("//go:repositories.bzl", "go_deps")

# gazelle:repository_macro go/repositories.bzl%go_deps
go_deps()

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
load("@prime//tools/build:workspace_containers.bzl", "prime_containers")

prime_containers()

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

# _CLUSTER = "minikube"
_CLUSTER = "dev"

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
# load("@io_bazel_rules_sass//:package.bzl", "rules_sass_dependencies")

# rules_sass_dependencies()

# Setup the rules_sass toolchain
# buildifier: disable=load-on-top
load("@io_bazel_rules_sass//sass:sass_repositories.bzl", "sass_repositories")

sass_repositories()
# }}}

# Rules PKG{{{
# ----------------------------------------------

# buildifier: disable=load-on-top
load("@rules_pkg//:deps.bzl", "rules_pkg_dependencies")

rules_pkg_dependencies()
# }}}

# Rules Rust{{{
# ----------------------------------------------

# buildifier: disable=load-on-top
load("@rules_rust//rust:repositories.bzl", "rules_rust_dependencies", "rust_register_toolchains")

rules_rust_dependencies()

rust_register_toolchains()
# }}}
