workspace(
    name = "oswee",
    managed_directories = {
        "@npm": ["node_modules"],
        "@npm1": ["platform/web/prime/node_modules"],
    },
)

# buildifier: disable=load-on-top
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load(
    "//defs:config.bzl",
    "CONTAINER_REGISTRY",
    "NODEJS_SHA256",
    "NODEJS_VERSION",
    "RULES_NODEJS_SHA256",
    "RULES_NODEJS_VERSION",
    "RULES_SASS_SHA256",
    "RULES_SASS_VERSION",
    "YARN_SHA256",
    "YARN_VERSION",
)

# Skylib{{{
# ----------------------------------------------

http_archive(
    name = "bazel_skylib",
    sha256 = "1c531376ac7e5a180e0237938a2536de0c54d93f5c278634818e0efc952dd56c",
    urls = [
        "https://github.com/bazelbuild/bazel-skylib/releases/download/1.0.3/bazel-skylib-1.0.3.tar.gz",
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.0.3/bazel-skylib-1.0.3.tar.gz",
    ],
)

load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")

bazel_skylib_workspace()

load("@bazel_skylib//lib:versions.bzl", "versions")

versions.check(minimum_bazel_version = "4.1.0")
#}}}

# Go{{{
# ----------------------------------------------
# Check the go_rules and Gazelle version compitability at https://github.com/bazelbuild/bazel-gazelle#id5

http_archive(
    name = "io_bazel_rules_go",
    sha256 = "8e968b5fcea1d2d64071872b12737bbb5514524ee5f0a4f54f5920266c261acb",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v0.28.0/rules_go-v0.28.0.zip",
        "https://github.com/bazelbuild/rules_go/releases/download/v0.28.0/rules_go-v0.28.0.zip",
    ],
)

http_archive(
    name = "bazel_gazelle",
    sha256 = "62ca106be173579c0a167deb23358fdfe71ffa1e4cfdddf5582af26520f1c66f",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-gazelle/releases/download/v0.23.0/bazel-gazelle-v0.23.0.tar.gz",
        "https://github.com/bazelbuild/bazel-gazelle/releases/download/v0.23.0/bazel-gazelle-v0.23.0.tar.gz",
    ],
)

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")
load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")

go_rules_dependencies()

go_register_toolchains(version = "1.16.6")

gazelle_dependencies()

load("//:deps.bzl", "go_dependencies")

go_dependencies()
# }}}

# Rules Docker{{{
# ----------------------------------------------

http_archive(
    name = "io_bazel_rules_docker",
    sha256 = "59d5b42ac315e7eadffa944e86e90c2990110a1c8075f1cd145f487e999d22b3",
    strip_prefix = "rules_docker-0.17.0",
    urls = ["https://github.com/bazelbuild/rules_docker/releases/download/v0.17.0/rules_docker-v0.17.0.tar.gz"],
)

load("@io_bazel_rules_docker//toolchains/docker:toolchain.bzl", docker_toolchain_configure = "toolchain_configure")

# Override the default docker toolchain configuration.
docker_toolchain_configure(
    name = "docker_config",
    docker_flags = [
        "--log-level=info",
    ],
    docker_path = "/usr/bin/podman",
)

load("@io_bazel_rules_docker//repositories:repositories.bzl", container_repositories = "repositories")

container_repositories()

load("@io_bazel_rules_docker//repositories:deps.bzl", container_deps = "deps")

container_deps()

load("@io_bazel_rules_docker//container:container.bzl", "container_pull")

container_pull(
    name = "alpine_linux_amd64",
    registry = "index.docker.io",
    repository = "library/alpine",
    tag = "3.8",
)
# }}}

# Rules Kubernetes{{{
# ----------------------------------------------

http_archive(
    name = "io_bazel_rules_k8s",
    sha256 = "51f0977294699cd547e139ceff2396c32588575588678d2054da167691a227ef",
    strip_prefix = "rules_k8s-0.6",
    urls = ["https://github.com/bazelbuild/rules_k8s/archive/v0.6.tar.gz"],
)

load("@io_bazel_rules_k8s//k8s:k8s.bzl", "k8s_defaults", "k8s_repositories")

k8s_repositories()

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

load("@io_bazel_rules_docker//go:image.bzl", _go_image_repos = "repositories")

_go_image_repos()
# }}}

# Rules Protocol Buffers{{{
# ----------------------------------------------

http_archive(
    name = "rules_proto",
    sha256 = "602e7161d9195e50246177e7c55b2f39950a9cf7366f74ed5f22fd45750cd208",
    strip_prefix = "rules_proto-97d8af4dc474595af3900dd85cb3a29ad28cc313",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_proto/archive/97d8af4dc474595af3900dd85cb3a29ad28cc313.tar.gz",
        "https://github.com/bazelbuild/rules_proto/archive/97d8af4dc474595af3900dd85cb3a29ad28cc313.tar.gz",
    ],
)

load("@rules_proto//proto:repositories.bzl", "rules_proto_dependencies", "rules_proto_toolchains")

rules_proto_dependencies()

rules_proto_toolchains()
# }}}

# Rules Go Mock{{{
# ----------------------------------------------

bazel_gomock_commit = "fde78c91cf1783cc1e33ba278922ba67a6ee2a84"

http_archive(
    name = "bazel_gomock",
    sha256 = "692421b0c5e04ae4bc0bfff42fb1ce8671fe68daee2b8d8ea94657bb1fcddc0a",
    strip_prefix = "bazel_gomock-{v}".format(v = bazel_gomock_commit),
    urls = [
        "https://github.com/jmhodges/bazel_gomock/archive/{v}.tar.gz".format(v = bazel_gomock_commit),
    ],
)
# }}}

# Waz iz zas TODO{{{
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

load("@com_github_bazelbuild_buildtools//buildifier:deps.bzl", "buildifier_dependencies")

buildifier_dependencies()

go_register_toolchains(nogo = "@io_bazel_rules_go//:tools_nogo")
#}}}

# Rules NodeJS{{{
# ----------------------------------------------

http_archive(
    name = "build_bazel_rules_nodejs",
    sha256 = RULES_NODEJS_SHA256,
    url = "https://github.com/bazelbuild/rules_nodejs/releases/download/%s/rules_nodejs-%s.tar.gz" % (RULES_NODEJS_VERSION, RULES_NODEJS_VERSION),
)

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

yarn_install(
    name = "npm1",
    package_json = "//platform/web/prime:package.json",
    yarn_lock = "//platform/web/prime:yarn.lock",
    # always_hide_bazel_files = True,
    # symlink_node_modules = True,
)
# }}}

# Rules TypeScript Protocol Buffers{{{
# ----------------------------------------------

http_archive(
    name = "rules_typescript_proto",
    sha256 = "51c7c5995f5de89ea1bbd64d956fd589f1c03357ab6768032930fadc2570f6a8",
    strip_prefix = "rules_typescript_proto-0.0.5",
    urls = [
        "https://github.com/Dig-Doug/rules_typescript_proto/archive/0.0.5.tar.gz",
    ],
)

load("@rules_typescript_proto//:index.bzl", "rules_typescript_proto_dependencies")

rules_typescript_proto_dependencies()

# Install all Bazel dependencies needed for npm packages that supply Bazel rules
# Note, this will probably break in a future rules_nodejs release.
# It causes all builds to fetch npm packages even if not needed (eg. only building go code)
# load("@npm//:install_bazel_dependencies.bzl", "install_bazel_dependencies")
# install_bazel_dependencies(suppress_warning = True)

# load("@npm1//:install_bazel_dependencies.bzl", "install_bazel_dependencies")
# install_bazel_dependencies(suppress_warning = True)

# Setup TypeScript toolchain
# load("@build_bazel_rules_typescript//:defs.bzl", "ts_setup_workspace")
# load("@npm_bazel_typescript//:setup.bzl", "ts_setup_workspace")
# load("@npm_bazel_typescript//:defs.bzl", "ts_setup_workspace")
# ts_setup_workspace()
# }}}

# Rules SASS{{{
# ----------------------------------------------

http_archive(
    name = "io_bazel_rules_sass",
    sha256 = RULES_SASS_SHA256,
    strip_prefix = "rules_sass-%s" % RULES_SASS_VERSION,
    urls = [
        "https://github.com/bazelbuild/rules_sass/archive/%s.tar.gz" % RULES_SASS_VERSION,
        "https://mirror.bazel.build/github.com/bazelbuild/rules_sass/archive/%s.tar.gz" % RULES_SASS_VERSION,
    ],
)

# Fetch required transitive dependencies. This is an optional step because you
# can always fetch the required NodeJS transitive dependency on your own.
load("@io_bazel_rules_sass//:package.bzl", "rules_sass_dependencies")

rules_sass_dependencies()

# Setup the rules_sass toolchain
load("@io_bazel_rules_sass//sass:sass_repositories.bzl", "sass_repositories")

sass_repositories()
# }}}
