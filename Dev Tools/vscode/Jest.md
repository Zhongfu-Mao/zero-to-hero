# VSCode中配置Jest

[Jest - Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=Orta.vscode-jest)

默认在根目录下安装Jest时自动激活

## 支持ES Module

* MacOS
  * 在zsh中配置环境变量:`export NODE_OPTIONS=--experimental-vm-modules`

* Windows
  * 全局安装`cross-env`: `npm i -g cross-env`
  * 在VSCode的插件设置中,修改`Jest Command Line`: `cross-env NODE_OPTIONS=--experimental-vm-modules npx jest`

## Debug

在`launch.json`中设置`vscode-jest-tests`:

```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "type": "node",
            "name": "vscode-jest-tests",
            "request": "launch",
            "program": "${workspaceFolder}/node_modules/jest/bin/jest",
            "args": [
              "--runInBand"
            ],
            "env": {
              "NODE_OPTIONS": "--experimental-vm-modules"
            },
            "cwd": "${workspaceFolder}",
            "console": "integratedTerminal",
            "internalConsoleOptions": "neverOpen",
            "disableOptimisticBPs": true
        }
    ]
}
```

## ESLint

在`.eslintrc.yml`的`env`中添加`jest`:

```yaml
env:
  es2021: true
  node: true
  jest: true
```

## IntelliSense

通过`npm i -D @types/jest`来获得智能提示

