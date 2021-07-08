[apiDoc - Inline Documentation for RESTful web APIs (apidocjs.com)](https://apidocjs.com/)

* 安装:`npm install apidoc -g`
* 运行:`apidoc -i myapp/ -o apidoc/ -t mytemplate/`
* CLI参数
  * `-c, --config`
  * `-e, --exclude-filters`
  * `-f, --file-filters`
  * `-i, --input`
  * `-o, --output`
  * `-t, --template`

* 配置(使用`apidoc.json`或者在`package.json`中添加`apidoc`字段)

## apiDoc-Params

### @api

```
@api {method} path [title]
```

* 必须字段,如果不写将忽略整个文档块

* method:HTTP-Request

* path:Request Path

* title:A short title

* ```javascript
  /**
   * @api {get} /user/:id
   */
  ```

### @apiDefine

```
@apiDefine name [title] [description]
```

* 每个文档块中只能出现一次

* ```js
  /**
   * @apiDefine admin User access only
   * This optional description belong to to the group admin.
   */
  
  /**
   * @api {get} /user/:id
   * @apiPermission admin
   */
  ```

### @apiDeprecated

```
@apiDeprecated [text]
```

* ```js
  /**
   * @apiDeprecated
   */
  
  /**
   * @apiDeprecated use now (#Group:Name).
   *
   * Example: to set a link to the GetDetails method of your group User
   * write (#User:GetDetails)
   */
  ```

### @apiDescription

```
@apiDescription text
```

* ```js
  /**
   * @apiDescription This is the Description.
   * It is multiline capable.
   *
   * Last line of Description.
   */
  ```

### @apiError

```
@apiError [(group)] [{type}] field [description]
```

* ```js
  /**
   * @api {get} /user/:id
   * @apiError UserNotFound The <code>id</code> of the User was not found.
   */
  ```

### @apiErrorExample

```
@apiErrorExample [{type}] [title] example
```

* ```js
  /**
   * @api {get} /user/:id
   * @apiErrorExample {json} Error-Response:
   *     HTTP/1.1 404 Not Found
   *     {
   *       "error": "UserNotFound"
   *     }
   */
  ```

### @apiExample

```
@apiExample [{type}] title example
```

* ```js
  /**
   * @api {get} /user/:id
   * @apiExample {curl} Example usage:
   *     curl -i http://localhost/user/4711
   */
  ```

### @apiGroup

```
@apiGroup name
```

* Should always be used

* ```js
  /**
   * @api {get} /user/:id
   * @apiGroup User
   */
  ```

### @apiHeader

```
@apiHeader [(group)] [{type}] [field=defaultValue] [description]
```

* ```js
  /**
   * @api {get} /user/:id
   * @apiHeader {String} access-key Users unique access-key.
   */
  ```

### @apiHeaderExample

```
@apiHeaderExample [{type}] [title] example
```

* ```js
  /**
   * @api {get} /user/:id
   * @apiHeaderExample {json} Header-Example:
   *     {
   *       "Accept-Encoding": "Accept-Encoding: gzip, deflate"
   *     }
   */
  ```

### @apiIgnore

```
@apiIgnore [hint]
```

* 放置于文档块的首部

* 具有`@apiIgnore`的文档块不会被解析

* ```js
  /**
   * @apiIgnore Not finished Method
   * @api {get} /user/:id
   */
  ```

### @apiName

```
@apiName name
```

* 应该总是被使用

* ```js
  /**
   * @api {get} /user/:id
   * @apiName GetUser
   */
  ```

### @apiParam

```
@apiParam [(group)] [{type}] [field=defaultValue] [description]
```

* {type{size}}

  * `{string{..5}}` a string that has max 5 chars.
  * `{string{2..5}}` a string that has min. 2 chars and max 5 chars.
  * `{number{100-999}}` a number between 100 and 999.

* {type=allowedValues}

  * `{string="small"}` a string that can only contain the word "small"
  * `{string="small","huge"}` a string that can contain the words "small" or "huge"
  * `{string {..5}="small","huge"}` a string that has max 5 chars and only contain the words "small" or "huge"

* ```js
  /**
   * @api {get} /user/:id
   * @apiParam {Number} id Users unique ID.
   */
  
  /**
   * @api {post} /user/
   * @apiParam {String} [firstname]       Optional Firstname of the User.
   * @apiParam {String} lastname          Mandatory Lastname.
   * @apiParam {String} country="DE"      Mandatory with default value "DE".
   * @apiParam {Number} [age=18]          Optional Age with default 18.
   *
   * @apiParam (Login) {String} pass      Only logged in users can post this.
   *                                      In generated documentation a separate
   *                                      "Login" Block will be generated.
   *
   * @apiParam {Object} [address]         Optional nested address object.
   * @apiParam {String} [address[street]] Optional street and number.
   * @apiParam {String} [address[zip]]    Optional zip code.
   * @apiParam {String} [address[city]]   Optional city.
   */
  ```

### @apiParamExample

```
@apiParamExample [{type}] [title] example
```

* ```js
  /**
   * @api {get} /user/:id
   * @apiParamExample {json} Request-Example:
   *     {
   *       "id": 4711
   *     }
   */
  ```

### @apiPermission

```
@apiPermission name
```

* ```js
  /**
   * @api {get} /user/:id
   * @apiPermission admin
   */
  ```

### @apiSampleRequest

```
@apiSampleRequest url
```

* ```js
  Configuration parameter sampleUrl: "http://api.github.com"
  /**
   * @api {get} /user/:id
   * @apiSampleRequest http://test.github.com/some_path/
   */
  ```

### @apiSuccess

```
@apiSuccess [(group)] [{type}] field [description]
```

* ```js
  /**
   * @api {get} /user/:id
   * @apiSuccess (200) {String} firstname Firstname of the User.
   * @apiSuccess (200) {String} lastname  Lastname of the User.
   */
  ```

* ```js
  /**
   * @api {get} /users
   * @apiSuccess {Object[]} profiles       List of user profiles.
   * @apiSuccess {Number}   profiles.age   Users age.
   * @apiSuccess {String}   profiles.image Avatar-Image.
   */
  ```

### @apiSuccessExample

```
@apiSuccessExample [{type}] [title] example
```

* ```js
  /**
   * @api {get} /user/:id
   * @apiSuccessExample {json} Success-Response:
   *     HTTP/1.1 200 OK
   *     {
   *       "firstname": "John",
   *       "lastname": "Doe"
   *     }
   */
  ```

### @apiUse

```
@apiUse name
```

* ```js
  /**
   * @apiDefine MySuccess
   * @apiSuccess {string} firstname The users firstname.
   * @apiSuccess {number} age The users age.
   */
  
  /**
   * @api {get} /user/:id
   * @apiUse MySuccess
   */
  ```

### @apiVersion

```
@apiVersion version
```

* ```js
  /**
   * @api {get} /user/:id
   * @apiVersion 1.6.2
   */
  ```

  

