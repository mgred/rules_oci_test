#! /usr/bin/env bash

CONTAINER_CLI=docker

bazel build :tarball

$CONTAINER_CLI run $($CONTAINER_CLI load -i bazel-bin/tarball/tarball.tar -q | awk -F ":" '{print $NF}')
