# `.gitattribute`

> `.gitattributes` 是一个文本文件，文件中的一行定义一个路径的若干个属性，主要用于定义每种文件的属性，以方便 Git帮我们统一管理。

## 文件格式

> gitattributes文件以行为单位设置一个路径下所有文件的属性

```gitattributes
pattern attr1 attr2 ...
```

## 状态

在gitattributes文件的一行中，一个属性（以text属性为例）可能有4种状态：

* Set: text
* Unset: -text
* Set to a value: text=string
* Unspecified

## 示例

```gitattributes
*               text=auto
*.txt      text
*.vcproj    text eol=crlf
*.sh      text eol=lf
*.jpg      -text
*.ps1      text working-tree-encoding=UTF-16LE eol=CRLF
*.c       filter=indent
```

## 属性

gitattributes文件中的常见属性：

* text，控制行尾的规范性。
  * 如果一个文本文件是规范的，则Git库中该文件的行尾总是LF
  * 对于工作目录，除了text属性之外，还可以设置eol属性，或core.eol配置变量。

* eol，设置行末字符

  * eol=lf: 入库时将行尾规范为LF，检出时行尾不强制转换为 CRLF
  * eol=crlf: 入库时将行尾规范为LF，检出时将行尾转换为CRLF
