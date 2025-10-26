# sing-box

## Test subscription url

Fetch connections list from subscription, select one by url fragment via fzf and pretty-print connection link:

```shell
curl --silent --location <your-subscription-url> | base64 --decode | fzf --delimiter='\#' --with-nth=2 | sed -E 's/(\?|&|#)/\n\1/g'
```

## Create outbounds

### Create outbounds with all connections:

```shell
./outbounds <your-subscription-url> | yq --input-format=json --output-format=json eval '{"outbounds": .}' > outbounds.json
```

### Create outbounds with selected connections:

> [!NOTE]
> See fzf options in fzf/config and zsh/.zshenv

```shell
./outbounds <your-subscription-url> --fzf | fzf --delimiter='\#' --with-nth=2 --accept-nth=1 | yq --input-format=json --output-format=json eval-all '[.]' | yq --input-format=json --output-format=json eval '{"outbounds": .}' > outbounds.json
```

## Create proxy environment

```shell filename="~/.config/environment.d/00_proxy.conf"
SOCKS_SERVER="127.0.0.1:2080"
SOCKS5_SERVER=$SOCKS_SERVER

HTTP_PROXY="socks5://127.0.0.1:2080/"
HTTPS_PROXY=$HTTP_PROXY
FTP_PROXY=$HTTP_PROXY
RSYNC_PROXY=$HTTP_PROXY
NO_PROXY="127.0.0.0/8,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16,localhost"

http_proxy=$HTTP_PROXY
https_proxy=$HTTPS_PROXY
ftp_proxy=$FTP_PROXY
rsync_proxy=$RSYNC_PROXY
no_proxy=$NO_PROXY
```

## Create systemd service

```ini filename="~/.config/systemd/user/sing-box.service"
[Unit]
Description=sing-box user service
Documentation=https://sing-box.sagernet.org
After=network.target network-online.target systemd-networkd-wait-online.service
Wants=network.target network-online.target systemd-networkd-wait-online.service

[Service]
ConfigurationDirectory=sing-box
ExecReload=/bin/kill -HUP $MAINPID
ExecStart=/usr/bin/sing-box -D ${STATE_DIRECTORY} -C ${CONFIGURATION_DIRECTORY} run
LimitNOFILE=infinity
LockPersonality=true
MemoryDenyWriteExecute=true
NoNewPrivileges=true
PrivateDevices=true
PrivateTmp=true
PrivateUsers=true
ProcSubset=pid
ProtectProc=noaccess
Restart=on-failure
RestartSec=10s
RestrictNamespaces=true
RestrictRealtime=true
StateDirectory=sing-box
SystemCallArchitectures=native
SystemCallFilter=@system-service

[Install]
WantedBy=default.target
```

## Enable unit

```shell
systemctl daemon-reload
systemctl --user enable --now sing-box.service
```
