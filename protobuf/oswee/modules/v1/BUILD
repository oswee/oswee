load("@io_bazel_rules_go//go:def.bzl", "go_library")
load("@io_bazel_rules_go//proto:def.bzl", "go_proto_library")
load("@rules_proto//proto:defs.bzl", "proto_library")

proto_library(
    name = "modules_proto",
    srcs = ["modules.proto"],
    strip_import_prefix = "/protobuf",
    visibility = ["//visibility:public"],
    deps = ["@go_googleapis//google/api:annotations_proto"],
)

go_proto_library(
    name = "modules_go_proto",
    compilers = ["@io_bazel_rules_go//proto:go_grpc"],
    importpath = "github.com/oswee/prime/protobuf/oswee/modules/v1",
    proto = ":modules_proto",
    visibility = ["//visibility:public"],
    deps = ["@go_googleapis//google/api:annotations_go_proto"],
)

go_library(
    name = "go_default_library",
    embed = [":modules_go_proto"],
    importpath = "github.com/oswee/prime/protobuf/oswee/modules/v1",
    visibility = ["//visibility:public"],
)
