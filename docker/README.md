# Migration from Docker Desktop to standalone docker with lima backend

> [!WARNING]
> Do this on your own risk

## Setup VM via limactl

> [!IMPORTANT]
> macos only
> ```shell
> limactl create --cpus=4 --memory=8 --disk=64 --vm-type=vz --mount-type=virtiofs --rosetta --network=vzNAT template://docker-rootful
> ```

```shell
limactl create --cpus=4 --memory=8 --disk=64 --containerd user+system template://docker
```

## Start vm
```shell
limactl start docker-rootful
```

## Link docker socket

```shell
sudo ln -sf "${LIMA_HOME}/docker-rootful/sock/docker.sock" /var/run/
```

## Update docker/config.json

```shell
(yq --unwrapScalar '.cliPluginsExtraDirs.[]' config.json | grep -E "^${HOMEBREW_PREFIX}/lib/docker/cli-plugins$")>/dev/null || yq '("${HOMEBREW_PREFIX}/lib/docker/cli-plugins" | envsubst) as $cli-plugins | .cliPluginsExtraDirs += [$cli-plugins]' "${DOCKER_CONFIG}/config.json"
```

## Setup docker context


```shell
docker context create --docker host="unix://${LIMA_HOME}/docker-rootful/sock/docker.sock" --description "Docker Engine via lima-vm" limactl
docker context use limactl
```

## Check

```shell
docker info
docker run hello-world
```
