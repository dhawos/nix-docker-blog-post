# Purpose

This repository is an exercise to compare Nix & Docker in the context of setting up
environments that are the same in CI and locally.

To do that we will write a basic app in Go using the standard library server.

Here are the objectives that we must complete both with Docker and Nix :

* We must use golangci-lint to lint the code
* We must deploy it to scaleway 
* We must work on arm MacOS and x64 Linux

## Docker

```bash
docker build . -t dev-environment
docker run -it -v $(pwd):/src dev-environment
```

## Log in to scaleway registry with docker CLI

```bash
docker login rg.fr-par.scw.cloud/nix-docker-blog-post -u nologin --password-stdin <<< "$SCW_SECRET_KEY"
```
