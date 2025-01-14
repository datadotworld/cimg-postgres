#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes
set -eo pipefail

docker context create cimg
docker buildx create --use cimg
docker buildx build --platform=linux/amd64,linux/arm64 --file 13.18/Dockerfile -t cimg/postgres:13.18 -t cimg/postgres:13.18 --push .
docker buildx build --platform=linux/amd64,linux/arm64 --file 13.18/postgis/Dockerfile -t cimg/postgres:13.18-postgis -t cimg/postgres:13.18-postgis --push .
