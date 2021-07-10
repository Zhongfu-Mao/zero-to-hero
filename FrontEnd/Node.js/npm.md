## 包

> 包实际上是一个存档文件，即一个目录直接打包为．zip或tar.gz格式的文件，安装后解压还原为目录

完全符合CommonJS规范的包目录应该包含如下这些文件。

❑ package.json：包描述文件。

❑ bin：用于存放可执行二进制文件的目录。

❑ lib：用于存放JavaScript代码的目录。

❑ doc：用于存放文档的目录。

❑ test：用于存放单元测试用例的代码。

## install命令

> 缩写`i`

### dependencies与devDependencies的区别

* `dependencies`:包含的依赖包是需要发布到生产环境中的，是项目正常运行必须依赖的包
* `DevDependencies`:包含的依赖包只在开发时使用，不用于生产环境，如果只需要项目正常运行，则不必安装这里面的包

### `npm install package`安装包

* 无参数(默认情况)
  * `npm install packageName`
  * 会安装包，并将依赖包的名称添加package.json中的dependencies字段
* `--save`参数
  * `npm install packageName --save`
  * 缩写`-S`
  * 与默认情况效果相同
* `--save-dev`参数
  * `npm install packageName --save-dev`
  * 缩写`-D`
  * 会安装包，并将依赖包的名称添加到package.json中的devDependencies字段
* `--global`参数
  * `npm install packageName --global`
  * 缩写`-g`
  * 将一个包安装为全局可用的可执行命令, 安装之后的包将位于系统预设的目录之下

> 安装某个包时，这个包中package.json的dependencies字段中的依赖会被自动安装，而devDependencies字段中的依赖不会被安装。

### `npm install`初始化项目

* 无参数直接初始化
  * 项目package.json中dependencies字段和devDependencies字段中的依赖包都会被安装
* `--production`参数
  * 只有dependencies字段中的依赖包会被安装，devDependencies中的依赖包不会被安装
* `--only=dev`参数
  * 只有devDependencies字段中的依赖包会被安装，dependencies字段中的依赖包不会被安装

## npm脚本

* 定义:在`package.json`文件中用`scripts`字段定义
* 查看:用`npm run`查看当前项目中的所有脚本
* 原理:
  * 每当执行`npm run`就会自动新建一个Shell来执行命令
  * 新建的Shell,会将当前目录的`node_modules/.bin`子目录加入`PATH`变量
  * 执行结束后,会将`PATH`恢复原样
* 通配符:
  * `*`表示任意文件名
  * `**`表示任意一层子目录
  * 必要的话用`\`转义
* 传参:
  * 需要用`--`分割来标明
  * 例:`npm run lint -- --reporter checkstyle > checkstyle.xml`
* 执行顺序:
  * 如果是并行执行（即同时的平行执行），可以使用`&`符号
  * 如果是继发执行（即只有前一个任务成功，才执行下一个任务），可以使用`&&`符号
* 钩子:
  * 有`pre`和`post`两个钩子
  * 举例:
    * `build`脚本命令的钩子是`prebuild`和`postbuild`
    * 执行`npm run build`时会自动按照`npm run prebuild && npm run build && npm run postbuild`执行
  * 默认提供的钩子:
    * prepublish，postpublish
    * preinstall，postinstall
    * preuninstall，postuninstall
    * preversion，postversion
    * pretest，posttest
    * prestop，poststop
    * prestart，poststart
    * prerestart，postrestart
  * 自定义的脚本命令也可以加上`pre`和`post`钩子
* 简写:
  * `npm start`是`npm run start`的简写
  * `npm stop`是`npm run stop`的简写
  * `npm test`是`npm run test`的简写
  * `npm restart`是`npm run stop && npm run restart && npm run start`的简写
* 变量:
  * 通过`npm_package_`前缀可以拿到`package.json`里面的字段
  * 例:`npm_package_name`可以拿到`name`的值
  * 嵌套的值可以通过添加下划线拿到

## `package.json`

### 创建

```bash
npm init [-y | --yes]

npm set init.author.email <new_value> # 更改默认值
```

```json
{
  "name": "package.json", # 项目名称
  "version": "1.0.0", # 项目版本（格式：大版本.次要版本.小版本）
  "description": "", # 项目描述
  "main": "index.js", # 入口文件
  "scripts": { # 指定运行脚本命令的 npm 命令行缩写
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "keywords": [], # 关键词, 会在`npm search`中列出
  "author": "", # 作者
  "license": "ISC" # 许可证
	"engine": {
    "node": ">= 10.12.0",
    "npm": ">= 6.9.0"
  },
	"os": ["darwin", "linux", "!win32"],
	"cpu": ["x64", "!arm"],
	"private": true, # npm拒绝发布私有模块

}
```

[SPDX License List | Software Package Data Exchange (SPDX)](https://spdx.org/licenses/)

### version

| Value       | Description                               |
| :---------- | :---------------------------------------- |
| `~version`  | "Approximately equivalent to version"[^1] |
| `^version`  | "Compatible with version"[^2]             |
| `version`   | Must match version exactly                |
| `>version`  | Must be greater than version              |
| `>=version` | etc                                       |
| `<version`  |
| `<=version` |
| `1.2.x`     | 1.2.0, 1.2.1, etc., but not 1.3.0         |
| `*`         | Matches any version                       |
| `latest`    | Obtains latest release                    |

[^1]: will update you to all future patch versions, without incrementing the **minor** version. ~1.2.3 will use releases from 1.2.3 to <1.3.0.
[^2]: will update you to all future minor/patch versions, without incrementing the **major** version. ^2.3.4 will use releases from 2.3.4 to <3.0.0.

## [npm CLI命令](https://docs.npmjs.com/cli/v7/commands)

### npm-config

```bash
npm config set <key>=<value> [<key>=<value> ...]
npm config get [<key> [<key> ...]]
npm config delete <key> [<key> ...]
npm config list [--json]
npm config edit
npm set <key>=<value> [<key>=<value> ...]
npm get [<key> [<key> ...]]

alias: c
```

