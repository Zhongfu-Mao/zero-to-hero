# VScode + ESLint + Prettier + Airbnb Style

## 参考

* [ESLint 官网](https://eslint.org/)
* [ESLint - Pluggable JavaScript linter - ESLint中文](https://cn.eslint.org/)
* [Airbnb Style Github](https://github.com/airbnb/javascript/)
* [eslint-config-airbnb](https://www.npmjs.com/package/eslint-config-airbnb)
* [Prettier](https://prettier.io/)

## Prettier

Prettier强调自己是一个**Opinionated code formatter**，而且只有 few(很少) options。 
这意味着： 
  Prettier 不是一个你想如何设置就如何设置的代码风格格式化工具，不能任由你改变其输出风格。 
  其最主要的目的就是让团队停止争吵，配置项越多，就离这个主要目的越远，团队就会一直讨论应该如何配置。 
  这就是 Prettier 的哲学，而且广受欢迎。

> Opinioned: Angular那样规定了你的代码结构，让你最好按照它给你指定的方式组织代码 
> Unopinioned: Vue, React那样

### `.prettierrc.js`

```js
module.exports = {
    printWidth: 80,                    //（默认值）单行代码超出 80 个字符自动换行
    tabWidth: 2,                       //（默认值）一个 tab 键缩进相当于 2 个空格
    useTabs: true,                     // 行缩进使用 tab 键代替空格
    semi: false,                       //（默认值）语句的末尾加上分号
    singleQuote: true,                 // 使用单引号
    quoteProps: 'as-needed',           //（默认值）仅仅当必须的时候才会加上双引号
    jsxSingleQuote: true,              // 在 JSX 中使用单引号
    trailingComma: 'all',              // 不用在多行的逗号分隔的句法结构的最后一行的末尾加上逗号
    bracketSpacing: true,              //（默认值）在括号和对象的文字之间加上一个空格
    jsxBracketSameLine: true,          // 把 > 符号放在多行的 JSX 元素的最后一行
    arrowParens: 'avoid',              // 当箭头函数中只有一个参数的时候可以忽略括弧
    vueIndentScriptAndStyle: false,    //（默认值）对于 .vue 文件，不缩进 <script> 和 <style> 里的内容
    embeddedLanguageFormatting: 'off', // 不允许格式化内嵌的代码块，比如 markdown  文件里的代码块
};
```

### `prettierignore`

```
build/
package.json
public/
test/*.*
```

## VSCode中配置

1. 安装`ESLint`和`Prettier ESLint`插件
2. 初始化

```bash
npm init -y
npm i -D eslint
npx eslint --init
```

3. 安装`eslint-config-airbnb-base`依赖

```bash
npx install-peerdeps --dev eslint-config-airbnb-base
```

4. 安装剩余的依赖

```bash
npm install eslint-config-airbnb-typescript \
            @typescript-eslint/eslint-plugin \
            @typescript-eslint/parser \
            prettier prettier-eslint \
            eslint-plugin-prettier eslint-config-prettier \
            eslint-plugin-node eslint-config-node \
            --save-dev
```

5. 编辑.eslintrc.(js|json|yaml)`文件

```yaml
env:
  es2021: true
  node: true
extends:
  - 'eslint:recommended'
  - 'airbnb-base'
  - 'airbnb-typescript/base'
  - 'prettier'
  - 'plugin:@typescript-eslint/recommended'
  - 'plugin:node/recommended'
parser: '@typescript-eslint/parser'
parserOptions:
  ecmaVersion: 12
  sourceType: module
  project: './tsconfig.json'
plugins:
  - '@typescript-eslint'
rules: {}

```

## `extends`支持的配置类型

- eslint 开头的：是 ESLint 官方的扩展；
- plugin 开头的：是插件类型扩展，比如 plugin:vue/essential；
- eslint-config 开头的：来自 npm 包，使用时可以省略前缀 `eslint-config-`；
- @开头的：扩展和 eslint-config 一样，只是在 npm 包上面加了一层作用域 scope；
- 一个执行配置文件的相对路径或绝对路径；

## 常用的拓展

- `eslint:recommended`：ESLint 内置的推荐规则，即 ESLint Rules 列表中打了钩的那些规则；
- `eslint:all`：ESLint 内置的所有规则；
- `eslint-config-standard`：standard 的 JS 规范；
- `eslint-config-prettier`：关闭和 ESLint 中以及其他扩展中有冲突的规则；
- `eslint-config-airbnb-base`：airbab 的 JS 规范；
- `eslint-config-alloy`：腾讯 AlloyTeam 前端团队出品，可以很好的针对项目的技术栈进行配置选择，比如可以选 React、Vue（现已支持 Vue 3.0）、TypeScript 等；

## 插件plugins

> 引入插件是为了增强ESLint的检查能力和范围(比如Vue的模板和React的jsx)

ESLint 相关的插件的命名形式有 2 种：不带命名空间的和带命名空间的，比如：

- eslint-plugin- 开头的可以省略这部分前缀；
- @/ 开头的；

```yaml
plugins:
	- 'jquery' # eslint-plugin-jquery
	- '@jquery/jquery' # @jquery/eslint-plugin-jquery
	- '@foobar' # @foobar/eslint-plugin
```

## 规则rules

### 报错等级

规则的校验说明，有 3 个报错等级

- off 或 0：关闭对该规则的校验；
- warn 或 1：启用规则，不满足时抛出警告，且不会退出编译进程；
- error 或 2：启用规则，不满足时抛出错误，且会退出编译进程；

通常规则只需要配置开启还是关闭即可；但是也有些规则可以传入属性，比如：

```yaml
rules:
  eqeqeq: 0
  curly: error
  quotes:
    - error
    - "double"
  plugin1/rule1: error
```

### 著名的规则列表:

- ESLint rules，这整个列表对应 eslint:all，而打钩 ✔️ 的是 eslint:recommenmed；
- Prettier rules
- standard rules
- airbnb rules
- AlloyTeam vue rules

### 规则的优先级

- 如果 extends 配置的是一个数组，那么最终会将所有规则项进行合并，出现冲突的时候，后面的会覆盖前面的；
- 通过 rules 单独配置的规则优先级比 extends 高；

## 校验命令

```JSON
{
    "scripts": {
        "lint": "npx eslint --ext .js,.jsx,.vue src",
        "lint:fix": "npx eslint --fix --ext .js,.jsx,.vue src",
    }
}
```

## `.eslintignore`

> 可以在项目根目录通过创建一个 `.eslintignore` 文件来配置，告诉 ESLint 校验的时候忽略它们

```
public/
src/main.js
```

## EditorConfig

```
# 告诉 EditorConfig 插件，这是根文件，不用继续往上查找
root = true

# 匹配全部文件
[*]

# 设置字符集
charset = utf-8

# 缩进风格，可选 space、tab
indent_style = tab

# 缩进的空格数，当 indent_style = tab 将使用 tab_width
# 否则使用 indent_size
indent_size = 2
tab_width = 2

# 结尾换行符，可选 lf、cr、crlf
end_of_line = lf

# 在文件结尾插入新行
insert_final_newline = true

# 删除一行中的前后空格
trim_trailing_whitespace = true

# 匹配md结尾的文件
[*.md]
insert_final_newline = false
trim_trailing_whitespace = false
```

