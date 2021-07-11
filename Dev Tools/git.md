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

git add -i # 打开交互式子命令

git add -p # 直接进入交互命令中的patch模式
# y：接受修改
# n：忽略修改
# q：退出当前命令
# a：添加修改
# d：放弃修改
# /：通过正则表达式匹配修改内容
# ?：查看帮助信息

git add -u # 直接进入交互命令中的update模式
# 它会先列出工作区 修改 或 删除 的文件列表
# 新增 的文件不会被显示
# 在命令行 Update>> 后输入相应的列表序列号表示选中该项，回车继续选择
# 如果已选好，直接回车回到命令主界面

git add --ignore-removal . # 添加工作区 修改 或 新增 的文件列表， 删除 的文件不会被添加
```

#### `rm`

```bash
git rm [<文件名> | 正则表达式] # 从工作区和暂存区移除文件同时添加变动到暂存区
git rm -f [<文件名> | 正则表达式]# Force
git rm --cached [<文件名> | 正则表达式] # 保留硬盘上的文件, 从git上删除
```

#### `mv`

```bash
git mv file_from file_to [-f] # 重命名文件
```

#### `commit`

```bash
git commit -m "描述信息"
git commit -m '第一行提交原因'  -m '第二行提交原因' # 多行
git commit --amend //rewrite commit message without staging
git commit --amend -m '提交原因'
git commit --amend --no-edit
git commit -C HEAD # 提交到HEAD
```

#### `reset`

```bash
git log
git reset --hard <commit> # 回滚至之前的版本
# 自从 <commit> 以来在工作区中的任何改变都被丢弃，并把 HEAD 指向 <commit>
git reset --soft <commit>
# 暂存区和工作区中的内容不作任何改变，仅仅把 HEAD 指向 <commit>
git reset --mixed <commit>
# --mixed 是不带参数时的默认参数，它退回到某个版本，保留文件内容，回退提交历史

git reflog
# 可以查看所有分支的所有操作记录（包括commit和reset的操作、已经被删除的commit记录
# 跟 git log 的区别在于它不能查看已经删除了的commit记录
git reset --hard 版本号 # 回滚至之后的版本

git reset HEAD~1 # 回滚至HEAD的父提交, can be applied to undo Merges
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
git branch -a # 查看本地版本库和远程版本库上的分支列表
git branch -r # 查看远程版本库上的分支列表，加上 -d 参数可以删除远程版本库上的分支
git branch -vv # 查看带有最后提交id、最近提交原因等信息的本地版本库分支列表

git branch --merged
git branch --no-merged

git branch <分支名> # 创建分支
git branch -d <分支名> # 删除分支
git branch -D <分支名> # 强制删除
git branch -u origin/<分支名> <本地分支名>

git branch --move | -m bad-branch-name corrected-branch-name # 重命名分支
```

#### `checkout`

```bash
git checkout <分支名> # 切换到分支

git checkout -b <分支名> # 创建分支同时切换过去
git checkout --orphan <分支名>
# 创建一个全新的，完全没有历史记录的新分支，但当前源分支上所有的最新文件都还在
# 但这个新分支必须做一次 git commit 操作后才会真正成为一个新分支

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
git log <ID>..[HEAD | ID] # 从提交ID到HEAD或其他提交ID之间的记录

git log --pretty=[oneline|short|full|fuller]
git log --pretty=format:"格式化字符串"
git log --pretty=format:"格式化字符串" --graph

git log -- path/to/file

git log -S <searchTarget> --one-line
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

git merge --squash
# 将待合并分支上的 commit 合并成一个新的 commit 放入当前分支
# 适用于待合并分支的提交记录不需要保留的情况

git merge --no-ff
# 默认情况下，Git 执行"快进式合并"（fast-farward merge）会直接将 Master 分支指向 Develop 分支
# 使用 --no-ff 参数后，会执行正常合并，在 Master 分支上生成一个新节点，保证版本演进更清晰

git merge --no-edit
# 在没有冲突的情况下合并，不想手动编辑提交原因，而是用 Git 自动生成的类似 Merge branch 'test' 的文字直接提交
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
git stash           # 将未提交的文件保存到Git栈中
git stash list      # 查看栈中保存的列表
git stash show stash@{0} # 显示栈中其中一条记录

git stash push -m "message"

git stash apply
git stash apply stash@{index} # 从Git栈中检出其中一条记录，但不从栈中移除

git stash drop stash@{index}      # 移除栈中其中一条记录
# In Powershell, "{" and "}" need to be escaped with "`"

git stash pop
git stash pop stash@{index} # stash pop = stash drop + stash apply

git stash clear  # 清空栈里的所有记录

git stash branch <newBranchName> # 把当前栈中最近一次记录检出并创建一个新分支

git stash create # 为当前修改或删除的文件创建一个自定义的栈并返回一个ID，此时并未真正存储到栈里

git stash store <ID>
# 将 create 方法里返回的ID放到 store 后面，此时在栈里真正创建了一个记录，但当前修改或删除的文件并未从工作区移除
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
# p, pick <commit> = use commit
# r, reword <commit> = use commit, but edit the commit message
# e, edit <commit> = use commit, but stop for amending
# s, squash <commit> = use commit, but meld into previous commit
# f, fixup <commit> = like "squash", but discard this commit's log message
# x, exec <command> = run command (the rest of the line) using shell
# b, break = stop here (continue rebase later with 'git rebase --continue')
# d, drop <commit> = remove commit
# l, label <label> = label current HEAD with a name
# t, reset <label> = reset HEAD to a label
# m, merge [-C <commit> | -c <commit>] <label> [# <oneline>]

git rebase <基准分支名> <移动分支名> # 把移动分支名移动到基准分支名下
git rebase --onto master server client # 把从server开始分支出来的client移到master上
```

#### `revert`

```bash
# 撤销某次操作，此次操作之前和之后的 commit 和 history 都会保留，并且把这次撤销作为一次最新的提交
git revert HEAD # 撤销前一次提交操作

git revert HEAD --no-edit # 撤销前一次提交操作，并以默认的 Revert "xxx" 为提交原因

git revert -n HEAD
# 需要撤销多次操作的时候加 -n 参数，这样不会每次撤销操作都提交，而是等所有撤销都完成后一起提交
```

#### `cherry-pick`

```bash
git cherry-pick <node的哈希值>...# 选取想复制的node, 直接复制到当前HEAD
```

### Administration

#### `archive`

```bash
# 将加了tag的某个版本打包提取
git archive -v --format=zip v0.1 > v0.1.zip
# --format 表示打包的格式，如 zip
# -v 表示对应的tag名，后面跟的是tag名
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
