# Poetry

> Poetry is a tool for **dependency management and packaging** in Python.  
> It allows you to declare the libraries your project depends on and it will manage (install/update) them for you.

[🔗官网](https://python-poetry.org/)

## 安装

```zsh
# 安装 poetry
curl -sSL https://install.python-poetry.org | python3 -
# 写入环境变量
vim ~/.zshrc
export PATH="/Users/<username>/.local/bin:$PATH"
source ~/.zshrc
```

## 使用

[🔗CLI命令](https://python-poetry.org/docs/master/cli/)

### 获取帮助

```zsh
$ poetry [--help] # 有没有`--help`效果一样的
Poetry version 1.1.12

USAGE
  poetry [-h] [-q] [-v [<...>]] [-V] [--ansi] [--no-ansi] [-n] <command> [<arg1>] ... [<argN>]

ARGUMENTS
  <command>              The command to execute
  <arg>                  The arguments of the command

GLOBAL OPTIONS
  -h (--help)            Display this help message
  -q (--quiet)           Do not output any message
  -v (--verbose)         Increase the verbosity of messages: "-v" for normal output, "-vv" for more verbose output and "-vvv" for debug
  -V (--version)         Display this application version
  --ansi                 Force ANSI output
  --no-ansi              Disable ANSI output
  -n (--no-interaction)  Do not ask any interactive question

AVAILABLE COMMANDS
  about                  Shows information about Poetry.
  add                    Adds a new dependency to pyproject.toml.
  build                  Builds a package, as a tarball and a wheel by default.
  cache                  Interact with Poetry's cache
  check                  Checks the validity of the pyproject.toml file.
  config                 Manages configuration settings.
  debug                  Debug various elements of Poetry.
  env                    Interact with Poetry's project environments.
  export                 Exports the lock file to alternative formats.
  help                   Display the manual of a command
  init                   Creates a basic pyproject.toml file in the current directory.
  install                Installs the project dependencies.
  lock                   Locks the project dependencies.
  new                    Creates a new Python project at <path>.
  publish                Publishes a package to a remote repository.
  remove                 Removes a package from the project dependencies.
  run                    Runs a command in the appropriate environment.
  search                 Searches for packages on remote repositories.
  self                   Interact with Poetry directly.
  shell                  Spawns a shell within the virtual environment.
  show                   Shows information about packages.
  update                 Update the dependencies as according to the pyproject.toml file.
  version                Shows the version of the project or bumps it when a valid bump rule is provided.
```

### 创建新项目

#### 无选项

```zsh
$ poetry new my-package
Created package my_package in my-package

$ tree
.
└── my-package
    ├── README.rst
    ├── my_package
    │   └── __init__.py
    ├── pyproject.toml
    └── tests
        ├── __init__.py
        └── test_my_package.py

3 directories, 5 files
```

#### `--name`选项

```zsh
$ poetry new my-folder --name my-package
Created package my_package in my-folder

$ tree
.
└── my-folder
    ├── README.rst
    ├── my_package
    │   └── __init__.py
    ├── pyproject.toml
    └── tests
        ├── __init__.py
        └── test_my_package.py

3 directories, 5 files
```

#### `--src`选项

```zsh
$ poetry new --src my-package
Created package my_package in my-package

$ tree
.
└── my-package
    ├── README.rst
    ├── pyproject.toml
    ├── src
    │   └── my_package
    │       └── __init__.py
    └── tests
        ├── __init__.py
        └── test_my_package.py

4 directories, 5 files
```

### 已有项目

```zsh
cd pre-existing-project
poetry init
```

### 添加依赖

```zsh
poetry add <package-name>
```

### 安装依赖

```zsh
poetry install
```

#### `--with`, `--without`, `--only`选项

```zsh
poetry install --with <group-name>
poetry install --without <group-name>
poetry install --only <group-name>
```

### 升级依赖

```zsh
poetry update [<package-name>...]
```

### 移除依赖

```zsh
poetry remove <package-name> [--group <group-name>]
```

### 显示依赖

```zsh
poetry show [<package-name>]
```

### 设置配置

```zsh
poetry config <key> <value>
poetry config --list
```

### 导出锁定文件

```zsh
poetry export -f requirements.txt --output requirements.txt
```

## 升级poetry自身

```zsh
poetry self update <major.minor.patch>
```

## 卸载

```zsh
curl -sSL https://install.python-poetry.org | python3 - --uninstall
curl -sSL https://install.python-poetry.org | POETRY_UNINSTALL=1 python3 -
```

## 关闭自动创建虚拟环境

```zsh
poetry config virtualenvs.create false
```

## pyproject.toml

[🔗文档](https://python-poetry.org/docs/master/pyproject/)
