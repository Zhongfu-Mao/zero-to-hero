# 包

> 包实际上是一个存档文件，即一个目录直接打包为．zip或tar.gz格式的文件，安装后解压还原为目录

完全符合CommonJS规范的包目录应该包含如下这些文件。

❑ package.json：包描述文件。

❑ bin：用于存放可执行二进制文件的目录。

❑ lib：用于存放JavaScript代码的目录。

❑ doc：用于存放文档的目录。

❑ test：用于存放单元测试用例的代码。

# npm

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
  * 与默认情况效果相同(npm@5以后)
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

### 变体

```bash
npm install package-name@tag
npm install package-name@version
npm install package-name@version-range # 例: express@">4.1.0<5.0"
```

### 全局安装的位置

使用`npm root -g`

* macOS或Linux上: `/usr/local/lib/node_modules`
* Windows上:`C:\Users\YOU\AppData\Roaming\npm\node_modules`
* nvm:`/Users/YOU/.nvm/versions/node/v14.17.0/lib/node_modules`

## npm脚本

* 定义:在`package.json`文件中用`scripts`字段定义

* 命名规则:

  ```json
  {
      "scripts": {
          "build:dev": "...", // 开发环境
          "build:prod": "..." // 生产环境
      }
  }
  ```

  通过前缀来区分

* 查看:用`npm run`查看当前项目中的所有脚本

* 原理:
  * 每当执行`npm run`就会自动新建一个Shell来执行命令
  * 新建的Shell,会将当前目录的`node_modules/.bin`子目录加入`PATH`变量
  * 执行结束后,会将`PATH`恢复原样
  
* 通配符:
  * `*`表示任意文件名
  * `**`表示任意一层子目录
  * 必要的话用`\`转义
  
* 二进制命令简化:NPM 中所有依赖的 `node_modules/.bin` 都可以在脚本中直接访问，就像在路径中被引用的一样

  ```json
  {
      "scripts": {
          "lint": "./node_modules/.bin/eslint .",
      }
  }
  // 此写法与上面效果相同
  {
      "scripts": {
          "lint": "eslint ."
      }
  }
  ```

* 传参:
  * 需要用`--`分割来标明
  * 例:`npm run lint -- --reporter checkstyle > checkstyle.xml`
  
* 执行多个脚本:
  * 如果是并行执行（即同时的平行执行），可以使用`&`符号
  
    > 注意：这仅适用于 Unix 环境。在 Windows 中，它将按顺序运行。
  
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

  ```bash
  // 一组的都一样效果
  npm run-script start
  npm run start
  npm start
  
  npm run stop
  npm stop
  
  npm run-script test
  npm run test
  npm test
  npm t
  
  npm run stop && npm run restart && npm run start
  npm restart
  ```

* 变量:
  * 通过`npm_package_`前缀可以拿到`package.json`里面的字段
  * 例:`npm_package_name`可以拿到`name`的值
  * 嵌套的值可以通过添加下划线拿到
  
* 静默消息:

  ```bash
  # 减少错误日志
  npm run <script> --silent
  
  npm run <script> -s
  
  # 脚本名不存在时不报错
  npm run <script> --if-present
  ```

* 日志等级:

  ```bash
  "silent", "error", "warn", "notice", "http", "timing", "info", "verbose", "silly".
  ```

  * 默认值为"notice"

  * 可以使用`--loglevel <loglevel>`来明确定义运行命令时使用的日志级别

  * 简化:

    ```bash
    -s, --silent, --loglevel silent
    -q, --quiet, --loglevel warn
    -d, --loglevel info
    -dd, --verbose, --loglevel verbose
    -ddd, --loglevel silly
    ```

* 从文件中引用路径

  ```json
  {
      "scripts": {
          "hello:js": "node scripts/helloworld.js",
          "hello:bash": "bash scripts/helloworld.sh",
          "hello:cmd": "cd scripts && helloworld.cmd"
      }
  }
  ```

  * 使用`node <path.js>`来执行JS文件
  * 使用`node <path.sh>`来执行bash文件

  > 值得注意的是，如果是 cmd 或 bat 文件， 则需要先 cd 导航到对应的文件夹目录，不能像 sh， js 文件一样，直接执行，否则会报错。

## `package.json`

### 创建

```bash
npm init [-y | --yes]

npm set init.author.email <new_value> # 更改默认值
```

### 属性

```json
{
  "name": "package.json", // 项目名称,只能使用小写字母和连字符下划线
  "version": "4.21.0", // 项目当前版本（格式：major.minor.patch）
  // name和version组成npm内部的唯一标识符,如果不想发布的话可以不填
  "description": "", // 项目描述
  "dist-tags": {
    	"latest": "5.0.0",
    	"stable": "4.21.0",
  },// 列出符号标签帮助用户选择版本
  "main": "index.js", // 应用程序的入口文件
  "scripts": { // 指定运行脚本命令的 npm 命令行缩写
    "test": "echo \"Error: no test specified\" && exit 1",
    "deploy": "rsync --archive --delete local-dir user@host:/path/to/dest-dir",
    "prepublish": "npm run test"
  },
  "keywords": [], // 关键词, 会在`npm search`中列出
  "author": "NodeJS中文网 <mail@nodejs.cn> (http://nodejs.cn)",
  // 或者用下面的格式
  "author": {
    "name": "NodeJS中文网",
    "email": "mail@nodejs.cn",
    "url": "http://nodejs.cn"
  },
  "contributors": ["NodeJS中文网 <mail@nodejs.cn> (http://nodejs.cn))"], //数组
  "bugs": "https://github.com/nodejscn/node-api-cn/issues", // 软件包的问题追踪器
  "repository": "github:nodejscn/node-api-cn", //程序包仓库的位置
  "license": "ISC" // 许可证
	"engine": {
    "node": ">= 10.12.0",
    "npm": ">= 6.9.0",
    "yarn": ">= 3.0.0"
  },
	"os": ["darwin", "linux", "!win32"],
	"cpu": ["x64", "!arm"], // `process.arch`查看CPU架构
	"private": true, // npm拒绝发布私有模块
	"browserslist": [
  	"> 1%",
  	"last 2 versions",
  	"not ie <= 8"
	],
}
```

[SPDX License List | Software Package Data Exchange (SPDX)](https://spdx.org/licenses/)

### 语义版本控制

当发布新的版本时，要遵循以下规则：

- 当进行不兼容的 API 更改时，则升级主版本。
- 当以向后兼容的方式添加功能时，则升级次版本。
- 当进行向后兼容的缺陷修复时，则升级补丁版本。

npm的版本规则:

- `^`: 只会执行不更改最左边非零数字的更新。 如果写入的是 `^0.13.0`，则当运行 `npm update` 时，可以更新到 `0.13.1`、`0.13.2` 等，但不能更新到 `0.14.0` 或更高版本。 如果写入的是 `^1.13.0`，则当运行 `npm update` 时，可以更新到 `1.13.1`、`1.14.0` 等，但不能更新到 `2.0.0` 或更高版本。
- `~`: 如果写入的是 `〜0.13.0`，则当运行 `npm update` 时，会更新到补丁版本：即 `0.13.1` 可以，但 `0.14.0` 不可以。
- `>`: 接受高于指定版本的任何版本。
- `>=`: 接受等于或高于指定版本的任何版本。
- `<=`: 接受等于或低于指定版本的任何版本。
- `<`: 接受低于指定版本的任何版本。
- `=`: 接受确切的版本。
- `-`: 接受一定范围的版本。例如：`2.1.0 - 2.6.2`。
- `||`: 组合集合。例如 `< 2.1 || > 2.6`。

可以合并其中的一些符号，例如 `1.0.0 || >=1.1.0 <1.2.0`，即使用 1.0.0 或从 1.1.0 开始但低于 1.2.0 的版本。

还有其他的规则：

- 无符号: 仅接受指定的特定版本（例如 `1.2.1`）。
- `latest`: 使用可用的最新版本。

## npx

### 调用项目安装的模块

> npx 想要解决的主要问题，就是调用项目内部安装的模块

```bash
# 以执行项目内部测试工具Mocha为例
# 方法1: 在`package.json`的`scripts`字段里面定义
# 方法2: 在项目的根目录下执行
node-modules/.bin/mocha --version
# 方法3: 使用npx
npx mocha --version
```

其原理便是到`node_modules/.bin`路径和环境变量`$PATH`里面,检查命令是否存在

如果不存在,则会在安装后执行

### 避免全局安装模块

```bash
npx create-react-app my-react-app
```

上面代码运行时，npx 将`create-react-app`下载到一个临时目录，使用以后再删除。

所以，以后再次执行上面的命令，会重新下载`create-react-app`

```bash
# 允许指定版本
npx uglify-js@3.1.0 main.js -o ./dist/main.js
```

### 使用不同的Node.js版本运行代码

使用 `@` 指定版本，并将其与 `node` npm 软件包 结合使用：

```bash
npx node@10 -v #v10.18.1
npx node@12 -v #v12.14.1
```

这有助于避免使用 `nvm` 之类的工具或其他 Node.js 版本管理工具。

### 直接从URL运行任意代码片段

可以运行位于GitHub gist中的代码

```bash
npx https://gist.github.com/path/to/code
```

### 参数

* `-p --package <package>`: 指定安装的包,只在安装多个包时有必要使用
* `--no-install`:只执行命令不安装
* `--cache <path>`:指定npm缓存位置
* `--userconfig <path>`:指定用户设置文件位置
* `--shell <string>`:如果指定则用shell运行
* `--ignore-existing`:不去检查`$PATH`或`node_modules/.bin`中是否存在再下载
* `-q --quiet`:npx自身的输出不会输出,子命令中的输出依旧会被显示

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

### outdated

```bash
npm outdated
```

### update

```bash
npm update express
npm update # 升级所有npm outdated中列出的包, 会更新`package-lock.json`
```

### list

```bash
npm list [-g] [--depth=<int>]
```

### view

```bash
npm view <package-name> [versions]
```

### uninstall

```bash
npm uninstall <package-name>
npm uninstall -S <package-name>
npm uninstall -D <package-name>
npm uninstall -g <package-name>
```

# yarn

## 安装

```bash
npm install -g yarn # 实际安装的是1.X Classic版本
cd ~/path/to/project
yarn set version berry # 使用yarn 2
yarn set version latest # 升级yarn自身
```

## yarn和npm命令对比

| npm                          | yarn                         |
| ---------------------------- | ---------------------------- |
| npm help                     | yarn help                    |
| npm init                     | yarn init                    |
| npm install / npm i          | yarn install / yarn          |
| (N/A)                        | yarn install --flat          |
| (N/A)                        | yarn install --har           |
| (N/A)                        | yarn install --no-lockfile   |
| (N/A)                        | yarn install --pure-lockfile |
| npm uninstall /un            | yarn remove                  |
| npm i <模块名> --global/-g   | yarn global add              |
| npm i <模块名> --save/-S     | yarn add xxx                 |
| npm i <模块名> --save-dev/-D | yarn add <模块名> -d         |
| npm run <命令>               | yarn <命令>                  |
| npm update                   | yarn update                  |
| upm update -g                | yarn global update           |
| npm cache clean              | yarn cache clean             |
| npm upgrade                  | yarn upgrade                 |

[yarn CLI](https://yarnpkg.com/cli/install)

