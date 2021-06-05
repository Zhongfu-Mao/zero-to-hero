# Markdown语法

- [Markdown语法](#markdown语法)
  - [注释](#注释)
    - [代码块写法](#代码块写法)
    - [HTML写法](#html写法)
    - [Hack写法](#hack写法)
  - [标题](#标题)
    - [类atx格式](#类atx格式)
    - [类Setext格式](#类setext格式)
  - [任务列表](#任务列表)
  - [缩进、换行、空行、对齐](#缩进换行空行对齐)
    - [缩进](#缩进)
    - [换行](#换行)
    - [空行](#空行)
    - [对齐](#对齐)
  - [斜体、粗体、删除线、下划线、背景高亮](#斜体粗体删除线下划线背景高亮)
  - [字体、字号、颜色](#字体字号颜色)
  - [超链接、页内链接、自动链接、注脚](#超链接页内链接自动链接注脚)
    - [超链接](#超链接)
      - [参考式](#参考式)
      - [行内式](#行内式)
    - [页内链接](#页内链接)
    - [自动链接](#自动链接)
    - [注脚](#注脚)
  - [无序列表、有序列表](#无序列表有序列表)
    - [无序列表](#无序列表)
    - [有序列表](#有序列表)
  - [图像](#图像)
    - [行内式](#行内式-1)
    - [参考式](#参考式-1)
  - [多级引用](#多级引用)
  - [目录](#目录)
    - [使用`doctoc`](#使用doctoc)
    - [VSCode中使用Markdown-All-In-One插件](#vscode中使用markdown-all-in-one插件)
  - [代码块](#代码块)
  - [流程图](#流程图)
  - [表格](#表格)
    - [Markdown原生格式](#markdown原生格式)
    - [Markdown简化格式](#markdown简化格式)
    - [HTML格式](#html格式)
  - [LaTex公式](#latex公式)
    - [行内公式](#行内公式)
    - [整行公式](#整行公式)
  - [分隔线](#分隔线)
  - [特殊字符](#特殊字符)

## 注释

### 代码块写法

```markdown
<div style='display: none'>Comment</div>
```

### HTML写法

```html
<!-- Comment -->
```

### Hack写法

```markdown
[//]: # (哈哈我是最强注释，不会在浏览器中显示。)
[^_^]: # (哈哈我是最萌注释，不会在浏览器中显示。)
[//]: <> (哈哈我是注释，不会在浏览器中显示。)
[comment]: <> (哈哈我是注释，不会在浏览器中显示。)
```

## 标题

### 类atx格式

```markdown
# H1
## H2
### H3
#### H4
##### H5
###### H6
```

### 类Setext格式

```markdown
This is an H1
=============

This is an H2
-------------
```

## 任务列表

```markdown
- [ ] TODO
- [X] Checked
```

## 缩进、换行、空行、对齐

### 缩进

```markdown
【1】 &emsp;或&#8195; //全角
【2】 &ensp;或&#8194; //半角
【3】 &nbsp;或&#160;  //半角之半角
```

### 换行

> 由于markdown编辑器的不同,可能在一行字后面，直接换行回车，也能实现换行.  
> 但是在Visual Studio Code上，想要换行必须得在一行字后面空两个格子才行。

### 空行

> 在编辑的时候有多少个空行(只要这一行只有回车或者space没有其他的字符就算空行)，在渲染之后，只隔着一行。

### 对齐

```markdown
<center>行中心对齐</center>
<p align="left">行左对齐</p>
<p align="right">行右对齐</p>
```

## 斜体、粗体、删除线、下划线、背景高亮

```markdown
*斜体* 或 _斜体_
**粗体**
***加粗斜体***
~~删除线~~  
$\overline{上划线}$
$\underline{下划线}$
<mark>背景高亮</mark>
```

## 字体、字号、颜色

```markdown
<font face="黑体">我是黑体字</font>
<font face="微软雅黑">我是微软雅黑</font>
<font face="STCAIYUN">我是华文彩云</font>
<font color=#0099ff size=12 face="黑体">黑体</font>
<font color=gray size=5>gray</font>
<font color=#00ffff size=3>null</font>
```

## 超链接、页内链接、自动链接、注脚

### 超链接

#### 参考式

```markdown
我经常去的几个网站[Google][1]、[GitHub][2]。

[1]:http://www.google.com 
[2]:http://www.github.com
```

#### 行内式

```markdown
[显示内容](URL)
```

### 页内链接

```markdown
[显示内容](#标题)
```

### 自动链接

```markdown
<http://example.com/>  
<address@example.com>
```

### 注脚

```markdown
使用 Markdown[^1]可以效率的书写文档, 直接转换成 HTML[^2]。

[^1]:Markdown是一种纯文本标记语言

[^2]:HyperText Markup Language 超文本标记语言
```

## 无序列表、有序列表

### 无序列表

```markdown
* 无序列表项 一
+ 无序列表项 二
- 无序列表项 三
```

### 有序列表

```markdown
1. 有序列表项 一
2. 有序列表项 二
3. 有序列表项 三
```

## 图像

### 行内式

```markdown
![Alt text](/path/to/img.jpg "Optional Title")
```

### 参考式

```markdown
![Alt text][id]

[id]: url/to/image  "Optional title attribute"
```

## 多级引用

```markdown
>一级引用
>>二级引用
>>>三级引用
```

## 目录

### 使用`doctoc`

```bash
npm i doctoc -g

doctoc demo.md
```

### VSCode中使用Markdown-All-In-One插件

`Markdown all in one: Create Table of Contents`

## 代码块

```python
print("hello world")
```

## 流程图

> Markdown支持mermaid插件、flowchart.js插件流程图  
> VSCode不支持~

## 表格

>不管是哪种方式，第一行为表头，第二行分隔表头和主体部分，第三行开始每一行为一个表格行。  
>列于列之间用管道符`|`隔开。原生方式的表格每一行的两边也要有管道符。  
>第二行还可以为不同的列指定对齐方向。默认为左对齐，在`-`右边加上`:`就右对齐。  
>`-` 左对齐， `:-:` 中心对齐，`-:` 右对齐

### Markdown原生格式

```markdown
 | Name | sex | age | 
 | - | :-: | -: | 
 | Name1 | 男 | 90 | 
 | Name2 | 男 | 100 | 
 | Name3 | 女 | 90 |
```

### Markdown简化格式

```markdown
 Name | sex | age
 - | :-: | -:
 Name1 | 男 | 90
 Name2 | 男 | 100
 Name3 | 女 | 90
```

### HTML格式

```markdown
 <table>
     <tr>
         <td>ID</td>
         <td>NAME</td>
     </tr>
     <tr>
         <td>1</td>
         <td>name1</td>
     </tr>
     <tr>
         <td>2</td>
         <td>name2</td>
     </tr> 
 </table>
```

## LaTex公式

### 行内公式

质能守恒方程可以用一个很简洁的方程式$E = m c^2$来表达。

### 整行公式

```markdown
$$ 公式 $$
```

$$ x = \dfrac{-b \pm \sqrt{b^2 - 4ac}}{2a} $$

$$
[\frac{1}{\Bigl(\sqrt{\phi \sqrt{5}}-\phi\Bigr) e^{\frac25 \pi}} =
1+\frac{e^{-2\pi}} {1+\frac{e^{-4\pi}} {1+\frac{e^{-6\pi}}
{1+\frac{e^{-8\pi}} {1+\ldots} } } }]
$$

## 分隔线

```markdown
* * *
***
*****
- - -
-----------
```

## 特殊字符

```markdown
\   反斜线
`   反引号
*   星号
_   底线
{}  花括号
[]  方括号
()  括弧
#   井字号
+   加号
-   减号
.   英文句点
!   惊叹号
```
