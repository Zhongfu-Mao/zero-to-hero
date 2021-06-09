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

### console

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
