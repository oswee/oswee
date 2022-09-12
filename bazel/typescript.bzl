"""
Extension to fetch third-party dependencies
Separated from WORKSPACE to make it more maintainable
"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# buildifier: disable=load-on-top
load(
    "//bazel:config.bzl",
    "RULES_TYPESCRIPT_PROTO_VERSION",
)

def prime_typescript_dependencies():
    """Imports external dependencies

    """
    http_archive(
        name = "aspect_rules_js",
        sha256 = "02486a3b54fab15e6af00a6b79944b9660e43fd91ac56f8e34812a9053dc60bb",
        strip_prefix = "rules_js-1.0.0-beta.1",
        url = "https://github.com/aspect-build/rules_js/archive/refs/tags/v1.0.0-beta.1.tar.gz",
    )

    http_archive(
        name = "aspect_rules_swc",
        sha256 = "a484046ba2094284aa41c81f7e0fe4de8df7b21aacd3c5762fa442f80e11585b",
        strip_prefix = "rules_swc-0.11.0",
        url = "https://github.com/aspect-build/rules_swc/archive/refs/tags/v0.11.0.tar.gz",
    )

    http_archive(
        name = "aspect_rules_ts",
        sha256 = "991a5ccad5fd276164ea64c01ae0b67820a5d514fbf37ae3f7ac8701a84b9f5a",
        strip_prefix = "rules_ts-0.7.0",
        url = "https://github.com/aspect-build/rules_ts/archive/refs/tags/v0.7.0.tar.gz",
    )
