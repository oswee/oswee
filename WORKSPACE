workspace(
    name = "oswee",
    # Let the Bazel manage all NPM packages
    managed_directories = {"@npm": ["node_modules"]},
)

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "io_bazel_rules_go",
    sha256 = "7f1aa43d986df189f7cf30e81dd2dc9d8ed7c74e356341a17267f6d7e5748382",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v0.24.1/rules_go-v0.24.1.tar.gz",
        "https://github.com/bazelbuild/rules_go/releases/download/v0.24.1/rules_go-v0.24.1.tar.gz",
    ],
)

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")

go_rules_dependencies()

go_register_toolchains()

http_archive(
    name = "bazel_gazelle",
    sha256 = "cdb02a887a7187ea4d5a27452311a75ed8637379a1287d8eeb952138ea485f7d",
    urls = [
        "https://storage.googleapis.com/bazel-mirror/github.com/bazelbuild/bazel-gazelle/releases/download/v0.21.1/bazel-gazelle-v0.21.1.tar.gz",
        "https://github.com/bazelbuild/bazel-gazelle/releases/download/v0.21.1/bazel-gazelle-v0.21.1.tar.gz",
    ],
)

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")

gazelle_dependencies()

load("//:repositories.bzl", "go_repositories")

# gazelle:repository_macro repositories.bzl%go_repositories
go_repositories()

load("@io_bazel_rules_go//extras:embed_data_deps.bzl", "go_embed_data_dependencies")

go_embed_data_dependencies()

http_archive(
    name = "io_bazel_rules_docker",
    sha256 = "4521794f0fba2e20f3bf15846ab5e01d5332e587e9ce81629c7f96c793bb7036",
    strip_prefix = "rules_docker-0.14.4",
    urls = ["https://github.com/bazelbuild/rules_docker/releases/download/v0.14.4/rules_docker-v0.14.4.tar.gz"],
)

load(
    "@io_bazel_rules_docker//repositories:repositories.bzl",
    container_repositories = "repositories",
)

container_repositories()

load("@io_bazel_rules_docker//repositories:deps.bzl", container_deps = "deps")

container_deps()

load("@io_bazel_rules_docker//repositories:pip_repositories.bzl", "pip_deps")

pip_deps()

load("@io_bazel_rules_docker//go:image.bzl", _go_image_repos = "repositories")

_go_image_repos()

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

http_archive(
    name = "bazel_gomock",
    sha256 = "4baf3389ca48c30d8b072a027923c91c45915ab8061e39e7a0c62706332e096e",
    strip_prefix = "bazel_gomock-1.2",
    urls = [
        "https://github.com/jmhodges/bazel_gomock/archive/v1.2.tar.gz",
    ],
)

load("@com_github_bazelbuild_buildtools//buildifier:deps.bzl", "buildifier_dependencies")

buildifier_dependencies()

go_register_toolchains(nogo = "@io_bazel_rules_go//:tools_nogo")



###########################################
# Npm Install and Typescript Sass support #
###########################################

# Fetch rules_nodejs
# (you can check https://github.com/bazelbuild/rules_nodejs for a newer release than this)
http_archive(
    name = "build_bazel_rules_nodejs",
    sha256 = "4952ef879704ab4ad6729a29007e7094aef213ea79e9f2e94cbe1c9a753e63ef",
    urls = ["https://github.com/bazelbuild/rules_nodejs/releases/download/2.2.0/rules_nodejs-2.2.0.tar.gz"],
)

# Setup the NodeJS toolchain
load("@build_bazel_rules_nodejs//:index.bzl", "yarn_install")

# The minimum bazel version to use with this repo is v3.5.0.
# check_bazel_version(
#   message = """
#     You no longer need to install Bazel on your machine.
#     Angular has a dependency on the @bazel/bazel package which supplies it.
#     Try running `yarn bazel` instead.
#         (If you did run that, check that you've got a fresh `yarn install`)
#   """,
#   minimum_bazel_version = "3.5.0",
# )

# Setup Bazel managed npm dependencies with the `yarn_install` rule.
# The name of this rule should be set to `npm` so that `ts_library`
# can find your npm dependencies by default in the `@npm` workspace. You may
# also use the `npm_install` rule with a `package-lock.json` file if you prefer.
# See https://github.com/bazelbuild/rules_nodejs#dependencies for more info.
# http_archive(
#     name = "rules_typescript_proto",
#     sha256 = "51c7c5995f5de89ea1bbd64d956fd589f1c03357ab6768032930fadc2570f6a8",
#     strip_prefix = "rules_typescript_proto-0.0.5",
#     urls = [
#         "https://github.com/Dig-Doug/rules_typescript_proto/archive/0.0.5.tar.gz",
#     ],
# )

# load("@rules_typescript_proto//:index.bzl", "rules_typescript_proto_dependencies")

# rules_typescript_proto_dependencies()

# Bazel will use it's default NodeJS version and will not rely on the NodeJS version installed on the machine
# node_repositories(
#   # name = "nodejs", # This is build in name, included in this comment for the clarity
#   # node_version = "14.10.0",
#   # package_json = ["//:package.json"],
#   # yarn_repositories = {
#   #   "1.12.1": ("yarn-v1.12.1.tar.gz", "yarn-v1.12.1", "09bea8f4ec41e9079fa03093d3b2db7ac5c5331852236d63815f8df42b3ba88d"),
#   # },
#   # yarn_version = "1.12.1",
#   # node_repositories = {
#   #   "10.10.0-darwin_amd64": ("node-v10.10.0-darwin-x64.tar.gz", "node-v10.10.0-darwin-x64", "00b7a8426e076e9bf9d12ba2d571312e833fe962c70afafd10ad3682fdeeaa5e"),
#   #   "10.10.0-linux_amd64": ("node-v10.10.0-linux-x64.tar.xz", "node-v10.10.0-linux-x64", "686d2c7b7698097e67bcd68edc3d6b5d28d81f62436c7cf9e7779d134ec262a9"),
#   #   "10.10.0-windows_amd64": ("node-v10.10.0-win-x64.zip", "node-v10.10.0-win-x64", "70c46e6451798be9d052b700ce5dadccb75cf917f6bf0d6ed54344c856830cfb"),
#   # },
# )

# Bazel will run Yarn on it's own and will install all the packages.
# Other option is to look into Self Managed Dependencies
# Setup the Node.js toolchain & install our npm dependencies into @npm
yarn_install(
  name = "npm", # Name this npm so that Bazel Label references look like @npm//package
  package_json = "//:package.json",
  # symlink_node_modules = True, # Expose installed packages for the IDE and the developer. See managed_directories.
  yarn_lock = "//:yarn.lock",
)

# Install all Bazel dependencies needed for npm packages that supply Bazel rules
# Note, this will probably break in a future rules_nodejs release.
# It causes all builds to fetch npm packages even if not needed (eg. only building go code)
# load("@npm//:install_bazel_dependencies.bzl", "install_bazel_dependencies")

# install_bazel_dependencies(suppress_warning = True)
# install_bazel_dependencies()

# Setup TypeScript toolchain
# load("@npm_bazel_typescript//:index.bzl", "ts_setup_workspace")

# ts_setup_workspace()
