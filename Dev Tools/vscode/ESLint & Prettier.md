# VScode + ESLint + Prettier + Airbnb Style

## 参考

* [ESLint 官网](https://eslint.org/)
* [Airbnb Style Github](https://github.com/airbnb/javascript/)
* [eslint-config-airbnb](https://www.npmjs.com/package/eslint-config-airbnb)
* [Prettier](https://prettier.io/)

## VSCode中配置

1. 安装eslint和prettier插件
2. 安装包

```bash
npm init -y
npm i -D eslint prettier eslint-plugin-prettier eslint-config-prettier eslint-plugin-node eslint-config-node eslint-config-airbnb --legacy-peer-deps
./node_modules/.bin/eslint --init
```

3. 目录中创建`.prettierrc`的文件,按照json语法编写规则

4. 按照需求编辑第二步生成的`.eslintrc.(js|json|yaml)`文件

   ```json
   {
       "env": {
           "browser": true,
           "commonjs": true,
           "es2021": true
       },
       "extends": ["airbnb", "prettier", "plugin:node/recommended"],
       "plugins": ["prettier"],
       "parserOptions": {
           "ecmaVersion": 12
       },
       "rules": {
           "no-unused-vars":"warn"
       }
   }
   
   ```

5. VSCode的ESLint插件默认不检查typescript，需要添加设置项

   ```json
   {
     "eslint.validate": [
       "javascript",
       "javascriptreact",
       "vue",
       "html",
       "typescript"
     ]
   }
   ```

   



