# Git & GitHub

[Pro Git](https://git-scm.com/book/zh/v2)

[Learn Git Branching](https://learngitbranching.js.org/?locale=zh_CN)

[try git](https://try.github.io)

## `.gitignore`をグローバル設定

### MacOS

```bash
touch ~/.gitignore_global
vim ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
```

## VS CodeをGitのeditorにする

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
