# Bookmark

* Use JavaScript in Bookmark

Exp:
```js
javascript: window.location.href = window.location.href.replace(/github(1s)?.com/, (match, p1) =>  p1 ? 'github.com' : 'github1s.com')
```

# Extension

* [ADblock: Ublock origin](https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm)
* [Screenshot：Nimbus](https://chrome.google.com/webstore/detail/nimbus-screenshot-screen/bpconcjcammlapcogcnnelfmaeghhagj?utm_source=chrome-ntp-icon)
* [Image Preview：Imagus](https://chrome.google.com/webstore/detail/imagus/immpkjjlgappgfkkfieppnmlhakdmaab/related)
* [Images Batch Download: Imageassistant](https://chrome.google.com/webstore/detail/imageassistant-batch-imag/dbjbempljhcmhlfpfacalomonjpalpko)
* [Nuclear Weapon:tampermonkey](https://chrome.google.com/webstore/detail/tampermonkey/dhdgffkkebhmkfjojejmpbldmpobfkfo)
  * [Script Resource](https://greasyfork.org/)
* [Mouse Gestures: crxMouse](https://chrome.google.com/webstore/detail/crxmouse-chrome-gestures/jlgkpaicikihijadgifklkbpdajbkhjo)
* [Dictionary: Instant Dictionary](https://chrome.google.com/webstore/detail/instant-dictionary-by-goo/mfembjnmeainjncdflaoclcjadfhpoim)
* [CSS Quickref: CSS viewer](https://chrome.google.com/webstore/detail/cssviewer/ggfgijbpiheegefliciemofobhmofgce)

# DevTools

## copying & saving

### `copy()`

```javascript
copy(<object>); // 复制到剪切板
copy($_);
copy($0);
```

### store as global variable

在`console`中打印数据后,可以右键选择`Store as global variable`

根据使用的次数,依次生成`temp1`,`temp2`...变量

### stack trace

`console`打印的堆栈追踪信息可以右键保存

### copy HTML

* 点击`HTML`元素边的`...`,选择`复制`
* 选中元素后`Ctrl + C`

## 快捷键

### 切换`DevTools`面板

* `Ctrl(Command) + [`和`Ctrl(Command) + ]` -> 从当前面板向左和向右切换
* `Ctrl(Command) + <number>` -> 直接跳转(默认没有启用,需要在设置里面开启),这个快捷键在浏览器窗口可以跳转对应标签页

## command

### 打开方式

* `Ctrl(Command) + Shift + P`
* `...`按钮下的`Run command`

### 实用命令

* 截图(screenshot)
* 暗黑模式(theme)
* 时间戳(timestamp)

## Snippets

在`Source`面板下的`Snippets`栏中新建,然后在`Command Menu`里面用`!`来调用

## console

### `$`

```javascript
$(); // document.querySelector()
$$(); // document.querySelectorAll()
$x(<XPath表达式>); 

$0-$4; // 五个最近在元素面板选择过的DOM元素的历史记录，$0是最新的记录
$_; // 最近一次计算过的表达式的值
   
$i(<package>); // 导入npm库,需要安装"Console Importer"插件
```

### 打印

```javascript
console.assert(expression, object);
console.clear();
console.count([label]);
console.countReset([label]);
console.debug(object [, object, ...]);
console.dir(object);//Prints a JSON representation of the specified object
console.dirxml(node);//Prints an XML representation of the descendants of node.
console.error(object [, object, ...]);
console.group(label);
console.groupCollapsed(label);
console.groupEnd(label);
console.info(object [, object, ...]);
console.log(object [, object, ...]);
console.table(array);
console.time([label]);
console.timeEnd([label]);
console.trace();
console.warn(object [, object, ...]);

dir(<object>); // console.dir()
dirxml(<node>); // console.dirxml()
clear();

console.log('%c666','color:#f40;font-size:50px'); // 用`%c`来加上CSS样式
```

### Live expression

点击`Console`面板下的眼睛图标来创建, 可以定义任何JavaScript表达式

### 自动启动DevTools

Windows系统下可以创建快捷方式:

`"C:\Program Files\Google\Chrome\Application\chrome.exe" --incognito --auto-open-devtools-for-tabs http://localhost:8000`

* `--incognito` :以隐身模式开始
* `--auto-open-devtools-for-tabs`: 启动 `DevTools`
* `--allow-insecure-localhost`: 忽略 `localhost` 域上的 `SSL` 错误
* `--disable-extentions` :禁用影响渲染的 `Chrome` 扩展，例如广告拦截器
* `--window-size=<width>,<height>`: 设置初始窗口大小
* `--window-position=<x>,<y>` :设置初始窗口位置
* `--user-data-dir="<dir>"`: 设置用户配置文件目录。
