# Chrome & Edge Tips

## Bookmark

* Use JavaScript in Bookmark

Exp:
```js
javascript: window.location.href = window.location.href.replace(/github(1s)?.com/, (match, p1) =>  p1 ? 'github.com' : 'github1s.com')
```

## Extension

* [ADblock: Ublock origin](https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm)
* [Screenshot：Nimbus](https://chrome.google.com/webstore/detail/nimbus-screenshot-screen/bpconcjcammlapcogcnnelfmaeghhagj?utm_source=chrome-ntp-icon)
* [Image Preview：Imagus](https://chrome.google.com/webstore/detail/imagus/immpkjjlgappgfkkfieppnmlhakdmaab/related)
* [Images Batch Download: Imageassistant](https://chrome.google.com/webstore/detail/imageassistant-batch-imag/dbjbempljhcmhlfpfacalomonjpalpko)
* [Nuclear Weapon:tampermonkey](https://chrome.google.com/webstore/detail/tampermonkey/dhdgffkkebhmkfjojejmpbldmpobfkfo)
  * [Script Resource](https://greasyfork.org/)
* [Mouse Gestures: crxMouse](https://chrome.google.com/webstore/detail/crxmouse-chrome-gestures/jlgkpaicikihijadgifklkbpdajbkhjo)
* [Dictionary: Instant Dictionary](https://chrome.google.com/webstore/detail/instant-dictionary-by-goo/mfembjnmeainjncdflaoclcjadfhpoim)
* [CSS Quickref: CSS viewer](https://chrome.google.com/webstore/detail/cssviewer/ggfgijbpiheegefliciemofobhmofgce)

## DevTools

* console:

```javascript
document.querySelector();
$(); // do the same

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
```

* 隐身模式:隐身模式或私有模式会使用单独的用户配置文件，在浏览器重新启动之后不会保留 `Cookie，localStorage`或缓存文件之类的数据。每个会话都会以干净的状态开始，所以非常适合测试登录功能、首次渲染性能和PWA程序。
* 自动启动DevTools:
  * Windows系统下可以创建快捷方式:`"C:\Program Files\Google\Chrome\Application\chrome.exe" --incognito --auto-open-devtools-for-tabs http://localhost:8000`
    * `--incognito` :以隐身模式开始
    * `--auto-open-devtools-for-tabs`: 启动 `DevTools`
    * `--allow-insecure-localhost`: 忽略 `localhost` 域上的 `SSL` 错误
    * `--disable-extentions` :禁用影响渲染的 `Chrome` 扩展，例如广告拦截器
    * `--window-size=<width>,<height>`: 设置初始窗口大小
    * `--window-position=<x>,<y>` :设置初始窗口位置
    * `--user-data-dir="<dir>"`: 设置用户配置文件目录。

