"""
Extension to fetch third-party dependencies
Separated from WORKSPACE to make it more maintainable
"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
# load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

# buildifier: disable=load-on-top
load(
    "@prime//defs:config.bzl",
    "RULES_NODEJS_SHA256",
    "RULES_NODEJS_VERSION",
    "RULES_SASS_SHA256",
    "RULES_SASS_VERSION",
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
      sha256 = "934c9ceb552e84577b0faf1e5a2f0450314985b4d8712b2b70717dc679fdc01b",
      urls = [
          "https://github.com/bazelbuild/rules_python/releases/download/0.3.0/rules_python-0.3.0.tar.gz",
      ],
  )

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

  http_archive(
    name = "com_google_protobuf",
    sha256 = "c6003e1d2e7fefa78a3039f19f383b4f3a61e81be8c19356f85b6461998ad3db",
    strip_prefix = "protobuf-3.17.3",
    urls = [
        "https://mirror.bazel.build/github.com/protocolbuffers/protobuf/archive/v3.17.3.tar.gz",
        "https://github.com/protocolbuffers/protobuf/archive/v3.17.3.tar.gz",
    ],
  )

  http_archive(
    name = "rules_proto",
    sha256 = "602e7161d9195e50246177e7c55b2f39950a9cf7366f74ed5f22fd45750cd208",
    strip_prefix = "rules_proto-97d8af4dc474595af3900dd85cb3a29ad28cc313",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_proto/archive/97d8af4dc474595af3900dd85cb3a29ad28cc313.tar.gz",
        "https://github.com/bazelbuild/rules_proto/archive/97d8af4dc474595af3900dd85cb3a29ad28cc313.tar.gz",
    ],
  )

  http_archive(
    name = "io_bazel_rules_docker",
    sha256 = "1f4e59843b61981a96835dc4ac377ad4da9f8c334ebe5e0bb3f58f80c09735f4",
    strip_prefix = "rules_docker-0.19.0",
    urls = ["https://github.com/bazelbuild/rules_docker/releases/download/v0.19.0/rules_docker-v0.19.0.tar.gz"],
  )

  http_archive(
    name = "io_bazel_rules_k8s",
    sha256 = "51f0977294699cd547e139ceff2396c32588575588678d2054da167691a227ef",
    strip_prefix = "rules_k8s-0.6",
    urls = ["https://github.com/bazelbuild/rules_k8s/archive/v0.6.tar.gz"],
  )

  http_archive(
    name = "rules_typescript_proto",
    sha256 = "51c7c5995f5de89ea1bbd64d956fd589f1c03357ab6768032930fadc2570f6a8",
    strip_prefix = "rules_typescript_proto-0.0.5",
    urls = [
        "https://github.com/Dig-Doug/rules_typescript_proto/archive/0.0.5.tar.gz",
    ],
  )

  http_archive(
    name = "com_github_bazelbuild_buildtools",
    sha256 = "c28eef4d30ba1a195c6837acf6c75a4034981f5b4002dda3c5aa6e48ce023cf1",
    strip_prefix = "buildtools-4.0.1",
    urls = ["https://github.com/bazelbuild/buildtools/archive/4.0.1.tar.gz"],
  )

  http_archive(
    name = "io_bazel_rules_sass",
    sha256 = RULES_SASS_SHA256,
    strip_prefix = "rules_sass-%s" % RULES_SASS_VERSION,
    urls = [
        "https://github.com/bazelbuild/rules_sass/archive/%s.tar.gz" % RULES_SASS_VERSION,
        "https://mirror.bazel.build/github.com/bazelbuild/rules_sass/archive/%s.tar.gz" % RULES_SASS_VERSION,
    ],
  )

  http_archive(
      name = "bazel_skylib",
      sha256 = "1c531376ac7e5a180e0237938a2536de0c54d93f5c278634818e0efc952dd56c",
      urls = [
          "https://github.com/bazelbuild/bazel-skylib/releases/download/1.0.3/bazel-skylib-1.0.3.tar.gz",
          "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.0.3/bazel-skylib-1.0.3.tar.gz",
      ],
  )

  http_archive(
      name = "grpc_ecosystem_grpc_gateway",
      sha256 = "8d7f101db6c458f3d263c823da224a4df05a413847673d1255d2fcce9deddd1f",
      strip_prefix = "grpc-gateway-2.6.0",
      url = "https://github.com/grpc-ecosystem/grpc-gateway/archive/v2.6.0.zip",
  )

  http_archive(
      name = "rules_pkg",
      urls = [
          "https://mirror.bazel.build/github.com/bazelbuild/rules_pkg/releases/download/0.5.1/rules_pkg-0.5.1.tar.gz",
          "https://github.com/bazelbuild/rules_pkg/releases/download/0.5.1/rules_pkg-0.5.1.tar.gz",
      ],
      sha256 = "a89e203d3cf264e564fcb96b6e06dd70bc0557356eb48400ce4b5d97c2c3720d",
  )
