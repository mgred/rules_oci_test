load("@rules_pkg//:pkg.bzl", "pkg_tar")
load("@rules_oci//oci:defs.bzl", "oci_image")

cc_binary(
    name = "althttpd",
    srcs = ["@althttpd//:althttpd.c"],
    linkstatic = True,
)

pkg_tar(
    name = "althttpd_pkg",
    srcs = [":althttpd"],
    package_dir = "bin",
)

oci_image(
    name = "image",
    architecture = "amd64",
    # entrypoint = ["/bin/althttpd"],
    # cmd = ["-root /www"],
    cmd = [
        "/bin/althttpd",
        "-root /www",
    ],
    os = "linux",
    tars = ["althttpd_pkg.tar"],
    visibility = ["//visibility:public"],
    workdir = "/",
)
