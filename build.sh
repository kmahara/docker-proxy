#!/bin/sh

#OPT="--build-arg http_proxy=http://172.17.0.1:3128/"

docker build \
-t kmahara/proxy \
$OPT \
.
