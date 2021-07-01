# YAMLとJSONを簡単に比較する

## [JSON](https://developer.mozilla.org/ja/docs/Learn/JavaScript/Objects/JSON)

JSON (JavaScript Object Notation) は値とオブジェクトを表現する一般的な形式である

### 文法(syntax)

JavaScriptには8つの基本型があります。

* number: あらゆる種類の数値: 整数または浮動小数点
* String: 文字列。文字列は1つかより多くの文字を持ち、別の1文字型はない
* Boolean: true/false
* null: 不明な値 – 単一の値 null を持つスタンドアロン型
* undefined: 未割り当て値 – 単一の値 undefined を持つスタンドアロン型
* object: より複雑なデータ構造
* Symbol: 一意な識別子
* BigInt: 任意の長さの整数をサポートする特別な数値型

中に、  
`number`,`String`,`Boolean`,`null`はJavaScriptの文法を利用することはできる。  
`object`は決まるルールで変換する。配列は特別なobjectとして扱われる  
`undefined`,`BigInt`は利用できない。  
JSON.stringify() を使用するとき、`Symbol` をキーとしたプロパティは完全に無視される

### JavaScriptで処理する

JavaScriptは次のメソッドを提供しています:

* `JSON.stringify` : オブジェクトをJSONに変換
* `JSON.parse` : JSONをオブジェクトに変換

### Pythonで処理する

PythonでJSONを処理するならstandard libraryにある`json`を利用すればいい

### 可視化

## YAML

### 基础语法

* 大小写敏感
* 使用缩进表示层级关系
* 缩进时不允许使用Tab键，只允许使用空格。
* 缩进的空格数目不重要，只要相同层级的元素左侧对齐即可

### 支持的数据结构

* 对象：键值对的集合，又称为映射（mapping）/ 哈希（hashes） / 字典（dictionary）
* 数组：一组按次序排列的值，又称为序列（sequence） / 列表（list）
* 纯量（scalars）：单个的、不可再分的值
  * 字符串:允许用两个感叹号强制转换数据类型(`!!str 123`)
  * 布尔值: `true`和`false`
  * 整数
  * 浮点数
  * Null:`~`或`null`
  * 时间:ISO8601格式(`2001-02-03t04:05:06.07+08:00`)
  * 日期:ISO8601格式(`2008-08-08`)

```yaml
--- # 可选,标注文档头
# 列表
- Apple
- Orange
- Strawberry
- Mango

-
 - Cat
 - Dog
 - Goldfish
# 等价于[ [ 'Cat', 'Dog', 'Goldfish' ] ]

# 字典
Info:
  name: Zhongfu Mao
  job: Developer
  skills: 
  	- Python
  	- JavaScript
  	- Java
  
# Literal Style 保留换行符
- script: |
    for (var buttonNo = 1; buttonNo <= 100; buttonNo++) {
        $runAction("org.getopentest.selenium.Click", {
            locator: { id: "button" + buttonNo }
        });
    }

# +表示保留文字块末尾的换行，-表示删除字符串末尾的换行。
s1: |
  Foo

s2: |+
  Foo

s3: |-
  Foo
# 等价于
{ s1: 'Foo\n', s2: 'Foo\n\n\n', s3: 'Foo' }

# 字符串中可以插入HTML

message: |
  <p style="color: red">
    段落
  </p>

# Folder Style 折叠换行
- description: >
    This is a longer action description which spans several lines,
    which will conveniently be transformed by the YAML parser into
    a string with no end of line characters.
            
storeNumber: "123" # 不加引号时是数字型

# 包含下列特殊字符时需要加引号
# (:, {, }, [, ], ,, &, *, #, ?, |, -, <, >, =, !, %, @, \).
# 单引号和双引号都可以使用，双引号不会对特殊字符转义
s1: '内容\n字符串'
s2: "内容\n字符串"
# 转换后
{ s1: '内容\\n字符串', s2: '内容\n字符串' }
# 单引号之中如果还有单引号，必须连续使用两个单引号转义
str: 'labor''s day' 
# 转换后
{ str: 'labor\'s day' }

# 复杂的键可以用`?`来标注
? !!python/tuple [0,0]
: The Hero
? !!python/tuple [0,1]
: Treasure
? !!python/tuple [1,0]
: Treasure
? !!python/tuple [1,1]
: The Dragon
# 转化后
{
	(0, 1): 'Treasure', 
	(1, 0): 'Treasure', 
	(0, 0): 'The Hero', 
	(1, 1): 'The Dragon'
}


# 锚点&和别名*，可以用来引用。
defaults: &defaults
  adapter:  postgres
  host:     localhost

development:
  database: myapp_development
  <<: *defaults

test:
  database: myapp_test
  <<: *defaults
  
# 等价于
defaults:
  adapter:  postgres
  host:     localhost

development:
  database: myapp_development
  adapter:  postgres
  host:     localhost

test:
  database: myapp_test
  adapter:  postgres
  host:     localhost
# &用来建立锚点（defaults），<<表示合并到当前数据，*用来引用锚点

... # 可选,标注文档尾
```



### PyYAML

> **It is not safe to call `yaml.load` with any data received from an untrusted source! `yaml.load` is as powerful as `pickle.load` and so may call any Python function.** 

| YAML tag                              | Python type         |
| ------------------------------------- | ------------------- |
| Standard YAML tags                    |                     |
| !!null                                | None                |
| !!bool                                | bool                |
| !!int                                 | int                 |
| !!float                               | float               |
| !!binary                              | Bytes               |
| !!timestamp                           | datetime.datetime   |
| !!set                                 | set                 |
| !!                                    | str                 |
| !!seq                                 | list                |
| !!map                                 | dict                |
| Python-specific tags                  |                     |
| !!python/none                         | None                |
| !!python/bool                         | bool                |
| !!python/bytes                        | bytes               |
| !!python/str, !!python/unicode        | str                 |
| !!python/int, !!python/long           | int                 |
| !!python/float                        | float               |
| !!python/complex                      | complex             |
| !!python/list                         | list                |
| !!python/tuple                        | tuple               |
| !!python/dict                         | dict                |
| Complex Python tags                   |                     |
| !!python/name:module.name             | module.name         |
| !!python/module:package.module        | package.module      |
| !!python/object:module.Class          | Module.cls instance |
| !!python/object/new:module.Class      | Module.cls instance |
| !!python/object/apply:module.function | value of f(...)     |

