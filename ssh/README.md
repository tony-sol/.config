# SSH default configs

## Copy identity for sshd

```shell
cat ./keys/id_ed25519.pub >> ~/.ssh/authorized_keys
```

## Trust ssh key for git sign

```shell
echo "$(git config --get user.email) namespaces=\"git\" $(cat ~/.ssh/keys/id_ed25519.pub)" >> ~/.ssh/allowed_signers
```

## Add pkcs11 into ssh-agent keychain

```shell
ssh-add -s /usr/local/lib/opensc-pkcs11.so
```

## Conditional host resolving

```ssh_config
Match Host acme-?? exec "nc -w 1 -z %h.local %p"
# Use `(Test-NetConnection -ComputerName %h.local -Port %p).TcpTestSucceeded` in pwsh
	Hostname %h.local
Match Host acme-?? !exec "nc -w 1 -z %h.local %p"
	Hostname %h.global
Match Host acme-??,acme-??.local,acme-??.global
	IdentityFile ~/.ssh/keys/acme
```
