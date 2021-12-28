# Git相关的知识总结

## 参考资料

* [Pro Git](https://git-scm.com/book/zh/v2)
* [x]  [Learn Git Branching](https://learngitbranching.js.org/?locale=zh_CN)
    > `show solution`查看答案  
    > `reset`重置
* [try git](https://try.github.io)
* [x] [B站视频教程](https://www.bilibili.com/video/BV1tf4y1e7yt?p=1)
* [官方文档](https://git-scm.com/docs)

## 基础知识

### 版本控制软件的发展

* 文件夹拷贝
* 本地版本控制
* 集中式版本控制(Centralized Version Control System)
* 分布式版本控制(Distributed Version Control System)

### Git VS SVN

[git与svn的区别 - SegmentFault 思否](https://segmentfault.com/a/1190000006846175?utm_source=sf-similar-article)

[一篇搞懂Git 和 SVN 的区别【原理篇】 - SegmentFault 思否](https://segmentfault.com/a/1190000039978493)

![Storing data as changes to a base version of each file](https://git-scm.com/book/en/v2/images/deltas.png)

![Git stores data as snapshots of the project over time](https://git-scm.com/book/en/v2/images/snapshots.png)

## Config

### 把VS Code设置为Git的编辑器

```bash
git config --global core.editor "code --wait"

git config --global -e # 打开设置文件
```

添加如下内容,设置VSCode为Git的合并比较工具:

```conf
[diff]
    tool = default-difftool
[difftool "default-difftool"]
    cmd = code --wait --diff $LOCAL $REMOTE
[merge]
    tool = code
```

### 个人信息配置

```bash
# 项目配置文件,只针对当前项目: 项目/.git/.gitconfig
git config --local user.email "for@example.com"
git config --local user.name "Your Name"

# 全局配置文件,只针对当前用户: ~/.gitconfig
git config --global user.email "for@example.com"
git config --global user.name "Your Name"

# 系统配置文件,包含系统上每一个用户及他们仓库的通用配置: /etc/.gitconfig
git config --system user.email "for@example.com"
git config --system user.name "Your Name"
```

### 查看设置

```bash
git config --list --system
git config --list --global
git config --list --local
# `git config`默认是local
```

### 提交模板

```bash
git config --global commit.template <path_to_file> # exp: $HOME/.gitcommitmsg.txt
```

When Git creates a new repository, either via init or clone, it will copy the files from the template directory (the default location is `/usr/share/gitcore/templates`) to the new repository when creating the directory structure.

The template directory can be defined either by a command-line argument, an environment variable, or a configuration option. If nothing is specified, the default template directory will be used

### 别名设置

```bash
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.last 'log -1 HEAD'
git config --global alias.unstage 'reset HEAD --'

git config --global alias.graph "log --all --graph -pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ci) %C(boldblue)<%an>%Creset'"

git config --global alias.ll "log --pretty=format:'%C(yellow)%h%Cred%d %Creset%s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --numstat"

# To create an alias method with an external command, the alias must start with an exclamation mark !.
```

### rebase和merge设置

```bash
git config pull.rebase true # 默认值是false
# This configuration, when set to true, will pull to rebase the current branch on top of the fetched one when performing a git pull

git config branch.autosetuprebase always # 默认值是never
# When this configuration is set to always, any new branch created with <git branch or git checkout that tracks another branch will be set up to pull to rebase (instead of merge). 
# The valid options are as follows: 
#  never: This is set to pull to rebase (default) 
#  local: This is set to pull to rebase for local tracked branches 
#  remote: This is set to pull to rebase for remote tracked branches 
#  always: This is set to pull to rebase for all tracked branches 

git config branch.<name>.rebase true
# This configuration, when set to true, applies only to the <name> branch and tells Git to pull to rebase when performing git pull on the given branch
```

### 垃圾回收

```bash
# gc.reflogExpire
# gc.<pattern>.reflogExpire

git config --global gc.reflogExpire 180.days.ago
git config --global gc.reflogExpire never
```

> `git reflog` expire removes reflog entries older than this time; defaults to 90 days.
> The value "`now`" expires all entries immediately, and "`never`" suppresses expiration altogether.
>
> With "`<pattern>`" (e.g. "`refs/stash`") in the middle the setting applies only to the refs that match the `<pattern>`.

```bash
# gc.reflogexpireunreachable
git config gc./refs/remote/*.reflogexpireunreachable "2 months"

# gc.pruneexpire
```

### 自动更正

```bash
git config help.autocorrect 5
# By setting the configuration to help.autocorrect, you can control how Git will behave when you accidentally send a typo to it. 
# By default, the value is 0 and it means to list the possible options similar to the input (if statisis given, status will be shown). 
# A negative value means to immediately execute the corresponding command. 
# A positive value means to wait the given number of deciseconds (0.1 sec) before running the command (so there is an amount of time in which to cancel it).
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

## Git CLI

![Cheat Sheet](https://qph.fs.quoracdn.net/main-qimg-be0c4389a44fea9757d650d578252164)

### Getting and Creating Projects

#### `init`

```bash
git init

git init --bare <repo> 
# 从裸仓库 clone 下来的本地仓库可以进行正常的 push 操作， 但是从一般仓库 clone 下来的本地仓库却不行。 这也正是裸仓库存在的意义。
# 裸仓库一般情况下是作为远端的中心仓库而存在的。
```

#### `clone`

```bash
git clone <远程仓库地址> [<本地仓库名>]

git clone -b <Tag名> <地址> # 指定Tag下载代码
```

### Basic Snapshotting

#### `status`

```bash
git status
git status -s # --short的缩写

git status --ignored --short --branch
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

#### `diff`

> git diff 本身只显示尚未暂存的改动，而不是自上次提交以来所做的所有改动。

```bash
git diff # 比较暂存区和工作区
git diff --staged [<path>...] # 比较暂存区和最新本地版本库
git diff HEAD [<path>...] # 比较工作区和最新本地版本库,如果HEAD指向的是master分支，那么HEAD还可以换成master
git diff <commit-id> [<path>...] # 比较工作区和指定commit-id的差异
git diff --staged <commit-id> [<path>...] # 比较暂存区和指定commit-id的差异

git diff <commit-id> <commit-id> # 比较两个commit-id之间的差异

git diff <branch1> <branch2> # 显示两个分支之间所有有差异的文件的详细差异
git diff <branch1> <branch2> --stat # 显示两个分支之间所有有差异的文件列表
git diff <branch1> <branch2> <file> # 显示指定文件的详细差异
```

#### `rm`

```bash
git rm [<文件名> | 正则表达式] # 从工作区和暂存区移除文件同时添加变动到暂存区
git rm -f [<文件名> | 正则表达式] # Force
git rm -r [<文件夹名> | 正则表达式] # 非空文件夹
git rm --cached [<文件名> | 正则表达式] # 保留硬盘上的文件, 从git上删除
```

#### `mv`

```bash
git mv file_from file_to [-f] # 重命名文件
```

#### `commit`

```bash
git commit -m "描述信息"
git commit -m -a "描述信息" # 跳过`git add`
git commit -m '第一行提交原因'  -m '第二行提交原因' # 多行

git commit --amend # 如果自上次提交以来还未做任何修改,那么快照会保持不变只修改提交信息
git commit --amend -m '提交原因'
git commit --amend --no-edit
git commit --amend --reset-author
# The --amend option to git commit is roughly equivalent to performing `git reset --soft HEAD^`, followed by fixing the files needed and adding those to the staging area.

git commit -C HEAD # 提交到HEAD

git commit --allow-empty
```

#### `notes`

> A Git note is essentially an extra `refs/notes/commits` reference in Git

```bash
git notes add -m "Note1" < HEAD | hash>

git notes list
git notes show <hash>
```

#### `reset`

> 不加选项地调用 `git reset` 并不危险 — 它只会修改暂存区域

```bash
git log
git reset --hard <commit> # 回滚至之前的版本
# 自从 <commit> 以来在工作区中的任何改变都被丢弃，并把 HEAD 指向 <commit>
git reset --hard HEAD^ # 回滚一次提交
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
git branch -vv # 查看设置的所有跟踪分支,这会将所有的本地分支列出来并且包含更多的信息，如每一个分支正在跟踪哪个远程分支与本地分支是否是领先、落后或是都有

git branch --merged # 查看哪些分支已经合并到当前分支
git branch --no-merged # 查看所有包含未合并工作的分支

git branch <分支名> # 创建分支
git branch -d <分支名> # 删除分支
git branch -D <分支名> # 强制删除

git branch -u origin/<分支名> <本地分支名> # --set-upstream-to
# 设置已有的本地分支跟踪一个刚刚拉取下来的远程分支，或者想要修改正在跟踪的上游分支
# 当设置好跟踪分支后，可以通过 @{upstream} 或 @{u} 快捷方式来引用它。
# 所以在 master 分支时并且它正在跟踪 origin/master 时，如果愿意的话可以使用 git merge @{u} 来取代 git merge origin/master。

git branch --move | -m bad-branch-name corrected-branch-name # 重命名分支

git branch --edit-description <description>
# 用`git config --get branch.<branch_name> description`来获取分支描述

git branch --contains <commit_hash>
```

#### `checkout`

```bash
git checkout <分支名> # 切换到分支

git checkout -b <分支名> # 创建分支同时切换过去
git checkout -b <分支名> <指向对象> # 指向对象可以是分支名也可以是Hash值
git checkout --orphan <分支名>
# 创建一个全新的，完全没有历史记录的新分支，但当前源分支上所有的最新文件都还在
# 但这个新分支必须做一次 git commit 操作后才会真正成为一个新分支

git checkout <tag> # 切换Tag
git checkout origin/<分支名> # 远程仓库的命名规范: <远程仓库名>/<分支名>
git checkout -b <本地分支名> --track origin/<分支名> # 在本地创建分支追踪远程的分支

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

git log -- path/to/folder/or/file # 任何`--`之后的字符串都被当做文件名,之前的字符串被当做分支或其他选项
git log -- '*.py'

git log -S <searchTarget> --one-line

git log --oneline --graph --decorate --all # 打印提交图

git log master..experiment # 查看 experiment 分支中还有哪些提交尚未被合并入 master 分支
git log origin/master..HEAD # 查看在当前分支中而不在远程 origin 中的提交

git log -1 --dirstat
git log -1 --dirstat=lines
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

git merge <branch_name> --no-ff --edit --quiet
#  use the --quiet flag to minimize the output and --edit to allow us to edit the commit message
```

#### `tag`

> Tag并不会随着新的提交而移动。你也不能检出到某个标签上面进行修改提交，它就像是提交树上的一个锚点，标识了某个特定的位置

Git 使用两种主要类型的标签：轻量标签（lightweight）与附注标签（annotated）。

* 一个轻量标签很像一个不会改变的分支 - 它只是一个特定提交的引用。
* 附注标签是存储在 Git 数据库中的一个完整对象。 它们是可以被校验的；其中包含打标签者的名字、电子邮件地址、日期时间；还有一个标签信息；并且可以使用 GNU Privacy Guard （GPG）签名与验证。
* 通常建议创建附注标签，这样可以拥有以上所有信息；但是如果只是想用一个临时的标签，或者因为某些原因不想要保存那些信息，轻量标签也是可用的。

```bash
git tag # listing existing tags
git tag -l "v1.2.*" # 可以使用通配符

git tag <Tag名> [node] # 创建轻量标签,如果不提供node则使用HEAD指向的位置
git tag -a <Tag名> -m 'message' [node] # --annotate, 创建附注标签
git tag -d <Tag名> # 删除Tag

git push origin --tags # 将本地Tag信息推送到远程仓库
git pull origin --tags # 更新本地Tag版本信息

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

#### `shortlog`

```bash
git shortlog -5
git shortlog --numbered --summary --email --all
```

### Patching

#### `rebase`

> rebase 实际上就是取出一系列的提交记录，“复制”它们，然后在另外一个地方逐个的放下去
> rebase 的优势就是可以创造更线性的提交历史

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
git rebase --interactive --exec "git commit --amend --reset-author"
git rebase -i --autosquash

git rebase <基准分支名> <移动分支名> # 把移动分支名移动到基准分支名下
```

##### `--onto`

```bash
git rebase --onto master server client # 把从server开始分支出来的client移到master上
```

![截取特性分支上的另一个特性分支，然后变基到其他分支。](https://www.progit.cn/images/interesting-rebase-2.png)

```bash
git checkout master
git merge client
git rebase master server
```

![将 server 中的修改变基到 master 上。](https://www.progit.cn/images/interesting-rebase-4.png)

```bash
git checkout master
git merge server
git branch -d client
git branch -d server
```

![最终的提交历史。](https://www.progit.cn/images/interesting-rebase-5.png)

#### `revert`

> Revert can be used to undo a commit in history that has already been published (pushed), whereas this can't be done with the amend or reset options without rewriting history.

```bash
# 撤销某次操作，此次操作之前和之后的 commit 和 history 都会保留，并且把这次撤销作为一次最新的提交
git revert HEAD # 撤销前一次提交操作

git revert HEAD --no-edit # 撤销前一次提交操作，并以默认的 Revert "xxx" 为提交原因

git revert -n HEAD
# 需要撤销多次操作的时候加 -n 参数，这样不会每次撤销操作都提交，而是等所有撤销都完成后一起提交

git revert master~6..master~2
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

#### `reflog`

 Git 会在后台保存一个引用日志(reflog)记录最近几个月的 HEAD 和分支引用所指向的历史

> The reflog command stores information on updates to the tip of the branches in Git, where the normal git log command shows the ancestry chain from HEAD, and the reflog command shows what HEAD has pointed to in the repository.
>
> Basically, anything that makes HEAD point to something new is recorded in the reflog

```bash
git reflog
4d047fc (HEAD -> master, origin/master) HEAD@{0}: commit: 重新组织内容结构+添加内
容
01c3278 HEAD@{1}: commit: 补充@规则和继承相关的内容
01fdec2 HEAD@{2}: commit: 补充Git基本原理(part1)
3e4d96b HEAD@{3}: commit: 补充Registry的分类
f0d4d00 HEAD@{4}: commit: 新增文件,准备整理出来
ddb581d HEAD@{5}: commit: 更改配置文件格式为yaml, 删除VSCode中设置的内容(已经自带
对TypeScript的支持)
dfab469 HEAD@{6}: pull --tags origin master: Fast-forward
```

每当HEAD 所指向的位置发生了变化，Git 就会将这个信息存储到引用日志这个历史记录里。 通过这些数据可以很方便地获取之前的提交历史。 如果想查看仓库中 HEAD 在五次前的所指向的提交可以使用 `@{n}` 来引用 reflog 中输出的提交记录。

```bash
git show HEAD@{5}
git show master@{yesterday} # 显示昨天该分支的顶端指向了哪个提交,这个方法只对还在引用日志里的数据有用
```

#### `fsck`

> The fsck command tests the object database and verifies the SHA-1 ID of the objects and the connections they make. This command can also be used to find objects that are not reachable from any named reference, as it tests all the objects found in the database, which are in the `.git/objects` folder.

```bash
git fsck --dangling
git fsck --unreachable
```

#### `gc`

```bash
git gc --prune=now
```

### Moving on the Tree

#### HEAD

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
git fetch <remote> <分支名>
git fetch <remote> <source>:<destination> # destination分支不存在时会创建
git fetch <remote> :<分支名> # 在本地创建一个新分支

git fetch <remote> refs/notes/commits:refs/notes/commits

git fetch --prune
```

#### `pull`

> `git pull` == `git fetch` + `git merge`

```bash
git pull
git pull --rebase # fetch+rebase
git pull origin <source>:<destination>

git pull --prune
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

git push <remote> tag <tag name>
git push <remote> --tags

git push <remote> refs/notes/commits
```

#### `remote`

```bash
git remote
git remote -v

git remote add <shortname> <URL>
git remote show origin
git remote rename name_from name_to
git remote remove <remote>

git remote set-head <remote> <branch> # 设置默认分支

git remote prune origin
```

> “origin” 并无特殊含义
>
> 远程仓库名字 “origin” 与分支名字 “master” 一样，在 Git 中并没有任何特别的含义一样。 同时 “master” 是当你运行 `git init` 时默认的起始分支名字，原因仅仅是它的广泛使用，“origin” 是当你运行 `git clone` 时默认的远程仓库名字。 如果你运行 `git clone -o booyah`，那么你默认的远程分支名字将会是 `booyah/master`。

#### Create a Git repo base on windows shared folder

```powershell
pushd \\remoteServer\git\Share\Folder\Path
mkdir MyGitRepo1
cd MyGitRepo1
git init --bare

# Back to local repository
popd
git remote add origin //remoteServer/git/Share/Folder/Path/MyGitRepo1  # using `/` rather than `\` in uri
git push origin --all
```

### Plumbing Commands

#### `ls-tree`

```bash
git ls-tree --abbrev HEAD
```

## `.gitignore`

### `.gitignore`をグローバル設定

#### MacOS

```bash
touch ~/.gitignore_global
vim ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
```

### 格式

文件 .gitignore 的格式规范如下：

* 所有空行或者以 `＃` 开头的行都会被 Git 忽略。
* 可以使用标准的 glob 模式匹配。
* 匹配模式可以以（`/`）开头防止递归。
* 匹配模式可以以（`/`）结尾指定目录。
* 要忽略指定模式以外的文件或目录，可以在模式前加上惊叹号（`!`）取反。

```bash
# no .a files
*.a

# but do track lib.a, even though you're ignoring .a files above
!lib.a

# only ignore the TODO file in the current directory, not subdir/TODO
/TODO

# ignore all files in the build/ directory
build/

# ignore doc/notes.txt, but not doc/server/arch.txt
doc/*.txt

# ignore all .pdf files in the doc/ directory
doc/**/*.pdf
```

[各种语言的参考](https://github.com/github/gitignore)

## `.gitattribute`

> `.gitattributes` 是一个文本文件，文件中的一行定义一个路径的若干个属性，主要用于定义每种文件的属性，以方便 Git帮我们统一管理。

### 文件格式

> gitattributes文件以行为单位设置一个路径下所有文件的属性

```gitattributes
pattern attr1 attr2 ...
```

### 状态

在gitattributes文件的一行中，一个属性（以text属性为例）可能有4种状态：

* Set: text
* Unset: -text
* Set to a value: text=string
* Unspecified

### 示例

```gitattributes
*               text=auto
*.txt      text
*.vcproj    text eol=crlf
*.sh      text eol=lf
*.jpg      -text
*.ps1      text working-tree-encoding=UTF-16LE eol=CRLF
*.c       filter=indent
```

### 属性

gitattributes文件中的常见属性：

* text，控制行尾的规范性。
  * 如果一个文本文件是规范的，则Git库中该文件的行尾总是LF
  * 对于工作目录，除了text属性之外，还可以设置eol属性，或core.eol配置变量。

* eol，设置行末字符

  * eol=lf: 入库时将行尾规范为LF，检出时行尾不强制转换为 CRLF
  * eol=crlf: 入库时将行尾规范为LF，检出时将行尾转换为CRLF

## 深入理解Git

### `.git`目录

#### `object`文件夹

#### `hooks`文件夹

> 和其它版本控制系统一样，Git 能在特定的重要动作发生时触发自定义脚本。
>
> 有两组这样的钩子：**客户端**的(由诸如提交和合并这样的操作所调用)和**服务器端**的(作用于诸如接收被推送的提交这样的联网操作)。

钩子都被存储在 Git 目录下的 `hooks` 子目录中。

当使用 `git init` 初始化一个新版本库时，Git 默认会在这个目录中放置一些示例脚本。这些脚本除了本身可以被调用外，它们还透露了被触发时所传入的参数。 所有的示例都是 shell 脚本，其中一些还混杂了 Perl 代码，不过，任何正确命名的可执行脚本都可以正常使用 —— 可以用 Ruby 或 **Python**，或其它语言编写它们。 这些示例的名字都是以 `.sample` 结尾，如果想启用它们，得先移除这个后缀。

##### 客户端钩子

###### 提交工作流钩子

* `pre-commit` :在键入提交信息前运行, 用于检查即将提交的快照
* `prepare-commit-msg`:在启动提交信息编辑器之前，默认信息被创建之后运行, 允许编辑提交者所看到的默认信息
* `commit-msg` :可以用来在提交通过前验证项目状态或提交信息
* `post-commit` :在整个提交过程完成后运行, 一般用于通知之类的事情

###### 电子邮件工作流钩子

由 `git am` 命令调用

* `applypatch-msg` : 用来确保提交信息符合格式，或直接用脚本修正格式错误
* `pre-applypatch` :运行于应用补丁之后产生提交之前，用来在提交前检查快照
* `post-applypatch` :运行于提交产生之后，是在 `git am` 运行期间最后被调用的钩子,可以用来把结果通知给一个小组或所拉取的补丁的作者

###### 其他钩子

* `pre-rebase` :运行于变基之前，以非零值退出可以中止变基的过程, 可以使用这个钩子来禁止对已经推送的提交变基

* `post-rewrite` :被那些会替换提交记录的命令调用，比如 `git commit --amend` 和 `git rebase`（不过不包括 `git filter-branch`）, 用途很大程度上跟 `post-checkout` 和 `post-merge` 差不多
* `post-checkout` :在 `git checkout` 成功运行后会被调用, 可以根据项目环境用来调整工作目录, 其中包括放入大的二进制文件、自动生成文档或进行其他类似这样的操作

* `post-merge` :在 `git merge` 成功运行后会被调用, 可以用来恢复 Git 无法跟踪的工作区数据，比如权限数据,也可以用来验证某些在 Git 控制之外的文件是否存在，这样就能在工作区改变时，把这些文件复制进来
* `pre-push` :会在 `git push` 运行期间更新了远程引用但尚未传送对象时被调用,可以在推送开始之前，用它验证对引用的更新操作
* `pre-auto-gc` :会在垃圾回收开始之前被调用，可以用来提醒现在要回收垃圾了，或者依情形判断是否要中断回收

##### 服务器端钩子

* `pre-receive`:处理来自客户端的推送操作时最先被调用,可以用这个钩子阻止对引用进行非快进（non-fast-forward）的更新，或者对该推送所修改的所有引用和文件进行访问控制。
* `update` :和 `pre-receive` 脚本十分类似，不同之处在于它会为每一个准备更新的分支各运行一次。 假如推送者同时向多个分支推送内容，`pre-receive` 只运行一次，相比之下 `update` 则会为每一个被推送的分支各运行一次。
* `post-receive` :在整个过程完结以后运行，可以用来更新其他系统服务或者通知用户。 它接受与 `pre-receive` 相同的标准输入数据。 它的用途包括给某个邮件列表发信，通知持续集成（continous integration）的服务器，或者更新问题追踪系统（ticket-tracking system） —— 甚至可以通过分析提交信息来决定某个问题（ticket）是否应该被开启，修改或者关闭

### Git对象

> Git 用以计算校验和的机制叫做 SHA-1 散列（hash，哈希）。 这是一个由 40 个十六进制字符（0-9 和 a-f）组成字符串，基于 Git 中文件的内容或目录结构计算出来。
>
> Git 数据库中保存的信息都是以文件内容的哈希值来索引，而不是文件名。

![img](https://devtutorial.io/ezoimgfmt/api.devtutorial.io/uploads/2020/07/5f1125af6b417.png?ezimgfmt=ng:webp/ngcb2)

```bash
git cat-file -t <hash> # 类型
git cat-file -p <hash> # 内容
git cat-file -s <hash> # 大小
```

#### 提交对象

* 这类对象表示修订版本
* 每个提交由一组包含0个或多个父提交的首部（键-值对）构成，实际上包含一系列链接的树对象表示版本库内容的快照——项目的顶层目录
* 用户可以使用底层命令`git commit-tree`或者只是简单地使用`git commit`命令创建一个包含给定树对象的提交，将它作为一个修订的快照

#### 树对象

* 这些对象用于表示**文件目录**
* 每个树对象是一个根据文件名排序的实体列表
* 每个实体由复合权限和类型、文件或者目录名，给定路径的已连接对象的一个链接（即SHA-1标识符），或者树对象（表示子目录）、blob对象（表示文件内容），又或者只是提交对象（表示子模块）等元素构成
* 如果不同修订之间包含一个子目录的相同内容它只会存储一次

`git cat-file -p HEAD^{tree}`

* The special notation HEAD^{tree} means that from the reference given, HEAD recursively dereferences the object at the reference until a tree object is found

* A generic form of the notation is `<rev>^<type>`, and will return the first object of `<type>`, searching recursively from `<rev>`

#### 二进制大对象(BLOB)

* 这些对象用于存储文件内容的给定版本
* 可以使用底层命令`git hash-object -w`创建一个这样的对象
* 如果不同修订版本包含的文件内容是一样的它只会存储一次

#### 标签对象

* 这些对象表示附注标签，签名标签属于特例
* 标签对象还包含一系列的首部信息（此外还指向了一个标签对象）和一个标签信息
* 用户可以使用底层命令`git mktag`或者简单地使用`git tag`命令创建一个标签



```bash
ls -lh # 获取字节数
# 用"blob <字节数>\0<字符串>" | shasum 来获取哈希值
# "\0"是Linux中的字符串终止符
echo "blob 10\0hello git" | shasum # "hello git"加上"\n"一共是10
```

```python
# 通过哈希值获取内容
import zlib

compressed_contents = open(<哈希值>, 'rb').read()
zlib.decompress(compressed_contents)
```

### 暂存和提交

暂存操作会为每一个文件计算校验和（使用SHA-1哈希算法）,然后会把当前版本的文件快照保存到 Git 仓库中（Git 使用 blob 对象来保存它们）,最终将校验和加入到暂存区域等待提交

当使用 `git commit` 进行提交操作时，Git 会先计算每一个子目录的校验和，然后在 Git 仓库中这些校验和保存为树对象。 随后，Git 便会创建一个提交对象，它除了包含上面提到的那些信息外，还包含指向这个树对象（项目根目录）的指针。如此一来，Git 就可以在需要的时候重现此次保存的快照。

![首次提交对象及其树结构](https://www.progit.cn/images/commit-and-tree.png)

非首次提交对象会包含一个指向上次提交对象（父对象）的指针。

![提交对象及其父对象。](https://www.progit.cn/images/commits-and-parents.png)

### 分支

Git 的分支，其实本质上仅仅是指向提交对象的可变指针。 Git 的默认分支名字是 `master`。 在多次提交操作之后，你其实已经有一个指向最后那个提交对象的 `master` 分支。 它会在每次的提交操作中自动向前移动。

> Git 的 “master” 分支并不是一个特殊分支。 它就跟其它分支完全没有区别。 之所以几乎每一个仓库都有 master 分支，是因为 `git init` 命令默认创建它，并且大多数人都懒得去改动它。

![分支及其提交历史](https://www.progit.cn/images/branch-and-history.png)

> HEAD 是一个对当前检出记录的符号引用 —— 也就是指向你正在其基础上进行工作的提交记录。
> HEAD 总是指向当前分支上最近一次提交记录。大多数修改提交树的 Git 命令都是从改变 HEAD 的指向开始的。
> HEAD 通常情况下是指向分支名的（如 bugFix）。在你提交时，改变了 bugFix 的状态，这一变化通过 HEAD 变得可见。

### 工作区和索引区

```bash
git ls-files # 列出索引区文件
git ls-files -s # 打印权限,哈希值, ,文件名
```

## Git SVN

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

### Fork

如果你想要参与某个项目，但是并没有推送权限，这时可以对这个项目进行“派生”。 派生的意思是指，GitHub 将在你的空间中创建一个完全属于你的项目副本，且你对其具有推送权限。

> 在以前，“fork”是一个贬义词，指的是某个人使开源项目向不同的方向发展，或者创建一个竞争项目，使得原项目的贡献者分裂。 在 GitHub，“fork”指的是你自己的空间中创建的项目副本，这个副本允许你以一种更开放的方式对其进行修改。

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

## GitLab
