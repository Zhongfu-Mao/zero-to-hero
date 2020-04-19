# 《Python Linux 系统管理与自动化运维》读书笔记

## Python内置的小工具

### 下载服务器

```bash
python -m http.server
```

> 从工作原理来说，仅仅是启动了一个Python内置的Web服务器。
> 如果当前目录下存在一个名为index.html的文件，则默认显示该文件的内容。
> 如果当前目录下不存在这样一个文件，则默认显示当前目录下的文件列表。

### 字符串转换为JSON

```bash
echo '要解析的字符串' | python -m json.tool
```

### pip高级用法

#### pip子命令

* install: 安装软件包
* download: 下载软件包
* uninstall: 卸载软件包
* freeze: 按照`requirements`格式输出安装包,可以到其他服务器上执行`pip install -r requirements.txt`直接安装

```bash
pip freeze > requirement.txt
```

* list: 列出当前系统中的安装包
* show: 查看安装包的信息,包括版本,依赖,许可证,作者,主页等信息
* check: 检查安装包的依赖是否完整
* search: 查找安装包
* wheel: 打包软件为wheel格式
* hash: 计算安装包的hash值
* completion: 生成命令补全配置
* help: 获取帮助信息

#### 将软件下载到本地部署

```bash
pip install --download='pwd' -r requirements.txt
pip install --no-index -f file://'pwd' -r requirements.txt
```

### IPython

#### IPython提供的使用说明

* ?: 介绍IPython的特征
* %quickref: IPython的使用手册
* help: Python内置的帮助系统
* object? / object??: 获取Python对象的信息,如帮助信息,对象定义,对象原码等

#### 魔法函数

* `%lsmagic`
* `%函数名?`

#### 保存历史

* _i, _ii, _iii分别保存了最近的三次输入；
* _, __, ___分别保存了最近的三次输出；
* 可以像Bash一样，通过ctrl+p, ctrl+n查找输入；
* 可以像Bash一样，使用ctrl+r进行反向查找；
* IPython的输入历史在当前会话退出以后会进行持久化，下一次进入IPython时，依然可以查找前一次会话的输入历史；
* %edit: IPython可以通过%edit编辑历史输入并重新执行；
* %save: IPython可以通过%save将IPython中的代码保存到程序文件中；
* %rerun: IPython可以指定代码行数重新运行；
* %macro: IPython可以将重新运行的代码定义为宏，这样可以反复重新运行。

#### 与操作系统交互

* `%ls`
* `%pwd`
* `! Linux命令`

### 代码规范检查-`autopep8`

```bash
autopep8 [--in-place] 文件名
```

### 工作环境管理

#### pyenv

```bash
pyenv install --list # 查看支持的版本
pyenv install -v 版本号 # 安装指定的版本
pyenv versions # 查看当前系统中包含的Python版本
pyenv global 版本号 # 切换版本
pyenv uninstall 版本号
```

#### virtualenv

```bash
pyenv virtualenv [-f|--force] [VIRTUALENV_OPTIONS] [version] <virtualenv-name>
pyenv activate <virtualenv-name>
pyenv deactivate
```

## 打造命令行工具
