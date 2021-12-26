# `launch.json`的配置

## **configuration**的各个字段

[官方文档的说明](https://code.visualstudio.com/docs/editor/debugging#_launchjson-attributes)
[预先定义的各个变量](https://code.visualstudio.com/docs/editor/variables-reference)

* 必填项：
  * **name**: 启动配置的名称
  * **type**：启动配置的类型，可以是`node`（内置）或`python`等（需要插件支持）
  * **request**：启动配置的请求类型，可以是`launch`或`attach`
* 通用可选项：
  * **presentation**: 通过`order`, `group`和`hidden`键来控制启动配置的显示顺序和隐藏
  * **preLaunchTask**：启动配置的程序的预启动任务，默认为空字符串
  * **postDebugTask**：启动配置的程序的预启动任务，默认为空字符串
  * **internalConsoleOptions**：启动配置的程序的内部控制台选项，默认为`openOnSessionStart`
  * **debugServer**: debug插件作者的专属选项
  * **serverReadyOptions**：启动配置的程序的服务器准备好选项，默认为空字符串
* 各个类型的可选项：
  * **program**：启动配置的程序路径，可以是相对路径或者绝对路径，如果是相对路径，则需要在`cwd`中指定
  * **args**：为`program`提供的参数，默认为空数组
  * **env**：启动配置的程序的运行时的环境变量，默认为空对象
  * **envFile**：启动配置的程序的运行时的环境变量文件，默认为空字符串
  * **cwd**：启动配置的程序的工作目录，默认为工作区的根目录
  * **port**：启动配置的程序的端口
  * **stopOnEntry**：启动配置的程序是否在程序的入口处暂停，默认为`false`
  * **console**：启动配置的程序的控制台选项

## `Node.js`的实例

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Launch",
      "type": "node",
      "request": "launch",
      "program": "${workspaceRoot}/server.js",
      "stopOnEntry": true,
      "args": [],
      "cwd": "${workspaceRoot}",
      "runtimeExecutable": "node",
      "runtimeArgs": [],
      "env": {},
      "sourceMaps": true,
      "outFiles": [],
      "sourceMapPathOverrides": [],
      "preLaunchTask": "",
      "internalConsoleOptions": "openOnSessionStart"
    }
  ]
}
```

* **sourceMaps**：启动配置的程序是否支持源码映射，默认为`true`
* **sourceMapPathOverrides**：启动配置的程序的源码映射文件的路径，默认为空数组
* **runtimeExecutable**：启动配置的程序的运行时执行文件，默认为`node`
* **runtimeArgs**：为`runtimeExecutable`提供的参数，默认为空数组
* **outFiles**：启动配置的程序的输出文件，默认为空数组

## `Python`的实例

### `Django`的实例

### `FastAPI`的实例

## 启动浏览器的实例

### `Chrome`的实例

### `Edge`的实例
