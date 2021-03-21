# Git & GitHub

## 参考资料

* [Pro Git](https://git-scm.com/book/zh/v2)
* [Learn Git Branching](https://learngitbranching.js.org/?locale=zh_CN)
* [try git](https://try.github.io)
* [B站视频教程](https://www.bilibili.com/video/BV1tf4y1e7yt?p=1)
* [官方文档](https://git-scm.com/docs)

## Git

![Cheat Sheet](https://qph.fs.quoracdn.net/main-qimg-be0c4389a44fea9757d650d578252164)

### 版本控制软件的发展

* 文件夹拷贝
* 本地版本控制
* 集中式版本控制
* 分布式版本控制

### Getting and Creating Projects

#### `init`

```bash
git init
```

#### `clone`

```bash
git clone <远程仓库地址>
git clone -b <Tag名> <地址> # 指定Tag下载代码
```

### Basic Snapshotting

#### `status`

```bash
git status
```

#### `add`

```bash
git add .
git add <文件名>
```

#### `commit`

```bash
git commit -m "描述信息"
```

#### `reset`

```bash
git log
git reset --hard 版本号 # 回滚至之前的版本

git reflog
git reset --hard 版本号 # 回滚至之后的版本
```

### Branching and Merging

#### `branch`

```bash
git branch # 查看分支
git branch <分支名> # 创建分支
git branch -d <分支名> # 删除分支
```

#### `checkout`

```bash
git checkout <分支名> # 切换到分支
git checkout -b <分支名> # 创建分支同时切换过去
git checkout <tag> # 切换Tag
```

#### `log`

```bash
git log
```

#### `merge`

```bash
git merge <分支名> # 合并分支
```

### `tag`

```bash
git tag -a <Tag名> -m 'message' # 创建本地Tag信息
git tag -d <Tag名> # 删除Tag
git push origin --tag # 将本地Tag信息推送到远程仓库
git pull origin --tag # 更新本地Tag版本信息
```

### Patching

#### `Rebase`

> Rebase 实际上就是取出一系列的提交记录，“复制”它们，然后在另外一个地方逐个的放下去  
> Rebase 的优势就是可以创造更线性的提交历史

```bash
git rebase <分支名> # 把当前分支的工作移到别的分支
```

### Config

#### VS CodeをGitのeditorにする

```bash
git config --global core.editor "code --wait"
git config --global -e
```

```conf
[diff]
    tool = default-difftool
[difftool "default-difftool"]
    cmd = code --wait --diff $LOCAL $REMOTE
[merge]
    tool = code
```

#### 个人信息配置

```bash
# 项目配置文件: 项目/.git/.gitconfig
git config --local user.email "for@example.com"
git config --local user.name "Your Name"

# 全局配置文件: ~/.gitconfig
git config --global user.email "for@example.com"
git config --global user.name "Your Name"

# 系统配置文件: /etc/.gitconfig
git config --system user.email "for@example.com"
git config --system user.name "Your Name"
```

### 免密码登陆

#### URL中体现

```bash
git remote add origin https://user:password@仓库地址
git push origin master
```

#### SSH实现

```bash
ssh-keygen # 生成公钥和私钥(默认放在`~/.ssh`目录下, `id_rsa.pub`公钥, `id_rsa`私钥)
# 拷贝公钥的内容, 设置到GitHub
git remote add origin git@github.com:地址 # 在本地设置ssh地址
git push origin master
```

### `.gitignore`

#### `.gitignore`をグローバル設定

##### MacOS

```bash
touch ~/.gitignore_global
vim ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
```

#### 格式

```bash
*.h
!foo.h
files/
*.py[c|a|d]
```

[各种语言的参考](https://github.com/github/gitignore)

### 高级内容

#### HEAD

> HEAD 是一个对当前检出记录的符号引用 —— 也就是指向你正在其基础上进行工作的提交记录。  
> HEAD 总是指向当前分支上最近一次提交记录。大多数修改提交树的 Git 命令都是从改变 HEAD 的指向开始的。  
> HEAD 通常情况下是指向分支名的（如 bugFix）。在你提交时，改变了 bugFix 的状态，这一变化通过 HEAD 变得可见。

* 查看HEAD指向: `cat .git/HEAD`
* 如果HEAD指向一个引用,查看其指向: `git symbolic-ref HEAD`

## GitHub

### 上传

```bash
git remote add origin 远程仓库地址 # 给远程仓库起别名
git push -u origin 分支 # 向远程仓库推送代码
```

### 下载

```bash
git clone 远程仓库地址 # 第一次的时候
git checkout 分支
git pull origin 分支 # 拉取代码 等价于`git fetch origin 分支; git merge origin 分支`
```
