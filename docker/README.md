# Migration from Docker Desktop to standalone docker with lima backend

> [!WARNING]
> Do this on your own risk

> [!IMPORTANT]
> ARM macos only

## Setup VM via limactl

```shell
limactl create "${XDG_CONFIG_HOME}/lima/default.yaml"
```

## Start vm
```shell
limactl start
```

### Optional: Link docker socket

```shell
socketPath=$(limactl list --format yaml | yq 'select(.instance.name == "default") | .instance.config.portForwards.[].hostSocket') && sudo ln -sf $socketPath /var/run/
```

## Update docker/config.json

```shell
(yq --unwrapScalar '.cliPluginsExtraDirs.[]' "${DOCKER_CONFIG}/config.json" | grep -E "^${HOMEBREW_PREFIX}/lib/docker/cli-plugins$")>/dev/null || yq '("${HOMEBREW_PREFIX}/lib/docker/cli-plugins" | envsubst) as $cli-plugins | .cliPluginsExtraDirs += [$cli-plugins]' "${DOCKER_CONFIG}/config.json"
```

## Setup docker context


```shell
docker context create --docker host="unix://$(limactl list --format yaml | yq 'select(.instance.name == "default") | .instance.config.portForwards.[].hostSocket')" --description "Docker Engine via lima-vm" limactl
docker context use limactl
```

## Check

```shell
docker info
docker run hello-world
```
