"""
Extension to fetch third-party dependencies
Separated from WORKSPACE to make it more maintainable
"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
# load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

# buildifier: disable=load-on-top
load(
    "@prime//bazel:config.bzl",
    "ASPECT_RULES_SWC_SHA256",
    "ASPECT_RULES_SWC_VERSION",
    "BAZEL_GAZELLE_SHA256",
    "BAZEL_GAZELLE_VERSION",
    "BAZEL_SKYLIB_SHA256",
    "BAZEL_SKYLIB_VERSION",
    "COM_GITHUB_BAZELBUILD_BUILDTOOLS_SHA256",
    "COM_GITHUB_BAZELBUILD_BUILDTOOLS_VERSION",
    "COM_GOOGLE_PROTOBUF_SHA256",
    "COM_GOOGLE_PROTOBUF_VERSION",
    "GRPC_ECOSYSTEM_GRPC_GATEWAY_SHA256",
    "GRPC_ECOSYSTEM_GRPC_GATEWAY_VERSION",
    "IO_BAZEL_RULES_DOCKER_SHA256",
    "IO_BAZEL_RULES_DOCKER_VERSION",
    "IO_BAZEL_RULES_GO_SHA256",
    "IO_BAZEL_RULES_GO_VERSION",
    "IO_BAZEL_RULES_K8S_SHA256",
    "IO_BAZEL_RULES_K8S_VERSION",
    "IO_BAZEL_RULES_WEBTESTING_SHA256",
    "IO_BAZEL_RULES_WEBTESTING_VERSION",
    "RULES_NODEJS_SHA256",
    "RULES_NODEJS_VERSION",
    "RULES_PKG_SHA256",
    "RULES_PKG_VERSION",
    "RULES_PROTO_SHA256",
    "RULES_PROTO_VERSION",
    "RULES_PYTHON_SHA256",
    "RULES_PYTHON_VERSION",
    "RULES_RUST_SHA256",
    "RULES_RUST_VERSION",
    "RULES_SASS_SHA256",
    "RULES_SASS_VERSION",
    "RULES_TYPESCRIPT_PROTO_SHA256",
    "RULES_TYPESCRIPT_PROTO_VERSION",
)

def prime_dependencies():
    """Imports external rules

    """
    http_archive(
        name = "build_bazel_rules_nodejs",
        sha256 = RULES_NODEJS_SHA256,
        url = "https://github.com/bazelbuild/rules_nodejs/releases/download/%s/rules_nodejs-%s.tar.gz" % (RULES_NODEJS_VERSION, RULES_NODEJS_VERSION),
    )

    http_archive(
        name = "rules_python",
        sha256 = RULES_PYTHON_SHA256,
        urls = [
            "https://github.com/bazelbuild/rules_python/releases/download/%s/rules_python-%s.tar.gz" % (RULES_PYTHON_VERSION, RULES_PYTHON_VERSION),
        ],
    )

    http_archive(
        name = "io_bazel_rules_go",
        sha256 = IO_BAZEL_RULES_GO_SHA256,
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v%s/rules_go-v%s.zip" % (IO_BAZEL_RULES_GO_VERSION, IO_BAZEL_RULES_GO_VERSION),
            "https://github.com/bazelbuild/rules_go/releases/download/v%s/rules_go-v%s.zip" % (IO_BAZEL_RULES_GO_VERSION, IO_BAZEL_RULES_GO_VERSION),
        ],
    )

    http_archive(
        name = "bazel_gazelle",
        sha256 = BAZEL_GAZELLE_SHA256,
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/bazel-gazelle/releases/download/v%s/bazel-gazelle-v%s.tar.gz" % (BAZEL_GAZELLE_VERSION, BAZEL_GAZELLE_VERSION),
            "https://github.com/bazelbuild/bazel-gazelle/releases/download/v%s/bazel-gazelle-v%s.tar.gz" % (BAZEL_GAZELLE_VERSION, BAZEL_GAZELLE_VERSION),
        ],
    )

    http_archive(
        name = "com_google_protobuf",
        sha256 = COM_GOOGLE_PROTOBUF_SHA256,
        strip_prefix = "protobuf-%s" % COM_GOOGLE_PROTOBUF_VERSION,
        urls = [
            "https://mirror.bazel.build/github.com/protocolbuffers/protobuf/archive/v%s.tar.gz" % COM_GOOGLE_PROTOBUF_VERSION,
            "https://github.com/protocolbuffers/protobuf/archive/v%s.tar.gz" % COM_GOOGLE_PROTOBUF_VERSION,
        ],
    )

    http_archive(
        name = "rules_proto",
        sha256 = RULES_PROTO_SHA256,
        strip_prefix = "rules_proto-%s" % RULES_PROTO_VERSION,
        urls = [
            # "https://mirror.bazel.build/github.com/bazelbuild/rules_proto/archive/97d8af4dc474595af3900dd85cb3a29ad28cc313.tar.gz",
            # "https://github.com/bazelbuild/rules_proto/archive/97d8af4dc474595af3900dd85cb3a29ad28cc313.tar.gz",
            "https://github.com/bazelbuild/rules_proto/archive/refs/tags/%s.tar.gz" % RULES_PROTO_VERSION,
        ],
    )

    http_archive(
        name = "rules_typescript_proto",
        sha256 = RULES_TYPESCRIPT_PROTO_SHA256,
        strip_prefix = "rules_typescript_proto-%s" % RULES_TYPESCRIPT_PROTO_VERSION,
        urls = [
            "https://github.com/Dig-Doug/rules_typescript_proto/archive/%s.tar.gz" % RULES_TYPESCRIPT_PROTO_VERSION,
        ],
    )

    http_archive(
        name = "io_bazel_rules_docker",
        sha256 = IO_BAZEL_RULES_DOCKER_SHA256,
        strip_prefix = "rules_docker-%s" % IO_BAZEL_RULES_DOCKER_VERSION,
        urls = [
            "https://github.com/bazelbuild/rules_docker/releases/download/v%s/rules_docker-v%s.tar.gz" % (IO_BAZEL_RULES_DOCKER_VERSION, IO_BAZEL_RULES_DOCKER_VERSION),
        ],
    )

    http_archive(
        name = "io_bazel_rules_k8s",
        sha256 = IO_BAZEL_RULES_K8S_SHA256,
        strip_prefix = "rules_k8s-%s" % IO_BAZEL_RULES_K8S_VERSION,
        urls = [
            "https://github.com/bazelbuild/rules_k8s/archive/v%s.tar.gz" % IO_BAZEL_RULES_K8S_VERSION,
        ],
    )

    http_archive(
        name = "io_bazel_rules_sass",
        sha256 = RULES_SASS_SHA256,
        strip_prefix = "rules_sass-%s" % RULES_SASS_VERSION,
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/rules_sass/archive/%s.tar.gz" % RULES_SASS_VERSION,
            "https://github.com/bazelbuild/rules_sass/archive/%s.tar.gz" % RULES_SASS_VERSION,
        ],
    )

    http_archive(
        name = "bazel_skylib",
        sha256 = BAZEL_SKYLIB_SHA256,
        urls = [
            "https://github.com/bazelbuild/bazel-skylib/releases/download/%s/bazel-skylib-%s.tar.gz" % (BAZEL_SKYLIB_VERSION, BAZEL_SKYLIB_VERSION),
            "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/%s/bazel-skylib-%s.tar.gz" % (BAZEL_SKYLIB_VERSION, BAZEL_SKYLIB_VERSION),
        ],
    )

    http_archive(
        name = "com_github_bazelbuild_buildtools",
        sha256 = COM_GITHUB_BAZELBUILD_BUILDTOOLS_SHA256,
        strip_prefix = "buildtools-%s" % COM_GITHUB_BAZELBUILD_BUILDTOOLS_VERSION,
        urls = [
            "https://github.com/bazelbuild/buildtools/archive/%s.tar.gz" % COM_GITHUB_BAZELBUILD_BUILDTOOLS_VERSION,
        ],
    )

    http_archive(
        name = "grpc_ecosystem_grpc_gateway",
        # sha256 = GRPC_ECOSYSTEM_GRPC_GATEWAY_SHA256,
        strip_prefix = "grpc-gateway-%s" % GRPC_ECOSYSTEM_GRPC_GATEWAY_VERSION,
        url = "https://github.com/grpc-ecosystem/grpc-gateway/archive/v%s.tar.gz" % GRPC_ECOSYSTEM_GRPC_GATEWAY_VERSION,
    )

    http_archive(
        name = "rules_pkg",
        sha256 = RULES_PKG_SHA256,
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/rules_pkg/releases/download/%s/rules_pkg-%s.tar.gz" % (RULES_PKG_VERSION, RULES_PKG_VERSION),
            "https://github.com/bazelbuild/rules_pkg/releases/download/%s/rules_pkg-%s.tar.gz" % (RULES_PKG_VERSION, RULES_PKG_VERSION),
        ],
    )

    http_archive(
        name = "rules_rust",
        sha256 = RULES_RUST_SHA256,
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/rules_rust/releases/download/%s/rules_rust-v0.2.0.tar.gz" % RULES_RUST_VERSION,
            "https://github.com/bazelbuild/rules_rust/releases/download/%s/rules_rust-v%s.tar.gz" % (RULES_RUST_VERSION, RULES_RUST_VERSION),
        ],
    )

    http_archive(
        name = "io_bazel_rules_webtesting",
        sha256 = IO_BAZEL_RULES_WEBTESTING_SHA256,
        urls = [
            "https://github.com/bazelbuild/rules_webtesting/releases/download/%s/rules_webtesting.tar.gz" % IO_BAZEL_RULES_WEBTESTING_VERSION,
        ],
    )

    http_archive(
        name = "aspect_rules_swc",
        sha256 = ASPECT_RULES_SWC_SHA256,
        strip_prefix = "rules_swc-%s" % ASPECT_RULES_SWC_VERSION,
        url = "https://github.com/aspect-build/rules_swc/archive/refs/tags/v%s.tar.gz" % ASPECT_RULES_SWC_VERSION,
    )
