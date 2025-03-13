# pam_u2f

> [!IMPORTANT]
> Tested only on macos

[pam-u2f](https://github.com/Yubico/pam-u2f)

```pam filename="/etc/pam.d/sudo_local"
# sudo_local: local config file which survives system update and is included for sudo
auth    optional    /opt/homebrew/lib/pam/pam_reattach.so
auth    sufficient  pam_tid.so
auth    sufficient  /opt/homebrew/lib/pam/pam_u2f.so cue
# auth    sufficient  /opt/homebrew/lib/pam/pam_u2f.so cue pinverification=1
```

# u2f_keys

```shell
pamu2fcfg >> "${XDG_CONFIG_HOME}/Yubico/u2f_keys"
```
