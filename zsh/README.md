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
