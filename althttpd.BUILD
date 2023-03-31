load("@rules_pkg//:pkg.bzl", "pkg_tar")
load("@rules_oci//oci:defs.bzl", "oci_image")

cc_binary(
    name = "althttpd",
    srcs = ["@althttpd//:althttpd.c"],
    features = ["fully_static_link"],
    linkstatic = True,
)

pkg_tar(
    name = "althttpd_pkg",
    srcs = [":althttpd"],
    package_dir = "bin",
)

genrule(
    name = "user",
    outs = ["passwd"],
    cmd = """
echo "www:x:1:1:www:/www:/bin/nologin" > $@
  """,
)

pkg_tar(
    name = "user_pkg",
    srcs = [":user"],
    package_dir = "etc",
)

oci_image(
    name = "image",
    architecture = "amd64",
    cmd = [
        "-root",
        "/www",
        "-port",
        "8080",
        "-user",
        "www",
    ],
    entrypoint = ["/bin/althttpd"],
    os = "linux",
    tars = [
        "althttpd_pkg.tar",
        "user_pkg.tar",
    ],
    user = "1",
    visibility = ["//visibility:public"],
    workdir = "/",
)
