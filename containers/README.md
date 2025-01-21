# Setup podman to use as docker backend

## Setup VM

```shell
podman machine init --rootful --cpus 4 --memory 4096 --disk-size 64
```
## Setup docker context

> [!IMPORTANT]
> On macos, podman creates api.sock inside TMPDIR by default. To ensure that `${XDG_DATA_HOME}/containers/podman/machine/podman.sock` will exist, setup LaunchDaemon via `sudo podman-mac-helper install`. It will keep symlink from real api.sock to podman.sock valid.

```shell
docker context create --docker host="unix://${XDG_DATA_HOME}/containers/podman/machine/podman.sock" --description "Podman Engine" podman
docker context use podman
```

## Check

```shell
docker info
docker run hello-world
```
