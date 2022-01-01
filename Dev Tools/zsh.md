# zsh

## Oh My Zsh

[🔗GitHub Homepage](https://github.com/ohmyzsh/ohmyzsh)

### Plugins

* [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
* [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
* [incr](https://mimosa-pudica.net/zsh-incremental.html)
  * install steps:

  ```zsh
  brew install wget
  wget http://mimosa-pudica.net/src/incr-0.2.zsh
  mkdir ~/.oh-my-zsh/plugins/incr
  mv incr-0.2.zsh ~/.oh-my-zsh/plugins/incr
  echo 'source ~/.oh-my-zsh/plugins/incr/incr*.zsh' >> ~/.zshrc
  source ~/.zshrc
  ```

### Random Themes

```config
ZSH_THEME="random"
```

### Tips

#### Disable Mouse Scroll To Look Through Input History

> Comment out line `echoti smkx` in `~/.oh-my-zsh/lib/key-bindings` (Line 9)
