# Compile zsh functions and scripts

## zcompile wrapper
```shell
function zcompile-many() {
  local f
  for f; do zcompile -R -- "$f".zwc "$f"; done
}
```

## Safe optimizations
```shell
zcompile-many ${ZDOTDIR}/.zcompdump
zcompile-many ${ZDOTDIR}/.zshenv*
zcompile-many ${ZDOTDIR}/.zshrc*
zcompile-many ${ZDOTDIR}/.zprofile*
zcompile-many ${ZDOTDIR}/.zlogin*
zcompile-many ${ZDOTDIR}/.zlogout*
zcompile-many ${ZDOTDIR}/plugins/zsh-autosuggestions/{zsh-autosuggestions.zsh,src/**/*.zsh}
```

## Unsafe optimizations
```shell
zcompile-many ${ZDOTDIR}/plugins/zsh-syntax-highlighting/{zsh-syntax-highlighting.zsh,highlighters/*/*.zsh}
# causes: [bat error]: invalid digit found in string
```

# Extensions

Each rc file has extensions `.*.before` and `.*.after` sourcing, e.g. `.zshrc.after`:

```shell
function yubikey_opensc {
	ssh-add -e /usr/local/lib/opensc-pkcs11.so
	security find-generic-password -a $USER -s yubikey -w | \
		sshpass -P 'Enter passphrase for PKCS#11:' \
			ssh-add -s /usr/local/lib/opensc-pkcs11.so
}

function yubikey_libyk {
	ssh-add -e /usr/local/lib/libykcs11.dylib
	security find-generic-password -a $USER -s yubikey -w | \
		sshpass -P 'Enter passphrase for PKCS#11:' \
			ssh-add -s /usr/local/lib/libykcs11.dylib
}

function yubikey_opt_toogle {
	action=$((ykman config usb --list | grep OTP) 2>&1 >/dev/null && echo '--disable' || echo '--enable')
	yes | ykman config usb $action OTP
}
```

This is a place for per-system customization and sensitive data (everything, that should not be in git)
