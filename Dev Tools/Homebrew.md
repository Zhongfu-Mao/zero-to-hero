# Homebrew

[🔗官网(中文)](https://brew.sh/index_zh-cn)

## 命令

### 获取帮助

```zsh
$ brew help
Example usage:
  brew search TEXT|/REGEX/
  brew info [FORMULA|CASK...]
  brew install FORMULA|CASK...
  brew update
  brew upgrade [FORMULA|CASK...]
  brew uninstall FORMULA|CASK...
  brew list [FORMULA|CASK...]

Troubleshooting:
  brew config
  brew doctor
  brew install --verbose --debug FORMULA|CASK

Contributing:
  brew create URL [--no-fetch]
  brew edit [FORMULA|CASK...]

Further help:
  brew commands
  brew help [COMMAND]
  man brew
  https://docs.brew.sh
```

### 查询

```zsh
brew search <name>
```

这个命令和在官网上的[搜索页面](https://formulae.brew.sh/formula/)执行是一样效果的

实例:

```zsh
$ brew search "Python 3.10"
==> Formulae
python@3.10                   python-tk@3.10                python@3.9                    python@3.8 ✔                  python@3.7
```

```zsh
$ brew search google
==> Formulae
aws-google-auth               google-benchmark              google-java-format            google-sql-tool               googletest
google-authenticator-libpam   google-go ✔                   google-sparsehash             googler                       goose

==> Casks
homebrew/cask-versions/google-chrome-beta                                  homebrew/cask-versions/google-chrome-dev
homebrew/cask-versions/google-chrome-canary                                homebrew/cask-versions/google-japanese-ime-dev
```

搜索结果中,`Formulae`和`Casks`是不同的类型,`Formulae`一般是命令行工具,而`Casks`一般是一个软件的安装包

### 详情

```zsh
brew info <name>
```

实例:

```zsh
$ brew info node 
node: stable 17.3.0 (bottled), HEAD
Platform built on V8 to build network applications
https://nodejs.org/
Not installed
From: https://github.com/Homebrew/homebrew-core/blob/HEAD/Formula/node.rb
License: MIT
==> Dependencies
Build: pkg-config ✘, python@3.9 ✘
Required: brotli ✔, c-ares ✘, icu4c ✔, libnghttp2 ✔, libuv ✔, openssl@1.1 ✘
==> Options
--HEAD
        Install HEAD version
==> Analytics
install: 369,094 (30 days), 1,239,815 (90 days), 4,781,767 (365 days)
install-on-request: 310,689 (30 days), 1,015,683 (90 days), 3,773,452 (365 days)
build-error: 1,531 (30 days)
```

### 一览

```zsh
brew list
```

### 更新Homebrew自身和软件仓库

```zsh
brew update
```

### 更新

```zsh
brew upgrade [<name>]
```

### 清理

```zsh
brew cleanup
```

### 安装

```zsh
brew install [--cask] <name>
```
