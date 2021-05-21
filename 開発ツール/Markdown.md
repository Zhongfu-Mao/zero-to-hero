# Markdown语法

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

```markdown
# H1
## H2
### H3
#### H4
##### H5
###### H6
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

## 转义字符

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
&lt;http://example.com/&gt; &emsp;&emsp; 
&lt;address@example.com&gt;
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

```markdown
<center>
![显示文字](URL)
</center>
```

## 多级引用

## 目录

## 代码块

## 流程图

## 表格

## LaTex公式

## 分隔线

## HTML原始代码

## 特殊字符
