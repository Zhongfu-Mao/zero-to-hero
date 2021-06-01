# Chrome & Edge Tips

## Bookmark

* Use JavaScript in Bookmark

Exp:
```js
javascript: window.location.href = window.location.href.replace(/github(1s)?.com/, (match, p1) =>  p1 ? 'github.com' : 'github1s.com')
```
