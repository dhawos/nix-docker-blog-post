#!/bin/bash

set -eo pipefail

scw container container update ${CONTAINER_ID} region=fr-par registry-image=rg.fr-par.scw.cloud/nix-docker-blog-post/app:${IMAGE_TAG} port=8080 --wait
