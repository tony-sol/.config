# SSH default configs

## Copy identity for sshd

```shell
cat ./id_ed25519.pub >> ~/.ssh/authorized_keys
```

## Trust ssh key for git sign

```shell
echo "$(git config --get user.email) namespaces=\"git\" $(cat ~/.ssh/keys/id_ed25519.pub)" >> ~/.ssh/allowed_signers
```

## Add pkcs11 into ssh-agent keychain

```shell
ssh-add -s /usr/local/lib/opensc-pkcs11.so
```
