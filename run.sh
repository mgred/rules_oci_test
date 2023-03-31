#! /usr/bin/env bash

CONTAINER_CLI=docker

bazel build :tarball

$CONTAINER_CLI run -it --rm \
  --publish 8080:8080 \
  $($CONTAINER_CLI load -i bazel-out/k8-fastbuild/bin/tarball/tarball.tar -q | awk -F ":" '{print $NF}')
