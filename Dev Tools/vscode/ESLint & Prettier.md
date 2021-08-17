# VScode + ESLint + Prettier + Airbnb Style

## 参考

* [ESLint 官网](https://eslint.org/)
* [Airbnb Style Github](https://github.com/airbnb/javascript/)
* [eslint-config-airbnb](https://www.npmjs.com/package/eslint-config-airbnb)
* [Prettier](https://prettier.io/)

## Prettier的哲学

Prettier强调自己是一个**Opinionated code formatter**，而且只有 few(很少) options。 
这意味着： 
  Prettier 不是一个你想如何设置就如何设置的代码风格格式化工具，不能任由你改变其输出风格。 
  其最主要的目的就是让团队停止争吵，配置项越多，就离这个主要目的越远，团队就会一直讨论应该如何配置。 
  这就是 Prettier 的哲学，而且广受欢迎。

> Opinioned: Angular那样规定了你的代码结构，让你最好按照它给你指定的方式组织代码 
> Unopinioned: Vue, React那样

## VSCode中配置

1. 安装`ESLint`和`Prettier ESLint`插件
2. 安装包

```bash
npm init -y
npm i -D eslint prettier eslint-plugin-prettier eslint-config-prettier eslint-plugin-node eslint-config-node eslint-config-airbnb --legacy-peer-deps
npx eslint --init
```

3. 目录中创建`.prettierrc`的文件,按照json语法编写规则

4. 按照需求编辑第二步生成的`.eslintrc.(js|json|yaml)`文件

   ```yaml
   env:
     es2021: true
     node: true
   extends:
     - 'eslint:recommended'
     - 'prettier'
     - 'airbnb'
     - 'plugin:node/recommended'
     - 'plugin:@typescript-eslint/recommended'
   parser: '@typescript-eslint/parser'
   parserOptions:
     ecmaVersion: 12
     sourceType: module
   plugins:
     - '@typescript-eslint'
   rules: {}
   
   ```
