## 安装

```bash
npm i -D nodemon # 配合npx nodemon
npm i -g nodemon
```

## 使用

```bash
nodemon [node app] # 基本上把`node [node app]`里的node替换为nodemon即可

nodemon -h

nodemon ./server.js localhost 3000

nodemon --exec "python -v" ./app.py
nodemon --exec "npx kill-port 3000 4200 8080 && npm run start"

nodemon --watch app --watch libs app/server.js # 限定监视路径

nodemon -e js,pug # 限定监视文件类型

nodemon --ignore 'lib/*.js' --ignore tests/ # 指定忽略路径和模式

nodemon --delay 10.5 server.js # 指定延迟(单位:秒)

```

## 配置

通过`nodemon.json`:

```json
{
    "restartable": "rs",
    "ignore": [
        ".git",
        ".svn",
        "node_modules/**/node_modules",
        "*.test.js"
    ],
    "verbose": true,
    "execMap": {
        "py": "python"
    },
    "watch": [
				"config/",
   		  "router/",
    		"utils/",
    		"views/",
    		"app.ts",
    		"index.ts"
    ],
    "env": {
        "NODE_ENV": "development"
    },
    "ext": "js json"
}

```

通过`package.json`:

```json
{
  "...": "... other standard package.json values",
  "nodemonConfig": {
    "ignore": ["test/*", "docs/*"],
    "delay": 2500
  }
}

```

