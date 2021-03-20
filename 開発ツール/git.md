# Git & GitHub

## 参考资料

* [Pro Git](https://git-scm.com/book/zh/v2)
* [Learn Git Branching](https://learngitbranching.js.org/?locale=zh_CN)
* [try git](https://try.github.io)
* [B站视频教程](https://www.bilibili.com/video/BV1tf4y1e7yt?p=1)
* [官方文档](https://git-scm.com/docs)

## Git

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

### Config

#### `.gitignore`をグローバル設定

##### MacOS

```bash
touch ~/.gitignore_global
vim ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
```

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
git config --global user.email "for@example.com"
git config --global user.name "Your Name"
```

### Branching and Merging

#### `branch`

```bash
git branch <分支名> # 创建分支
```

#### `checkout`

```bash
git checkout <分支名> # 切换到分支
git checkout -b <分支名> # 创建分支同时切换过去
```

#### `log`

```bash
git log
```

#### `merge`

```bash
git merge <分支名> # 合并分支
```

### Patching

#### `Rebase`

> Rebase 实际上就是取出一系列的提交记录，“复制”它们，然后在另外一个地方逐个的放下去  
> Rebase 的优势就是可以创造更线性的提交历史

```bash
git rebase <分支名> # 把当前分支的工作移到别的分支
```

### 高级内容

#### HEAD

> HEAD 是一个对当前检出记录的符号引用 —— 也就是指向你正在其基础上进行工作的提交记录。  
> HEAD 总是指向当前分支上最近一次提交记录。大多数修改提交树的 Git 命令都是从改变 HEAD 的指向开始的。  
> HEAD 通常情况下是指向分支名的（如 bugFix）。在你提交时，改变了 bugFix 的状态，这一变化通过 HEAD 变得可见。

* 查看HEAD指向: `cat .git/HEAD`
* 如果HEAD指向一个引用,查看其指向: `git symbolic-ref HEAD`
