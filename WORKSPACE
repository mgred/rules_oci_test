workspace(
    name = "rules_oci_test",
)

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "rules_oci",
    sha256 = "48642588e91e992772b94de06234da6601854fda0ee32a91ce8ef303cf5e5837",
    strip_prefix = "rules_oci-0.3.7",
    url = "https://github.com/bazel-contrib/rules_oci/releases/download/v0.3.7/rules_oci-v0.3.7.tar.gz",
)

load("@rules_oci//oci:dependencies.bzl", "rules_oci_dependencies")

rules_oci_dependencies()

load("@rules_oci//oci:repositories.bzl", "LATEST_CRANE_VERSION", "LATEST_ZOT_VERSION", "oci_register_toolchains")

oci_register_toolchains(
    name = "oci",
    crane_version = LATEST_CRANE_VERSION,
    zot_version = LATEST_ZOT_VERSION,
)

http_archive(
    name = "rules_pkg",
    sha256 = "8c20f74bca25d2d442b327ae26768c02cf3c99e93fad0381f32be9aab1967675",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_pkg/releases/download/0.8.1/rules_pkg-0.8.1.tar.gz",
        "https://github.com/bazelbuild/rules_pkg/releases/download/0.8.1/rules_pkg-0.8.1.tar.gz",
    ],
)

load("@rules_pkg//:deps.bzl", "rules_pkg_dependencies")

rules_pkg_dependencies()

http_archive(
    name = "althttpd",
    build_file = "//:althttpd.BUILD",
    sha256 = "c84f4c5b518bd314f72cf92d0bc29a8cc4d0bb3d164b7354fe1d69013c311f70",
    strip_prefix = "althttpd-7c10fb6329",
    url = "https://sqlite.org/althttpd/tarball/7c10fb6329/althttpd-7c10fb6329.tar.gz",
)
