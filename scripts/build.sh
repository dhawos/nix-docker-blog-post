#!/bin/bash

set -eo pipefail

docker login rg.fr-par.scw.cloud/nix-docker-blog-post -u nologin --password-stdin <<<"$SCW_SECRET_KEY"
IMAGE_TAG=${1:-"latest"}
IMAGE="rg.fr-par.scw.cloud/nix-docker-blog-post/app:${IMAGE_TAG}"
docker build . -t "${IMAGE}"
docker push "${IMAGE}"
