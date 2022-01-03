# flake8的使用

## 安装

```shell
pip install flake8

conda install flake8
```

## 依赖的库

```shell
$ pip show flake8 | grep Requires
Requires: mccabe, pycodestyle, pyflakes
```

* mccabe: 计算单元代码的[McCabe](http://www.mccabe.com/)指数
* pycodestyle: 代码风格检查
* pyflakes: 代码格式检查

## 配置

```ini
# FastAPI的设置: https://github.com/tiangolo/fastapi/blob/master/.flake8
[flake8]
max-line-length = 88
select = C,E,F,W,B,B9
ignore = E203, E501, W503
exclude = __init__.py
```

[🔗选项一览](https://flake8.pycqa.org/en/latest/user/options.html#index-of-options)

* max-line-length: 最大行长度, 默认79
* select: 选择检查的类型, 默认`E,F,W,C90`
  * [🔗官网的说明](https://flake8.pycqa.org/en/latest/user/violations.html#selecting-violations-with-flake8)
* ignore: 忽略的检查, 默认`E121,E123,E126,E226,E24,E704,W503,W504`
  * [🔗pycodestyle的错误码](https://pycodestyle.pycqa.org/en/latest/intro.html#error-codes)
  * [🔗flake8的错误码](https://flake8.pycqa.org/en/latest/user/error-codes.html#error-violation-codes)
* exclude: 排除的文件, 默认`.svn,CVS,.bzr,.hg,.git,__pycache__,.tox,.nox,.eggs,*.egg`

📢注意: 命令行参数的优先级大于配置文件

## VSCode中启用`.flake8`

```json
{
    "python.linting.enabled": true,
    "python.linting.flake8Enabled": true,
    "python.linting.flake8Args": [
        "--config=.flake8"
    ],
}
