# Setup podman to use as docker backend

## Setup VM

```shell
podman machine init --rootful --cpus 4 --memory 4096 --disk-size 64
```
## Setup docker context

```shell
docker context create --docker host="unix://${XDG_DATA_HOME}/containers/podman/machine/podman.sock" --description "Podman Engine" podman
docker context use podman
```

## Check

```shell
docker info
docker run hello-world
```
