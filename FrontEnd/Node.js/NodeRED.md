## FBP

* FBP(Flow-based programming) is a kind of concept for software programming that defines an application with a data flow
* FBP is said to be component-oriented because these black-box processes can be connected repeatedly to form several applications without needing to be modified internally
* . FBP uses a data factory metaphor to define an application. It sees an application as a network of asynchronous processes that start at some point and do a single sequential process that does one operation at a time until it ends, rather than communicating by using a stream of structured chunks of data. This is called an information packet (IP)

## NodeRED

* Developed by IBM's Emerging Technology Services team, Node-RED is now under the OpenJS Foundation
* FBP describes the behavior of the application as a black box network, which in Node-RED is described as a "node."
* Originally, it was a just proof of concept (PoC) to help visualize and understand the mapping between Message Queue Telemetry Transport (MQTT) topics
* It is a FBP tool, suitable for making data control applications for web applications and IoT. Its development environment and execution environment are browser-based applications made with Node.js

### 安装

#### Mac

```bash
sudo npm install -g --unsafe-perm node-red
```

#### Windows

```powershell
npm install -g --unsafe-perm node-red
```

### settings.js

* Mac:`/Users/<User Name>/.node-red/settings.js`

* Windows:`C:\Users\<User Name>\.node-red\settings.js`

* ```js
  module.exports = {
    editorTheme: {
      projects: {
        enabled: true
      }
    }
  }
  ```

## NodeRED 2.0

[Version 2.0 released : Node-RED (nodered.org)](https://nodered.org/blog/2021/07/20/version-2-0-released)

主要的变化:

* node.js>12.17.x
* `node-red admin init`指令
* Monaco Text Editor
* 函数Node默认支持外部模块引用,且支持CommonJS`cjs`和ES6模块`mjs`
* `RBE`Node被重命名为`Filter`
* 移除`tail`Node
* Flow Debugger
* Flow Linter(nrlint)