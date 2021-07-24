- [Express 官网](http://expressjs.com/)

- [Express 中文文档（非官方）](http://www.expressjs.com.cn/)

- [Express GitHub 仓库](https://github.com/expressjs/express)

## Hello World

```js
// 0. 加载 Express
const express = require("express");

// 1. 调用 express() 得到一个 app
//    类似于 http.createServer()
const app = express();

// 2. 设置请求对应的处理函数
//    当客户端以 GET 方法请求 / 的时候就会调用第二个参数：请求处理函数
app.get("/", (req, res) => {
  res.send("hello world");
});

// 3. 监听端口号，启动 Web 服务
app.listen(3000, () => console.log("app listening on port 3000!"));
```

## express-generator

```bash
npm install express-generator@4.x

npx express-generator@4.x --view=hbs --git .

npm uninstall express-generator # 初始化以后卸载掉
```



## 处理静态资源

```js
// 开放 public 目录中的资源
// 不需要访问前缀
app.use(express.static("public"));

// 开放 public 目录，限制访问前缀
app.use("/public", express.static("public"));

// 开放 public 目录资源，限制访问前缀
app.use("/static", express.static("public"));

// 开放 public 目录，限制访问前缀
// path.join(__dirname, 'public') 会得到一个动态的绝对路径
app.use("/static", express.static(path.join(__dirname, "public")));
```

## 路由

### 路由方法

```js
// GET method route
app.get("/", function(req, res) {
  res.send("GET request to the homepage");
});

// POST method route
app.post("/", function(req, res) {
  res.send("POST request to the homepage");
});
```

### 路由路径

```js
// 根路径
app.get("/", function(req, res) {
  res.send("root");
});

// 一般路径
app.get("/about", function(req, res) {
  res.send("about");
});
app.get("/random.text", function(req, res) {
  res.send("random.text");
});

// 正则路径
app.get("/ab?cd", function(req, res) {
  res.send("ab?cd");
});
app.get("/ab+cd", function(req, res) {
  res.send("ab+cd");
});
app.get("/ab*cd", function(req, res) {
  res.send("ab*cd");
});
app.get("/ab(cd)?e", function(req, res) {
  res.send("ab(cd)?e");
});
app.get(/.*fly$/, function(req, res) {
  res.send("/.*fly$/");
});

// 动态路径
app.get("/users/:userId/books/:bookId", function(req, res) {
  res.send(req.params);
});
```

### `express.Router()`

```js
const express = require("express");

const router = express.Router(); // 相当于一个mini版express实例

router.get("/", function(req, res) {
  res.send("home page");
});

router.get("/about", function(req, res) {
  res.send("About page");
});

module.exports = router;
```

```js
// 在app中导入
const router = require("./router");

// ...

app.use(router);
```

## 在 Express 中获取客户端请求参数的三种方式

### 查询字符串参数

获取 `?foo=bar&id=123`

```js
console.log(req.query);
// 结果:
{
  foo: 'bar',
  id: '123'
}
```

### 请求体参数

`POST` 请求才有请求体，需要单独配置 `body-parser` 中间件才可以获取。
只要程序中配置了 `body-parser` 中间件，我们就可以通过 `req.body` 来获取表单 `POST` 请求体数据。

```js
req.body // => 得到一个请求体对象
```

### 动态的路径参数

```js
// /users/:id 要求必须以 /users/ 开头，:id 表示动态的，1、2、3、abc、dnsaj 任意都行
// 注意：:冒号很重要，如果你不加，则就变成了必须 === /users/id
// 为啥叫 id ，因为是动态的路径，服务器需要单独获取它，所以得给它起一个名字
// 那么我们就可以通过 req.params 来获取路径参数
app.get("/users/:id", (req, res, next) => {
  console.log(req.params.id);
});

// /users/*/abc
// req.params.id
app.get("/users/:id/abc", (req, res, next) => {
  console.log(req.params.id);
});

// /users/*/*
// req.params.id
// req.params.abc
app.get("/users/:id/:abc", (req, res, next) => {
  console.log(req.params.id);
});

// /*/*/*
// req.params.users
app.get("/:users/:id/:abc", (req, res, next) => {
  console.log(req.params.id);
});

// /*/id/*
app.get("/:users/id/:abc", (req, res, next) => {
  console.log(req.params.id);
});
```

## 中间件

### 应用程序级别中间件

```js
var app = express();

// 不关心请求路径
app.use(function(req, res, next) {
  console.log("Time:", Date.now());
  next();
});

// 限定请求路径
app.use("/user/:id", function(req, res, next) {
  console.log("Request Type:", req.method);
  next();
});

// 限定请求方法
app.get("/user/:id", function(req, res, next) {
  res.send("USER");
});

// 多个处理函数
app.use(
  "/user/:id",
  function(req, res, next) {
    console.log("Request URL:", req.originalUrl);
    next();
  },
  function(req, res, next) {
    console.log("Request Type:", req.method);
    next();
  }
);

// 多个路由处理函数
app.get(
  "/user/:id",
  function(req, res, next) {
    console.log("ID:", req.params.id);
    next();
  },
  function(req, res, next) {
    res.send("User Info");
  }
);

app.get("/user/:id", function(req, res, next) {
  res.end(req.params.id);
});

// 综合案例
app.get(
  "/user/:id",
  function(req, res, next) {
    // if the user ID is 0, skip to the next route
    if (req.params.id === "0") next("route");
    // otherwise pass the control to the next middleware function in this stack
    else next();
  },
  function(req, res, next) {
    // render a regular page
    res.render("regular");
  }
);

// handler for the /user/:id path, which renders a special page
app.get("/user/:id", function(req, res, next) {
  res.render("special");
});
```

### 路由级别中间件

```js
var app = express();
var router = express.Router();

// predicate the router with a check and bail out when needed
router.use(function(req, res, next) {
  if (!req.headers["x-auth"]) return next("router");
  next();
});

router.get("/", function(req, res) {
  res.send("hello, user!");
});

// use the router and 401 anything falling through
app.use("/admin", router, function(req, res) {
  res.sendStatus(401);
});
```

### 错误处理中间件

```js
// 必须是四个参数
app.use(function(err, req, res, next) {
  console.error(err.stack);
  res.status(500).send("Something broke!");
});
```

### 内置中间件

- [express.static](http://expressjs.com/en/4x/api.html#express.static) serves static assets such as HTML files, images, and so on.

- [express.json](http://expressjs.com/en/4x/api.html#express.json) parses incoming requests with JSON payloads. **NOTE: Available with Express 4.16.0+**

- [express.urlencoded](http://expressjs.com/en/4x/api.html#express.urlencoded) parses incoming requests with URL-encoded payloads. **NOTE: Available with Express 4.16.0+**

[官方支持的中间件列表](https://github.com/senchalabs/connect#middleware)

### 第三方中间件

>  官方中间件资源：http://expressjs.com/en/resources/middleware.html

