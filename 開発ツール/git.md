# Git & GitHub

## 参考资料

* [Pro Git](https://git-scm.com/book/zh/v2)
* [x]  [Learn Git Branching](https://learngitbranching.js.org/?locale=zh_CN)
    > `show solution`查看答案  
    > `reset`重置
* [try git](https://try.github.io)
* [x] [B站视频教程](https://www.bilibili.com/video/BV1tf4y1e7yt?p=1)
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
git status -s # --short的缩写
```

#### `add`

```bash
git add .
git add <文件名>
```

#### `rm`

```bash
git rm [<文件名> | 正则表达式]
git rm -f [<文件名> | 正则表达式]# Force
git rm --cached [<文件名> | 正则表达式] # 保留硬盘上的文件, 从git上删除
```

#### `mv`

```bash
git mv file_from file_to # 重命名文件
```

#### `commit`

```bash
git commit -m "描述信息"
git commit --amend
```

#### `reset`

```bash
git log
git reset --hard 版本号 # 回滚至之前的版本

git reflog
git reset --hard 版本号 # 回滚至之后的版本

git reset HEAD~1 # 回滚至HEAD的父提交
```

#### `restore`

```bash
git restore <file> # 和`git checkout -- <file>`同样效果
git restore --staged <file>
```

### Branching and Merging

#### `branch`

```bash
git branch # 查看分支
git branch --merged
git branch --no-merged

git branch <分支名> # 创建分支
git branch -d <分支名> # 删除分支
git branch -u origin/<分支名> <本地分支名>

git branch --move bad-branch-name corrected-branch-name # 重命名分支
```

#### `checkout`

```bash
git checkout <分支名> # 切换到分支
git checkout -b <分支名> # 创建分支同时切换过去
git checkout <tag> # 切换Tag
git checkout origin/<分支名> # 远程仓库的命名规范: <远程仓库名>/<分支名>
git checkout -b <本地分支名> origin/<分支名> # 在本地创建分支追踪远程的分支

git checkout -- <file> # 撤销修改, 丢失所有本地修改
```

#### `switch`

```bash
git switch <branch>
git switch -c <new-branch> # --create
git switch - # Return to previously checked out branch
```

#### `log`

```bash
git log
git log --status # 简要信息

git log -p -<n> # --patch, 最近n次的差异
git log --[since|until]=2.weeks # 可以使用相对日期(多少小时以前之类)和绝对日期
git log --[before|after]="2020-01-01" # 可以使用相对日期(多少小时以前之类)和绝对日期

git log --pretty=[oneline|short|full|fuller]
git log --pretty=format:"格式化字符串"
git log --pretty=format:"格式化字符串" --graph

git log -- path/to/file
```

| Specifier |   Description of Output   |
| :-------: | :-----------------------: |
|    %H     |        Commit Hash        |
|    %h     |  Abbreviated commit hash  |
|    %T     |         Tree hash         |
|    %t     |   Abbreviated tree hash   |
|    %P     |       Parent hashes       |
|    %p     | Abbreviated parent hashes |
|    %an    |        Author name        |
|    %ae    |       Author email        |
|    %ad    |        Author date        |
|    %ar    |   Author date, relative   |
|    %cn    |      Committer name       |
|    %ce    |      Committer email      |
|    %cd    |      Committer date       |
|    %cr    | Committer date, relative  |
|    %s     |          Subject          |

#### `merge`

```bash
git merge <分支名> # 合并分支
```

#### `tag`

> Tag并不会随着新的提交而移动。你也不能检出到某个标签上面进行修改提交，它就像是提交树上的一个锚点，标识了某个特定的位置

```bash
git tag # listing existing tags
git tag -l "v1.2.*" # 可以使用通配符

git tag <Tag名> [node] # 给node打tag,如果不提供node则使用HEAD指向的位置
git tag -a <Tag名> -m 'message' [node] # 创建本地Tag信息
git tag -d <Tag名> # 删除Tag

git push origin --tag # 将本地Tag信息推送到远程仓库
git pull origin --tag # 更新本地Tag版本信息

git show <Tag名>
```

#### `stash`

```bash
git stash           // create stash
git stash list          //list stash

git stash push -m "message" // create stash with msg

git stash apply         // to apply stash
git stash apply stash@{index} // to apply  specific stash

git stash drop stash@{index}      //to delete stash
# In Powershell, "{" and "}" need to be escaped with "`"

git stash pop
git stash pop stash@{index} //stash pop = stash drop + stash apply

git stash clear         //clear all your local stashed code
```

### Inspection and Comparison

#### `describe`

```bash
git describe <ref> # <ref> 可以是任何能被 Git 识别成提交记录的引用，如果你没有指定的话，Git 会以你目前所检出的位置（HEAD）

# 输出的结果是这样的：
#   <tag>_<numCommits>_g<hash>
#       * tag 表示的是离 ref 最近的标签
#       * numCommits 是表示这个 ref 与 tag 相差有多少个提交记录
#       * hash 表示的是你所给定的 ref 所表示的提交记录哈希值的前几位。
# 当 ref 提交记录上有某个标签时，则只输出标签名称
```

### Patching

#### `Rebase`

> Rebase 实际上就是取出一系列的提交记录，“复制”它们，然后在另外一个地方逐个的放下去  
> Rebase 的优势就是可以创造更线性的提交历史

```bash
git rebase <分支名> # 把当前分支的工作移到别的分支
git rebase -i HEAD~4 # 在交互式编辑(如vim, VSCode)中提交记录
# d, drop = remove commit
# x, exec = run command (the rest of the line) using shell
# f, fixup = like "squash", but discard this commit's log message
# s, squash = use commit, but meld into previous commit
# e, edit = use commit, but stop for amending
# r, reword = use commit, but edit the commit message
# p, pick = use commit

git rebase <基准分支名> <移动分支名> # 把移动分支名移动到基准分支名下
git rebase --onto master server client # 把从server开始分支出来的client移到master上
```

#### `revert`

```bash
git revert HEAD # 撤销HEAD的更改,复制HEAD的父节点并指向它, 针对远程仓库
```

#### `cherry-pick`

```bash
git cherry-pick <node的哈希值>...# 选取想复制的node, 直接复制到当前HEAD
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

#### 别名设置

```bash
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.last 'log -1 HEAD'
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

### 在树上移动

#### HEAD

> HEAD 是一个对当前检出记录的符号引用 —— 也就是指向你正在其基础上进行工作的提交记录。  
> HEAD 总是指向当前分支上最近一次提交记录。大多数修改提交树的 Git 命令都是从改变 HEAD 的指向开始的。  
> HEAD 通常情况下是指向分支名的（如 bugFix）。在你提交时，改变了 bugFix 的状态，这一变化通过 HEAD 变得可见。

```bash
cat .git/HEAD # 查看HEAD指向
git symbolic-ref HEAD # 如果HEAD指向一个引用,查看其指向
git checkout <node的哈希值> # 移动HEAD的指向
```

#### 相对引用

```bash
# 操作符 (^): 把这个符号加在引用名称的后面，表示让 Git 寻找指定提交记录的父提交
# 如果跟数字, 表示在两个父节点时的另一个
git checkout main^ # 移动到main的父节点
git checkout main^^ # 移动到main的第二个父节点

git checkout <node的哈希值>
git checkout HEAD^ # 将HEAD作为相对引用的参考


# 操作符(~): 该操作符后面可以跟一个数字（可选，不跟数字时与 ^ 相同，向上移动一次），指定向上移动多少次
git branch -f main HEAD~3 # 将 main 分支强制指向 HEAD 的第 3 级父提交

# `~`和`^`可以链式使用
```

### Sharing and Updating Projects

#### `fetch`

> git fetch 完成了仅有的但是很重要的两步:  
> 1.从远程仓库下载本地仓库中缺失的提交记录  
> 2.更新远程分支指针(如 origin/master)  
> `git fetch` 实际上将本地仓库中的远程分支更新成了远程仓库相应分支最新的状态。  
> `git fetch` 通常通过互联网（使用 http:// 或 git:// 协议)与远程仓库通信。  
> `git fetch` 并*不会*改变你本地仓库的状态。它*不会*更新你的 main 分支，*也不会*修改你磁盘上的文件。  
> 可以将 `git fetch` 的理解为单纯的下载操作

```bash
git fetch # 下载所有的提交记录到各个远程分支
git fetch origin <分支名>
git fetch origin <source>:<destination> # destination分支不存在时会创建
git fetch origin :<分支名> # 在本地创建一个新分支
```

#### `pull`

> `git pull` == `git fetch` + `git merge`

```bash
git pull
git pull --rebase # fetch+rebase
git pull origin <source>:<destination>
```

#### `push`

> `git push` 不带任何参数时的行为与 Git 的一个名为 `push.default` 的配置有关,它的默认值取决于你正使用的 Git 的版本

```bash
git push
git push <remote> <place>
git push origin <source>:<destination>
git push origin :<分支名> # 删除远程仓库中的分支

git branch --move master main # 重命名远程仓库的主分支名
git push --set-upstream origin main
git push origin --delete master
```

#### `remote`

```bash
git remote
git remote -v
git remote show origin
git remote rename name_from name_to
git remote remove <remote>
```

## Git Svn

### To clone repository from SVN

```bash
git svn clone "<URL>" --prefix=svn/ --trunk=trunk --branches=branches --tags=tags  --authors-file
```

### To pull in new commits from SVN

```bash
git stash
git svn rebase
git stash pop
```

### To ignore changes of something

```bash
git update-index --assume-unchanged db.sqlite3
```

### To push local commits into SVN

```bash
git svn dcommit
```

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
